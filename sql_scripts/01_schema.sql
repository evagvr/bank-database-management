-- 4
CREATE TABLE Oras (
    cod_oras INT PRIMARY KEY,
    nume VARCHAR2(50) UNIQUE NOT NULL
);


CREATE TABLE Sucursala (
    cod_sucursala INT PRIMARY KEY,
    denumire VARCHAR2(100) UNIQUE NOT NULL,
    cod_oras UNIQUE NUMBER NOT NULL,
    strada_sediu_central VARCHAR2(200),
    telefon VARCHAR2(10),
    CONSTRAINT chk_sucursala_telefon CHECK (LENGTH(telefon) = 10),
    CONSTRAINT fk_sucursala_oras FOREIGN KEY (cod_oras)
        REFERENCES Oras(cod_oras)
);

CREATE TABLE Unitate_Bancara (
    cod_unitate INT PRIMARY KEY,
    denumire VARCHAR2(100),
    strada VARCHAR2(200),
    cod_sucursala NUMBER NOT NULL,
    telefon VARCHAR2(10),
    CONSTRAINT fk_unitate_sucursala FOREIGN KEY (cod_sucursala)
        REFERENCES Sucursala(cod_sucursala),
    CONSTRAINT chk_unitate_telefon CHECK (LENGTH(telefon) = 10)
);

CREATE TABLE Angajat (
    cod_angajat INT PRIMARY KEY,
    cod_unitate NUMBER NOT NULL,
    nume VARCHAR2(50) NOT NULL,
    prenume VARCHAR2(50) NOT NULL,
    functie VARCHAR2(50),
    salariu NUMBER(10, 2),
    data_angajarii DATE DEFAULT SYSDATE,
    telefon VARCHAR2(15),
    email VARCHAR2(100),
    CONSTRAINT fk_angajat_unitate FOREIGN KEY (cod_unitate)
        REFERENCES Unitate_Bancara(cod_unitate),
    CONSTRAINT chk_angajat_salariu CHECK (salariu > 0),
    CONSTRAINT chk_angajat_telefon CHECK (LENGTH(telefon) = 10)
);

CREATE TABLE Client (
    cod_client INT PRIMARY KEY,
    tip_client VARCHAR2(20),
    nume VARCHAR2(50) NOT NULL,
    prenume VARCHAR2(50),
    cod_identificare VARCHAR2(13) UNIQUE,
    cod_oras NUMBER,
    email VARCHAR2(100),
    telefon VARCHAR2(15),
    data_nasterii DATE,
    venit NUMBER(10, 2),
    CONSTRAINT fk_client_oras FOREIGN KEY (cod_oras)
        REFERENCES Oras(cod_oras),
    CONSTRAINT chk_client_tip CHECK (tip_client IN ('Persoana Fizica', 'Persoana Juridica')),
    CONSTRAINT chk_client_tel CHECK (LENGTH(telefon) = 10),
    CONSTRAINT chk_client_venit CHECK (venit >= 0)
);

CREATE TABLE Cont_bancar (
    cod_contbancar INT PRIMARY KEY,
    iban VARCHAR2(34) UNIQUE NOT NULL,
    moneda VARCHAR2(3) DEFAULT 'RON',
    tip_cont VARCHAR2(20),
    sold_curent NUMBER(12, 2) DEFAULT 0,
    data_deschidere DATE DEFAULT SYSDATE,
    status VARCHAR2(20) CHECK (status IN ('activ', 'blocat', 'inchis')),
    limita_credit DECIMAL(15, 2) DEFAULT 0,
    cod_client NUMBER NOT NULL,
    CONSTRAINT fk_cont_client FOREIGN KEY (cod_client)
        REFERENCES Client(cod_client),
    CONSTRAINT chk_cont_tip CHECK (tip_cont IN ('CREDIT', 'DEBIT', 'ECONOMII')),
    CONSTRAINT chk_cont_debit CHECK (
            (tip_cont = 'DEBIT' AND limita_credit = 0)
            OR
            (tip_cont = 'ECONOMII' AND limita_credit = 0)
            OR
            (tip_cont = 'CREDIT' AND limita_credit > 0)
        )
);

