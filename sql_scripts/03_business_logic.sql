
CREATE OR REPLACE PROCEDURE analiza_risk_sucursala(p_id_sucursala IN NUMBER) IS
    TYPE t_istoric_tranzactii IS VARRAY(5) OF NUMBER(12,2);
    v_tranzactii_recente t_istoric_tranzactii;
    TYPE t_lista_sume_credite IS TABLE OF NUMBER(12,2);
    v_datorii_client t_lista_sume_credite := t_lista_sume_credite();
    TYPE t_statistica_dobanda IS TABLE OF NUMBER(15,2) INDEX BY VARCHAR2(50);
    v_stats_sucursala t_statistica_dobanda;
    v_nume_sucursala Sucursala.denumire%TYPE;
    v_total_datorie  NUMBER(12,2);
    v_cheie_index    VARCHAR2(50);
    CURSOR c_contracte IS
        SELECT
            cl.nume || ' ' || cl.prenume AS nume_client,
            cl.cod_client,
            cr.nume AS nume_credit,
            cr.tip_dobanda,
            bd.suma_acordata AS suma_imprumutata,
            bd.cod_contbancar
        FROM Sucursala s
        JOIN Unitate_Bancara u ON s.cod_sucursala = u.cod_sucursala
        JOIN Angajat a ON u.cod_unitate = a.cod_unitate
        JOIN Beneficiaza_de bd ON a.cod_angajat = bd.cod_angajat
        JOIN Client cl ON bd.cod_client = cl.cod_client
        JOIN Credit cr ON bd.cod_credit = cr.cod_credit
        WHERE s.cod_sucursala = p_id_sucursala;

BEGIN
    SELECT denumire INTO v_nume_sucursala
    FROM Sucursala WHERE cod_sucursala = p_id_sucursala;

    DBMS_OUTPUT.PUT_LINE('RAPORT ANALIZA RISK: ' || v_nume_sucursala);
    v_tranzactii_recente := t_istoric_tranzactii();
    FOR r_contr IN c_contracte LOOP
        DBMS_OUTPUT.PUT_LINE('Procesare Client: ' || r_contr.nume_client || ' | Credit: ' || r_contr.nume_credit);
        v_tranzactii_recente := t_istoric_tranzactii();
        FOR r_tr IN (SELECT suma
                     FROM Tranzactie
                     WHERE cod_cont_sursa = r_contr.cod_contbancar
                     ORDER BY data_ora DESC FETCH FIRST 5 ROWS ONLY)
        LOOP
            v_tranzactii_recente.EXTEND;
            v_tranzactii_recente(v_tranzactii_recente.LAST) := r_tr.suma;
        END LOOP;
        IF v_tranzactii_recente.COUNT > 0 THEN
            DBMS_OUTPUT.PUT('   - Ultimele tranzactii (max 5): ');
            FOR i IN 1..v_tranzactii_recente.COUNT LOOP
                DBMS_OUTPUT.PUT(v_tranzactii_recente(i) || ' RON; ');
            END LOOP;
            DBMS_OUTPUT.NEW_LINE;
        ELSE
            DBMS_OUTPUT.PUT_LINE('   - Nicio tranzactie recenta.');
        END IF;
        SELECT suma_acordata
        BULK COLLECT INTO v_datorii_client
        FROM Beneficiaza_de
        WHERE cod_client = r_contr.cod_client;
        v_total_datorie := 0;
        IF v_datorii_client.COUNT > 0 THEN
            FOR i IN v_datorii_client.FIRST .. v_datorii_client.LAST LOOP
                v_total_datorie := v_total_datorie + v_datorii_client(i);
            END LOOP;
            DBMS_OUTPUT.PUT_LINE('   - Grad Indatorare (Total Credite): ' || v_total_datorie || ' RON');
        END IF;
        IF NOT v_stats_sucursala.EXISTS(r_contr.tip_dobanda) THEN
            v_stats_sucursala(r_contr.tip_dobanda) := 0;
        END IF;
        v_stats_sucursala(r_contr.tip_dobanda) := v_stats_sucursala(r_contr.tip_dobanda) + r_contr.suma_imprumutata;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('STATISTICA PENTRU SUCURSALA (Pe Tip Dobanda)');
    v_cheie_index := v_stats_sucursala.FIRST;

    WHILE v_cheie_index IS NOT NULL LOOP
        DBMS_OUTPUT.PUT_LINE('Tip Dobanda: ' || v_cheie_index || ' | Total Acordat: ' || v_stats_sucursala(v_cheie_index) || ' RON');
        v_cheie_index := v_stats_sucursala.NEXT(v_cheie_index);
    END LOOP;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Eroare: Sucursala nu exista sau nu are date.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Eroare neasteptata: ' || SQLERRM);
