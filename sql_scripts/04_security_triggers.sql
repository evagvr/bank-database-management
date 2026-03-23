
CREATE OR REPLACE TRIGGER trg_securitate_portofoliu_credite
    BEFORE INSERT OR UPDATE OR DELETE ON Credit
DECLARE
    v_zi_saptamana VARCHAR2(1);
    v_ora_curenta  NUMBER(2);
BEGIN
    v_zi_saptamana := TO_CHAR(SYSDATE, 'D');
    v_ora_curenta  := TO_NUMBER(TO_CHAR(SYSDATE, 'HH24'));

    IF (v_zi_saptamana IN ('1', '7')) OR (v_ora_curenta NOT BETWEEN 9 AND 18) THEN
        IF INSERTING THEN
             RAISE_APPLICATION_ERROR(-20001, 'Securitate: Lansarea de noi produse de creditare este permisa doar in timpul orelor de program (L-V, 09-18).');
        ELSIF UPDATING THEN
             RAISE_APPLICATION_ERROR(-20002, 'Securitate: Ajustarea produselor de credit este permisa doar in timpul orelor de program (L-V, 09-18).');
        ELSIF DELETING THEN
             RAISE_APPLICATION_ERROR(-20003, 'Securitate: Retragerea produselor de creditare este permisa doar in timpul orelor de program (L-V, 09-18).');
        END IF;

    END IF;
    DBMS_OUTPUT.PUT_LINE('Acces permis. Se initiaza actualizarea portofoliului de credite...');
END;
/

-- incercare de inserare
INSERT INTO Credit (cod_credit, nume, dobanda_referinta, suma_maxima, tip_dobanda, marja_banca)
VALUES (20,'Credit Ipotecar Premium', 4.5, 500000, 'Variabila', 1.2);

-- incercare de actualizare
UPDATE Credit
SET marja_banca = marja_banca + 0.5
WHERE cod_credit = 1;
-- incercare de stergere
DELETE FROM Credit WHERE nume = 'Credit Ipotecar Premium';

-- 11
CREATE OR REPLACE TRIGGER trg_validare_tranzactie
    BEFORE INSERT ON Tranzactie
    FOR EACH ROW
DECLARE
    v_sold_sursa      Cont_bancar.sold_curent%TYPE;
    v_limita_credit   Cont_bancar.limita_credit%TYPE;
    v_status_cont     Cont_bancar.status%TYPE;
    v_tip_cont        Cont_bancar.tip_cont%TYPE;

    v_cont_card       Card.cod_contbancar%TYPE;
    v_status_card     Card.status%TYPE;

    e_fonduri_insuficiente   EXCEPTION;
    e_cont_inactiv           EXCEPTION;
    e_frauda_card            EXCEPTION;
    e_card_inactiv           EXCEPTION;
BEGIN
    BEGIN
        SELECT sold_curent, limita_credit, status, tip_cont
        INTO v_sold_sursa, v_limita_credit, v_status_cont, v_tip_cont
        FROM Cont_bancar
        WHERE cod_contbancar = :NEW.cod_cont_sursa;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20005, 'Contul sursa specificat nu exista.');
    END;

    IF v_status_cont != 'activ' THEN
        RAISE e_cont_inactiv;
    END IF;

    IF :NEW.cod_card IS NOT NULL THEN
        BEGIN
            SELECT cod_contbancar, status
            INTO v_cont_card, v_status_card
            FROM Card
            WHERE cod_card = :NEW.cod_card;

            IF v_cont_card != :NEW.cod_cont_sursa THEN
                RAISE e_frauda_card;
            END IF;

            IF v_status_card != 'activ' THEN
                RAISE e_card_inactiv;
            END IF;

        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                 RAISE_APPLICATION_ERROR(-20006, 'Cardul specificat nu exista.');
            WHEN e_frauda_card THEN
                 RAISE;
            WHEN e_card_inactiv THEN
                 RAISE;
        END;
    END IF;

    IF v_tip_cont IN ('DEBIT', 'ECONOMII') THEN
        IF v_sold_sursa < :NEW.suma THEN
            RAISE e_fonduri_insuficiente;
        END IF;
    ELSIF v_tip_cont = 'CREDIT' THEN
        IF (v_sold_sursa + v_limita_credit) < :NEW.suma THEN
            RAISE e_fonduri_insuficiente;
        END IF;
    END IF;
    DBMS_OUTPUT.PUT_LINE('Validare reușita. Tranzacția poate fi procesata.');

EXCEPTION
    WHEN e_cont_inactiv THEN
        RAISE_APPLICATION_ERROR(-20001, 'Securitate: Contul sursa nu este activ.');
    WHEN e_fonduri_insuficiente THEN
        RAISE_APPLICATION_ERROR(-20002, 'Fonduri Insuficiente: Suma depaseste soldul disponibil.');
    WHEN e_frauda_card THEN
        RAISE_APPLICATION_ERROR(-20003, 'Eroare: Cardul utilizat nu aparține contului sursa selectat!');
    WHEN e_card_inactiv THEN
        RAISE_APPLICATION_ERROR(-20004, 'Refuzat: Cardul utilizat este expirat, blocat sau furat.');
END;
/
INSERT INTO Client (cod_client, nume, prenume, cod_identificare, tip_client, telefon)
VALUES (150, 'Ionescu', 'Ioana', '2900101123456', 'Persoana Fizica', '0744113562');

INSERT INTO Cont_bancar (cod_contbancar, iban, tip_cont, moneda, sold_curent, limita_credit, status, cod_client)
VALUES (2001, 'RO01CREDIT0000', 'CREDIT', 'RON', -500, 2000, 'activ', 150);