CREATE TABLE Card (
    cod_card INT PRIMARY KEY,
    nr_card VARCHAR2(16) UNIQUE NOT NULL,
    data_expirare DATE NOT NULL,
    status VARCHAR2(20),
    cod_contbancar NUMBER NOT NULL,
    CONSTRAINT fk_card_cont FOREIGN KEY (cod_contbancar)
        REFERENCES Cont_bancar(cod_contbancar),
    CONSTRAINT chk_card_len CHECK (LENGTH(nr_card) = 16),
    CONSTRAINT chk_card_status CHECK (status IN ('activ', 'expirat', 'furat', 'blocat'))
);

CREATE TABLE Tranzactie (
    cod_tranzactie INT PRIMARY KEY,
    data_ora DATE DEFAULT SYSDATE,
    suma NUMBER(12, 2),
    detalii VARCHAR2(200),
    canal_operatiune VARCHAR2(50),
    cod_cont_sursa NUMBER NOT NULL,
    cod_cont_destinatie NUMBER,
    cod_card NUMBER,
    iban_cont_destinatie_extern VARCHAR2(34),
    CONSTRAINT fk_tranz_sursa FOREIGN KEY (cod_cont_sursa)
        REFERENCES Cont_bancar(cod_contbancar),
    CONSTRAINT fk_tranz_dest FOREIGN KEY (cod_cont_destinatie)
        REFERENCES Cont_bancar(cod_contbancar),
    CONSTRAINT fk_tranz_card FOREIGN KEY (cod_card)
        REFERENCES Card(cod_card),
    CONSTRAINT chk_conturi_diferite CHECK (cod_cont_sursa != cod_cont_destinatie),
    CONSTRAINT chk_tranzactie_suma CHECK (suma > 0),
    CONSTRAINT chk_tranzactie_canal CHECK (canal_operatiune IN ('ATM', 'POS', 'ONLINE','Transfer Intern', 'Transfer Extern')),
    CONSTRAINT chk_tranzactie_logica CHECK (
            (
                canal_operatiune IN ('POS', 'ATM', 'ONLINE')
                AND
                cod_card IS NOT NULL
                AND
                cod_cont_destinatie IS NULL
                AND
                iban_cont_destinatie_extern IS NULL
            )
            OR
            (
                canal_operatiune = 'Transfer Intern'
                AND
                cod_card IS NULL
                AND
                cod_cont_destinatie IS NOT NULL
                AND
                cod_cont_destinatie != cod_cont_sursa
                AND
                iban_cont_destinatie_extern IS NULL
            )
            OR
            (
                canal_operatiune = 'Transfer Extern'
                AND
                cod_card IS NULL
                AND
                iban_cont_destinatie_extern IS NOT NULL
            )
        )
);

CREATE TABLE Audit_Tranzactie (
    cod_audit INT PRIMARY KEY,
    cod_tranzactie NUMBER NOT NULL,
    cod_angajat NUMBER NOT NULL,
    motiv_verificare VARCHAR2(200),
    rezultat_verificare VARCHAR2(20),
    data_audit DATE DEFAULT SYSDATE,
    CONSTRAINT fk_audit_tranzactie FOREIGN KEY (cod_tranzactie)
        REFERENCES Tranzactie(cod_tranzactie),
    CONSTRAINT fk_audit_angajat FOREIGN KEY (cod_angajat)
        REFERENCES Angajat(cod_angajat),
    CONSTRAINT chk_audit_rezultat CHECK (rezultat_verificare IN ('aprobat', 'respins'))
);

CREATE TABLE Depozit (
    cod_depozit INT PRIMARY KEY,
    nume VARCHAR2(100),
    dobanda_anuala NUMBER(4, 2),
    perioada_luni NUMBER,
    suma_minima NUMBER(10, 2),
    CONSTRAINT chk_depozit_perioada CHECK (perioada_luni > 0)
);