END;
/

BEGIN
    analiza_risk_sucursala(2);
END;
/

BEGIN
    analiza_risk_sucursala(1);
END;
/

BEGIN
    analiza_risk_sucursala(9999);
END;
/

-- 7

CREATE OR REPLACE PROCEDURE raport_lichiditate_depozite IS
    CURSOR c_constituiri_active (p_id_depozit NUMBER) IS
        SELECT c.suma,
               c.data_maturitate,
               cl.nume,
               cl.prenume
        FROM Constituie c
        JOIN Cont_bancar cb ON c.cod_cont_bancar = cb.cod_contbancar
        JOIN Client cl ON cb.cod_client = cl.cod_client
        WHERE c.cod_oferta_depozit = p_id_depozit
          AND c.status = 'activ';

    v_total_suma_atrasa   NUMBER(15, 2);
    v_total_dobanda_plata NUMBER(15, 2);
    v_nr_clienti          NUMBER;
    v_dobanda_individuala NUMBER(15, 2);

BEGIN
    DBMS_OUTPUT.PUT_LINE('RAPORT LICHIDITATE SI DOBANZI DEPOZITE');
    DBMS_OUTPUT.PUT_LINE('Data generarii: ' || TO_CHAR(SYSDATE, 'DD-MM-YYYY HH24:MI'));
    FOR v_oferta IN (
        SELECT cod_depozit, nume, dobanda_anuala, perioada_luni
        FROM Depozit
        ORDER BY dobanda_anuala DESC
    ) LOOP
        v_total_suma_atrasa := 0;
        v_total_dobanda_plata := 0;
        v_nr_clienti := 0;

        DBMS_OUTPUT.PUT_LINE('PRODUS: ' || UPPER(v_oferta.nume));
        DBMS_OUTPUT.PUT_LINE('   - Dobanda: ' || v_oferta.dobanda_anuala || '% | Perioada: ' || v_oferta.perioada_luni || ' luni');
        FOR v_const IN c_constituiri_active(v_oferta.cod_depozit) LOOP
            v_nr_clienti := v_nr_clienti + 1;

            v_dobanda_individuala := v_const.suma * (v_oferta.dobanda_anuala / 100) * (v_oferta.perioada_luni / 12);
            v_total_suma_atrasa := v_total_suma_atrasa + v_const.suma;
            v_total_dobanda_plata := v_total_dobanda_plata + v_dobanda_individuala;

            DBMS_OUTPUT.PUT_LINE('      > Client: ' || v_const.nume || ' ' || v_const.prenume ||
                                 ' | Suma: ' || v_const.suma ||
                                 ' | Scadenta: ' || TO_CHAR(v_const.data_maturitate, 'DD.MM.YYYY'));
        END LOOP;
        IF v_nr_clienti > 0 THEN
            DBMS_OUTPUT.PUT_LINE('   TOTAL PRODUS: ' || v_total_suma_atrasa || ' RON (Dobanzi estimate: ' || ROUND(v_total_dobanda_plata, 2) || ' RON)');
        ELSE
            DBMS_OUTPUT.PUT_LINE('   (Fara subscrieri active)');
        END IF;
    END LOOP;
END;
/

BEGIN
    raport_lichiditate_depozite;
END;
/
-- 8
CREATE OR REPLACE FUNCTION verificare_status_card_client (
    p_nume VARCHAR2,
    p_prenume VARCHAR2,
    p_ultimele_4_cifre VARCHAR2
) RETURN VARCHAR2 IS
    v_status_card    Card.status%TYPE;
    v_data_expirare  Card.data_expirare%TYPE;
    v_status_cont    Cont_bancar.status%TYPE;
    e_cont_blocat    EXCEPTION;
    e_card_expirat   EXCEPTION;
    PRAGMA EXCEPTION_INIT(e_cont_blocat, -20001);
    PRAGMA EXCEPTION_INIT(e_card_expirat, -20002);