INSERT INTO Cont_bancar (cod_contbancar, iban, tip_cont, moneda, sold_curent, limita_credit, status, cod_client)
VALUES (2002, 'RO02DEBIT00000', 'DEBIT', 'RON', 100, 0, 'activ', 150);

INSERT INTO Card (cod_card, nr_card, data_expirare, status, cod_contbancar)
VALUES (3001, '1111222233334444', SYSDATE+365, 'activ', 2001);
-- reusita
INSERT INTO Tranzactie (cod_tranzactie, suma, detalii, canal_operatiune, cod_cont_sursa, cod_card)
VALUES (
    9001,
    1000,
    'Cumparaturi Online - Valid',
    'ONLINE',
    2001,
    3001
);
-- nereusita
INSERT INTO Tranzactie (cod_tranzactie, suma, detalii, canal_operatiune, cod_cont_sursa, cod_card)
VALUES (
    9003,
    50,
    'Incercare Frauda - Card Gresit',
    'ATM',
    2002,
    3001
);

-- 12

CREATE TABLE Jurnal_Securitate_DDL (
    id_log NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    data_eveniment TIMESTAMP DEFAULT SYSTIMESTAMP,
    utilizator VARCHAR2(50),
    operatiune VARCHAR2(30),
    nume_obiect VARCHAR2(100),
    status_actiune VARCHAR2(20)
);

CREATE TABLE Arhiva_Recuperare_Date (
    id_arhiva NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nume_tabel_sters VARCHAR2(100),
    data_backup TIMESTAMP DEFAULT SYSTIMESTAMP,
    utilizator VARCHAR2(50),
    continut_backup CLOB
);


CREATE OR REPLACE TRIGGER trg_protectie_si_backup
    BEFORE DDL ON SCHEMA
DECLARE
    v_operatiune   VARCHAR2(30);
    v_nume_obiect  VARCHAR2(100);
    v_tip_obiect   VARCHAR2(30);
    v_xml_continut CLOB;
    TYPE t_lista_critica IS TABLE OF VARCHAR2(30);
    v_tabele_critice t_lista_critica := t_lista_critica('TRANZACTIE', 'CONT_BANCAR',
        'CLIENT', 'ANGAJAT', 'BENEFICIAZA_DE', 'CONSTITUIE', 'INCHEIE',
        'JURNAL_SECURITATE_DDL', 'ARHIVA_RECUPERARE_DATE');

    v_este_critic BOOLEAN := FALSE;
BEGIN
    v_operatiune  := ORA_SYSEVENT;
    v_nume_obiect := ORA_DICT_OBJ_NAME;
    v_tip_obiect  := ORA_DICT_OBJ_TYPE;
    IF v_tip_obiect = 'TABLE' AND v_operatiune IN ('DROP', 'TRUNCATE') THEN

        FOR i IN 1..v_tabele_critice.COUNT LOOP
            IF UPPER(v_nume_obiect) = v_tabele_critice(i) THEN
                v_este_critic := TRUE;
                EXIT;
            END IF;
        END LOOP;
        IF v_este_critic THEN
            INSERT INTO Jurnal_Securitate_DDL (utilizator, operatiune, nume_obiect, status_actiune)
            VALUES (ORA_LOGIN_USER, v_operatiune, v_nume_obiect, 'BLOCAT');
            RAISE_APPLICATION_ERROR(-20001,
                'SECURITATE: Actiune interzisa! Tabelul ' || v_nume_obiect || ' este protejat impotriva stergerii/trunchierii.');
        ELSE
            IF UPPER(v_nume_obiect) NOT IN ('JURNAL_SECURITATE_DDL', 'ARHIVA_RECUPERARE_DATE') THEN
                BEGIN
                    v_xml_continut := DBMS_XMLGEN.GETXML('SELECT * FROM ' || v_nume_obiect);
                    IF v_xml_continut IS NOT NULL THEN
                        INSERT INTO Arhiva_Recuperare_Date (nume_tabel_sters, utilizator, continut_backup)
                        VALUES (v_nume_obiect, ORA_LOGIN_USER, v_xml_continut);
                    END IF;
                    INSERT INTO Jurnal_Securitate_DDL (utilizator, operatiune, nume_obiect, status_actiune)
                    VALUES (ORA_LOGIN_USER, v_operatiune, v_nume_obiect, 'PERMIS+BACKUP');
                    DBMS_OUTPUT.PUT_LINE('S-a efectuat backup automat pentru tabelul: ' || v_nume_obiect);
                EXCEPTION
                    WHEN OTHERS THEN
                        DBMS_OUTPUT.PUT_LINE('Atentie: Backup-ul a esuat, dar tabelul se sterge. Eroare: ' || SQLERRM);
                END;
            END IF;
        END IF;
    END IF;
END;
/

DROP TABLE Client;


CREATE TABLE Proiecte_Vechi (id number, nume_proiect varchar2(50));
INSERT INTO Proiecte_Vechi VALUES (100, 'Campanie Vara 2023');
INSERT INTO Proiecte_Vechi VALUES (101, 'Audit Intern 2022');
COMMIT;


DROP TABLE Proiecte_Vechi;


SELECT * FROM Jurnal_Securitate_DDL;
SELECT * FROM Arhiva_Recuperare_Date;


SELECT XMLTYPE(continut_backup)
FROM Arhiva_Recuperare_Date
WHERE nume_tabel_sters = 'PROIECTE_VECHI';

SELECT x.*
FROM Arhiva_Recuperare_Date a,
     XMLTABLE('/ROWSET/ROW'
              PASSING XMLTYPE(a.continut_backup)
              COLUMNS
                  id   NUMBER        PATH 'ID',
                  nume VARCHAR2(100) PATH 'NUME_PROIECT'
             ) x
WHERE a.nume_tabel_sters = 'PROIECTE_VECHI';