CREATE TABLE Asigurare (
    cod_asigurare INT PRIMARY KEY,
    tip_asigurare VARCHAR2(50),
    prima_asigurare NUMBER(10,2),
    furnizor VARCHAR2(100),
    comision_banca NUMBER(5, 2)
);

CREATE TABLE Credit (
    cod_credit INT PRIMARY KEY,
    nume VARCHAR2(100),
    dobanda_referinta NUMBER(4, 2),
    suma_maxima NUMBER(12, 2),
    tip_dobanda VARCHAR2(20),
    marja_banca NUMBER(4, 2)
);

CREATE TABLE Beneficiaza_de (
    cod_beneficiazade INT PRIMARY KEY,
    data_semnare DATE DEFAULT SYSDATE,
    data_scadenta DATE,
    suma_acordata NUMBER(12, 2) NOT NULL,
    dobanda NUMBER(4, 2),
    status VARCHAR2(20),
    rata_lunara NUMBER(10,2),
    cod_client NUMBER NOT NULL,
    cod_angajat NUMBER NOT NULL,
    cod_credit NUMBER NOT NULL,
    cod_contbancar NUMBER NOT NULL,
    CONSTRAINT fk_bnfc_cont FOREIGN KEY (cod_contbancar)
        REFERENCES Cont_bancar(cod_contbancar),
    CONSTRAINT fk_bnfc_client FOREIGN KEY (cod_client)
        REFERENCES Client(cod_client),
    CONSTRAINT fk_bnfc_angajat FOREIGN KEY (cod_angajat)
        REFERENCES Angajat(cod_angajat),
    CONSTRAINT fk_bnfc_tip_credit FOREIGN KEY (cod_credit)
        REFERENCES Credit(cod_credit),
    CONSTRAINT chk_bnfc_date CHECK (data_scadenta > data_semnare),
    CONSTRAINT chk_bnfc_suma CHECK (suma_acordata > 0),
    CONSTRAINT chk_bnfc_dobanda CHECK (dobanda >= 0 AND dobanda <= 100),
    CONSTRAINT chk_bnfc_status CHECK (status IN ('activ', 'inactiv'))
);

CREATE TABLE Constituie (
    cod_constituie INT PRIMARY KEY,
    cod_oferta_depozit NUMBER NOT NULL,
    cod_cont_bancar NUMBER NOT NULL,
    data_maturitate DATE,
    suma NUMBER(12, 2),
    status VARCHAR2(20),
    CONSTRAINT fk_cnst_depozit FOREIGN KEY (cod_oferta_depozit)
        REFERENCES Depozit(cod_depozit),
    CONSTRAINT fk_cnst_cont FOREIGN KEY (cod_cont_bancar)
        REFERENCES Cont_bancar(cod_contbancar),
    CONSTRAINT chk_cnst_suma CHECK (suma > 0),
    CONSTRAINT chk_cnst_status CHECK (status IN ('activ', 'lichidat', 'inactiv'))

);

CREATE TABLE Incheie (
    cod_incheie INT PRIMARY KEY,
    cod_client NUMBER NOT NULL,
    cod_asigurare NUMBER NOT NULL,
    data_start DATE DEFAULT SYSDATE,
    data_expirare DATE,
    suma_asigurata NUMBER(12, 2),
    cod_cont_bancar NUMBER NOT NULL,
    CONSTRAINT fk_inch_client FOREIGN KEY (cod_client)
        REFERENCES Client(cod_client),
    CONSTRAINT fk_inch_oferta FOREIGN KEY (cod_asigurare)
        REFERENCES Asigurare(cod_asigurare),
    CONSTRAINT fk_inch_cont FOREIGN KEY (cod_cont_bancar)
        REFERENCES Cont_bancar(cod_contbancar),
    CONSTRAINT chk_inch_perioada CHECK (data_expirare > data_start),
    CONSTRAINT chk_inch_suma CHECK (suma_asigurata > 0)
);