BEGIN
    SELECT cd.status, cd.data_expirare, cb.status
    INTO v_status_card, v_data_expirare, v_status_cont
    FROM Client cl
    JOIN Cont_bancar cb ON cl.cod_client = cb.cod_client
    JOIN Card cd ON cb.cod_contbancar = cd.cod_contbancar
    WHERE UPPER(cl.nume) = UPPER(p_nume)
      AND UPPER(cl.prenume) = UPPER(p_prenume)
      AND SUBSTR(cd.nr_card, -4) = p_ultimele_4_cifre;
    IF v_data_expirare < SYSDATE THEN
        RAISE e_card_expirat;
    END IF;
    IF v_status_cont IN ('blocat', 'inchis') THEN
        RAISE e_cont_blocat;
    END IF;
    RETURN 'VALID: ' || v_status_card;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'EROARE: Nu a fost gasit niciun card cu terminația ' || p_ultimele_4_cifre || ' pentru clientul ' || p_nume;
    WHEN TOO_MANY_ROWS THEN
        RETURN 'EROARE: Confuzie de identitate! Mai multe carduri gasite cu aceleași date.';
    WHEN e_card_expirat THEN
        RETURN 'REFUZAT: Cardul a expirat la data de ' || TO_CHAR(v_data_expirare, 'DD-MM-YYYY');
    WHEN e_cont_blocat THEN
        RETURN 'REFUZAT: Cardul este valid, dar CONTUL bancar asociat este ' || v_status_cont;
    WHEN OTHERS THEN
        RETURN 'EROARE SISTEM: ' || SQLERRM;
END;
/

DECLARE
    v_rezultat VARCHAR2(200);
BEGIN

    v_rezultat := verificare_status_card_client('Ionescu', 'Elena', '0004');
    DBMS_OUTPUT.PUT_LINE('TEST VALID: ' || v_rezultat);

    v_rezultat := verificare_status_card_client('SC IT Solutions SRL', NULL, '0025');
    DBMS_OUTPUT.PUT_LINE('TEST EXPIRAT: ' || v_rezultat);

    v_rezultat := verificare_status_card_client('SC Construct Vest SA', NULL, '0026');
    DBMS_OUTPUT.PUT_LINE('TEST CONT BLOCAT: ' || v_rezultat);

    v_rezultat := verificare_status_card_client('NumeInexistent', 'PrenumeInexistent', '0000');
    DBMS_OUTPUT.PUT_LINE('TEST NU EXISTA CLIENTUL: ' || v_rezultat);

    v_rezultat := verificare_status_card_client('Popescu', 'Andrei', '9999');
    DBMS_OUTPUT.PUT_LINE('TEST NU EXISTA CARDUL: ' || v_rezultat);
END;
/


-- 9

CREATE OR REPLACE PROCEDURE verifica_eligibilitate_asigurare (
    p_cod_identificare IN  Client.cod_identificare%TYPE,
    p_tip_asigurare    IN  Asigurare.tip_asigurare%TYPE,
    p_rezultat_analiza OUT VARCHAR2,
    p_suma_asigurata   OUT NUMBER
) IS
    v_nume_client      Client.nume%TYPE;
    v_nume_oras        Oras.nume%TYPE;
    v_status_cont      Cont_bancar.status%TYPE;
    v_tip_cont         Cont_bancar.tip_cont%TYPE;
    v_sold_curent      Cont_bancar.sold_curent%TYPE;
    v_limita_credit    Cont_bancar.limita_credit%TYPE;
    v_furnizor         Asigurare.furnizor%TYPE;
    v_prima_asigurare  Asigurare.prima_asigurare%TYPE;
    v_data_expirare    Incheie.data_expirare%TYPE;

    v_fonduri_disponibile NUMBER(12, 2) := 0;

    e_cont_inactiv         EXCEPTION;
    e_fonduri_insuficiente EXCEPTION;
    e_reinnoire_prematura  EXCEPTION;

BEGIN
    SELECT
        c.nume || ' ' || c.prenume, o.nume, cb.status, cb.tip_cont,
        cb.sold_curent, cb.limita_credit, a.furnizor,
        a.prima_asigurare, i.suma_asigurata, i.data_expirare
    INTO
        v_nume_client, v_nume_oras, v_status_cont,v_tip_cont,
        v_sold_curent,v_limita_credit,v_furnizor,v_prima_asigurare,
        p_suma_asigurata, v_data_expirare
    FROM Client c
    JOIN Oras o ON c.cod_oras = o.cod_oras
    JOIN Incheie i ON c.cod_client = i.cod_client
    JOIN Cont_bancar cb ON i.cod_cont_bancar = cb.cod_contbancar
    JOIN Asigurare a ON i.cod_asigurare = a.cod_asigurare
    WHERE c.cod_identificare = p_cod_identificare
      AND a.tip_asigurare = p_tip_asigurare;

    IF v_status_cont != 'activ' THEN
        RAISE e_cont_inactiv;
    END IF;

    IF v_data_expirare > ADD_MONTHS(SYSDATE, 1) THEN
        RAISE e_reinnoire_prematura;
    END IF;

    IF v_tip_cont = 'CREDIT' THEN
        v_fonduri_disponibile := v_sold_curent + v_limita_credit;
    ELSE
        v_fonduri_disponibile := v_sold_curent;
    END IF;

    IF v_fonduri_disponibile < v_prima_asigurare THEN
        RAISE e_fonduri_insuficiente;
    END IF;

    p_rezultat_analiza := 'APROBAT: Fonduri suficiente (' || v_fonduri_disponibile || ' RON). ' ||
                          'Polita (' || v_furnizor || ') se va reinnoi. Prima: ' || v_prima_asigurare || ' RON.';

EXCEPTION
    WHEN e_cont_inactiv THEN
        p_rezultat_analiza := 'RESPINS: Contul ' || v_tip_cont || ' este ' || v_status_cont || '. Nu se poate procesa plata.';
    WHEN e_reinnoire_prematura THEN
        p_rezultat_analiza := 'AMANAT: Polita expira la ' || TO_CHAR(v_data_expirare, 'DD-MM-YYYY') ||
                              '. Reinnoirea permisa doar in ultima luna.';
    WHEN e_fonduri_insuficiente THEN
        p_rezultat_analiza := 'RESPINS: Fonduri insuficiente. Disponibil: ' || v_fonduri_disponibile ||
                              ' RON vs Prima: ' || v_prima_asigurare || ' RON.';
    WHEN NO_DATA_FOUND THEN
        p_suma_asigurata := 0;
        p_rezultat_analiza := 'EROARE: Nu s-a gasit polita sau clientul specificat.';
    WHEN TOO_MANY_ROWS THEN
        p_suma_asigurata := 0;
        p_rezultat_analiza := 'EROARE CRITICA: Duplicitate in datele contractuale.';
    WHEN OTHERS THEN
        p_suma_asigurata := 0;
        p_rezultat_analiza := 'EROARE SISTEM: ' || SQLERRM;
END;
/

DECLARE
    v_rezultat_msg VARCHAR2(400);
    v_suma_out     NUMBER;

    TYPE t_scenariu IS RECORD (
        cnp_client     VARCHAR2(20),
        tip_asigurare  VARCHAR2(50),
        descriere_test VARCHAR2(100)
    );

    TYPE t_lista_teste IS TABLE OF t_scenariu;
    v_teste t_lista_teste;

BEGIN
    v_teste := t_lista_teste(
        t_scenariu('90001', 'Asigurare Viata', 'CAZ 1: SUCCES (Cont Debit, Fonduri OK, Expira curand)'),
        t_scenariu('90002', 'Asigurare Viata', 'CAZ 2: RESPINS (Contul este Blocat - Exception User)'),
        t_scenariu('90003', 'Asigurare Viata', 'CAZ 3: AMANAT (Reinnoire Prematura > 30 zile - Exception User)'),
        t_scenariu('90004', 'Asigurare Viata', 'CAZ 4: RESPINS (Fonduri Insuficiente - Exception User)'),
        t_scenariu('90005', 'Asigurare Viata', 'CAZ 5: EROARE (Too Many Rows - Existent 2 polite identice)'),
        t_scenariu('0000000000000', 'Asigurare Viata', 'CAZ 6: EROARE (No Data Found - Client inexistent)')
    );
    FOR i IN v_teste.FIRST .. v_teste.LAST LOOP
        DBMS_OUTPUT.PUT_LINE('TEST #' || i || ': ' || v_teste(i).descriere_test);
        DBMS_OUTPUT.PUT_LINE('   > INPUT: CNP=' || v_teste(i).cnp_client || ' | Tip=' || v_teste(i).tip_asigurare);

        verifica_eligibilitate_asigurare(
            p_cod_identificare => v_teste(i).cnp_client,
            p_tip_asigurare    => v_teste(i).tip_asigurare,
            p_rezultat_analiza => v_rezultat_msg,
            p_suma_asigurata   => v_suma_out
        );

        DBMS_OUTPUT.PUT_LINE('   > REZULTAT: ' || v_rezultat_msg);
        IF v_suma_out > 0 THEN
            DBMS_OUTPUT.PUT_LINE('   > SUMA ASIGURATA RETURNATA: ' || v_suma_out);
        END IF;
    END LOOP;
END;
/
