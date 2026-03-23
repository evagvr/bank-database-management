INSERT INTO Oras (cod_oras, nume) VALUES (1, 'Bucuresti');
INSERT INTO Oras (cod_oras, nume) VALUES (2, 'Cluj-Napoca');
INSERT INTO Oras (cod_oras, nume) VALUES (3, 'Timisoara');
INSERT INTO Oras (cod_oras, nume) VALUES (4, 'Iasi');
INSERT INTO Oras (cod_oras, nume) VALUES (5, 'Constanta');

INSERT INTO Sucursala (cod_sucursala, denumire, cod_oras, strada_sediu_central, telefon)
VALUES (1, 'BSF Sucursala Bucuresti', 1, 'Bulevardul Unirii nr. 10', '0215112234');
INSERT INTO Sucursala (cod_sucursala, denumire, cod_oras, strada_sediu_central, telefon)
VALUES (2, 'BSF Sucursala Cluj-Napoca', 2, 'Strada Memorandumului nr. 5', '0264111573');
INSERT INTO Sucursala (cod_sucursala, denumire, cod_oras, strada_sediu_central, telefon)
VALUES (3, 'BSF Sucursala Timisoara', 3, 'Piata Victoriei nr. 2', '0256126181');
INSERT INTO Sucursala (cod_sucursala, denumire, cod_oras, strada_sediu_central, telefon)
VALUES (4, 'BSF Sucursala Iasi', 4, 'Bulevardul Stefan cel Mare nr. 1', '0232117113');
INSERT INTO Sucursala (cod_sucursala, denumire, cod_oras, strada_sediu_central, telefon)
VALUES (5, 'BSF Sucursala Constanta', 5, 'Bulevardul Mamaia nr. 50', '0241161185');

INSERT INTO Unitate_Bancara (cod_unitate, denumire, strada, cod_sucursala, telefon) VALUES (1, 'BSF Agentia Dristor', 'Soseaua Mihai Bravu nr. 20', 1, '0218252321');
INSERT INTO Unitate_Bancara (cod_unitate, denumire, strada, cod_sucursala, telefon) VALUES (2, 'BSF Agentia Unirii', 'Bd. Unirii nr. 5', 1, '0214623212');
INSERT INTO Unitate_Bancara (cod_unitate, denumire, strada, cod_sucursala, telefon) VALUES (3, 'BSF Agentia Piata Romana', 'Calea Dorobanti nr. 2', 1, '0212327289');
INSERT INTO Unitate_Bancara (cod_unitate, denumire, strada, cod_sucursala, telefon) VALUES (4, 'BSF Agentia Piata Victoriei', 'Strada Vasile Alecsandri nr. 1', 1, '0219212327');
INSERT INTO Unitate_Bancara (cod_unitate, denumire, strada, cod_sucursala, telefon) VALUES (5, 'BSF Agentia Obor', 'Strada Oborul Nou nr. 1', 1, '0218452523');
INSERT INTO Unitate_Bancara (cod_unitate, denumire, strada, cod_sucursala, telefon) VALUES (6, 'BSF Agentia Manastur', 'Calea Manastur nr. 8', 2, '0264228235');
INSERT INTO Unitate_Bancara (cod_unitate, denumire, strada, cod_sucursala, telefon) VALUES (7, 'BSF Agentia Marasti', 'Strada Bucuresti nr. 3', 2, '0264228795');
INSERT INTO Unitate_Bancara (cod_unitate, denumire, strada, cod_sucursala, telefon) VALUES (8, 'BSF Agentia Grigorescu', 'Strada Hateg nr. 2', 2, '0264327798');
INSERT INTO Unitate_Bancara (cod_unitate, denumire, strada, cod_sucursala, telefon) VALUES (9, 'BSF Agentia Complex', 'Aleea Studentilor nr. 3', 3, '0256722923');
INSERT INTO Unitate_Bancara (cod_unitate, denumire, strada, cod_sucursala, telefon) VALUES (10, 'BSF Agentia Soarelui', 'Strada Cozia nr. 3', 3, '0256712957');
INSERT INTO Unitate_Bancara (cod_unitate, denumire, strada, cod_sucursala, telefon) VALUES (11, 'BSF Agentia Copou', 'Bulevardul Carol I nr. 15', 4, '0232128295');
INSERT INTO Unitate_Bancara (cod_unitate, denumire, strada, cod_sucursala, telefon) VALUES (12, 'BSF Agentia Tomis Nord', 'Strada Cismelei nr. 4', 5, '0241922823');

INSERT INTO Angajat (cod_angajat, cod_unitate, nume, prenume, functie, salariu, data_angajarii, telefon, email)
VALUES (1, 6, 'Popescu', 'Ion', 'Director Agentie', 7500.00, TO_DATE('2020-03-15', 'YYYY-MM-DD'), '0722000001', 'ion.popescu@bsf.ro');
INSERT INTO Angajat (cod_angajat, cod_unitate, nume, prenume, functie, salariu, data_angajarii, telefon, email)
VALUES (2, 6, 'Ionescu', 'Maria', 'Consultant Bancar', 4500.00, TO_DATE('2021-06-20', 'YYYY-MM-DD'), '0722000002', 'maria.ionescu@bsf.ro');
INSERT INTO Angajat (cod_angajat, cod_unitate, nume, prenume, functie, salariu, data_angajarii, telefon, email)
VALUES (3, 6, 'Georgescu', 'Andrei', 'Ofiter Credite', 3200.00, TO_DATE('2022-01-10', 'YYYY-MM-DD'), '0722000003', 'andrei.georgescu@bsf.ro');
INSERT INTO Angajat (cod_angajat, cod_unitate, nume, prenume, functie, salariu, data_angajarii, telefon, email)
VALUES (4, 6, 'Dumitrescu', 'Elena', 'Ofiter Credite', 5200.00, TO_DATE('2019-11-05', 'YYYY-MM-DD'), '0722000004', 'elena.dumitrescu@bsf.ro');
INSERT INTO Angajat (cod_angajat, cod_unitate, nume, prenume, functie, salariu, data_angajarii, telefon, email)
VALUES (5, 9, 'Stan', 'Vasile', 'Director Agentie', 7200.00, TO_DATE('2020-08-12', 'YYYY-MM-DD'), '0722000005', 'vasile.stan@bsf.ro');
INSERT INTO Angajat (cod_angajat, cod_unitate, nume, prenume, functie, salariu, data_angajarii, telefon, email)
VALUES (6, 9, 'Marin', 'Ioana', 'Consultant Bancar', 4600.00, TO_DATE('2021-02-28', 'YYYY-MM-DD'), '0722000006', 'ioana.marin@bsf.ro');
INSERT INTO Angajat (cod_angajat, cod_unitate, nume, prenume, functie, salariu, data_angajarii, telefon, email)
VALUES (7, 9, 'Dobre', 'Radu', 'Ofiter Credite', 3300.00, TO_DATE('2022-05-15', 'YYYY-MM-DD'), '0722000007', 'radu.dobre@bsf.ro');
INSERT INTO Angajat (cod_angajat, cod_unitate, nume, prenume, functie, salariu, data_angajarii, telefon, email)
VALUES (8, 11, 'Stoica', 'Alexandru', 'Director Agentie', 7100.00, TO_DATE('2021-01-20', 'YYYY-MM-DD'), '0722000008', 'alexandru.stoica@bsf.ro');
INSERT INTO Angajat (cod_angajat, cod_unitate, nume, prenume, functie, salariu, data_angajarii, telefon, email)
VALUES (9, 11, 'Tudor', 'Ana', 'Consultant Bancar', 4400.00, TO_DATE('2022-03-10', 'YYYY-MM-DD'), '0722000009', 'ana.tudor@bsf.ro');
INSERT INTO Angajat (cod_angajat, cod_unitate, nume, prenume, functie, salariu, data_angajarii, telefon, email)
VALUES (10, 1, 'Preda', 'Cristian', 'Consultant Bancar', 4300.00, TO_DATE('2022-07-01', 'YYYY-MM-DD'), '0722000010', 'cristian.preda@bsf.ro');
INSERT INTO Angajat (cod_angajat, cod_unitate, nume, prenume, functie, salariu, data_angajarii, telefon, email)
VALUES (12, 2, 'Florea', 'Carmen', 'Consultant Bancar', 4550.00, TO_DATE('2021-09-14', 'YYYY-MM-DD'), '0722000012', 'carmen.florea@bsf.ro');
INSERT INTO Angajat (cod_angajat, cod_unitate, nume, prenume, functie, salariu, data_angajarii, telefon, email)
VALUES (11, 12, 'Nistor', 'Gabriel', 'Director Agentie', 7000.00, TO_DATE('2020-05-22', 'YYYY-MM-DD'), '0722000011', 'gabriel.nistor@bsf.ro');
INSERT INTO Angajat (cod_angajat, cod_unitate, nume, prenume, functie, salariu, data_angajarii, telefon, email)
VALUES (18, 12, 'Cristea', 'Diana', 'Director Agentie', 7400.00, TO_DATE('2019-09-15', 'YYYY-MM-DD'), '0722000018', 'diana.cristea@bsf.ro');
INSERT INTO Angajat (cod_angajat, cod_unitate, nume, prenume, functie, salariu, data_angajarii, telefon, email)
VALUES (13, 7, 'Munteanu', 'Adrian', 'Ofiter Credite', 3150.00, TO_DATE('2022-11-30', 'YYYY-MM-DD'), '0722000013', 'adrian.munteanu@bsf.ro');
INSERT INTO Angajat (cod_angajat, cod_unitate, nume, prenume, functie, salariu, data_angajarii, telefon, email)
VALUES (14, 8, 'Sandu', 'Roxana', 'Consultant Bancar', 4700.00, TO_DATE('2021-04-18', 'YYYY-MM-DD'), '0722000014', 'roxana.sandu@bsf.ro');
INSERT INTO Angajat (cod_angajat, cod_unitate, nume, prenume, functie, salariu, data_angajarii, telefon, email)
VALUES (15, 10, 'Moldovan', 'Sergiu', 'Director Agentie', 6900.00, TO_DATE('2020-12-05', 'YYYY-MM-DD'), '0722000015', 'sergiu.moldovan@bsf.ro');
INSERT INTO Angajat (cod_angajat, cod_unitate, nume, prenume, functie, salariu, data_angajarii, telefon, email)
VALUES (16, 4, 'Stefan', 'Andreea', 'Casier', 3400.00, TO_DATE('2022-08-25', 'YYYY-MM-DD'), '0722000016', 'andreea.stefan@bsf.ro');
INSERT INTO Angajat (cod_angajat, cod_unitate, nume, prenume, functie, salariu, data_angajarii, telefon, email)
VALUES (17, 11, 'Lazar', 'Mihai', 'Consultant Bancar', 4800.00, TO_DATE('2021-10-10', 'YYYY-MM-DD'), '0722000017', 'mihai.lazar@bsf.ro');

INSERT INTO Client (cod_client, tip_client, nume, prenume, cod_identificare, cod_oras, email, telefon, data_nasterii, venit) VALUES (1, 'Persoana Juridica', 'SC IT Solutions SRL', NULL, '1000000000001', 1, 'contact@itsolutions.ro', '0721000001', NULL, 50000);
INSERT INTO Client (cod_client, tip_client, nume, prenume, cod_identificare, cod_oras, email, telefon, data_nasterii, venit) VALUES (2, 'Persoana Juridica', 'SC Construct Vest SA', NULL, '1000000000002', 1, 'office@constructvest.ro', '0721000002', NULL, 120000);
INSERT INTO Client (cod_client, tip_client, nume, prenume, cod_identificare, cod_oras, email, telefon, data_nasterii, venit) VALUES (3, 'Persoana Fizica', 'Popescu', 'Andrei', '1900101123456', 1, 'andrei.popescu@gmail.com', '0721000003', TO_DATE('1990-01-01', 'YYYY-MM-DD'), 4500);
INSERT INTO Client (cod_client, tip_client, nume, prenume, cod_identificare, cod_oras, email, telefon, data_nasterii, venit) VALUES (4, 'Persoana Fizica', 'Ionescu', 'Elena', '2920505123456', 1, 'elena.ionescu@yahoo.com', '0721000004', TO_DATE('1992-05-05', 'YYYY-MM-DD'), 5200);
INSERT INTO Client (cod_client, tip_client, nume, prenume, cod_identificare, cod_oras, email, telefon, data_nasterii, venit) VALUES (5, 'Persoana Fizica', 'Dumitru', 'Vlad', '1850312123456', 1, 'vlad.dumitru@gmail.com', '0721000005', TO_DATE('1985-03-12', 'YYYY-MM-DD'), 6000);
INSERT INTO Client (cod_client, tip_client, nume, prenume, cod_identificare, cod_oras, email, telefon, data_nasterii, venit) VALUES (6, 'Persoana Fizica', 'Georgescu', 'Ioana', '2950720123456', 1, 'ioana.georgescu@gmail.com', '0721000006', TO_DATE('1995-07-20', 'YYYY-MM-DD'), 3800);
INSERT INTO Client (cod_client, tip_client, nume, prenume, cod_identificare, cod_oras, email, telefon, data_nasterii, venit) VALUES (7, 'Persoana Fizica', 'Stan', 'Mihai', '1881115123456', 1, 'mihai.stan@outlook.com', '0721000007', TO_DATE('1988-11-15', 'YYYY-MM-DD'), 4100);
INSERT INTO Client (cod_client, tip_client, nume, prenume, cod_identificare, cod_oras, email, telefon, data_nasterii, venit) VALUES (8, 'Persoana Fizica', 'Dobre', 'Cristina', '2910228123456', 1, 'cristina.dobre@gmail.com', '0721000008', TO_DATE('1991-02-28', 'YYYY-MM-DD'), 4900);
INSERT INTO Client (cod_client, tip_client, nume, prenume, cod_identificare, cod_oras, email, telefon, data_nasterii, venit) VALUES (9, 'Persoana Fizica', 'Stancu', 'Alexandru', '1930910123456', 1, 'alex.stancu@gmail.com', '0721000009', TO_DATE('1993-09-10', 'YYYY-MM-DD'), 5500);
INSERT INTO Client (cod_client, tip_client, nume, prenume, cod_identificare, cod_oras, email, telefon, data_nasterii, venit) VALUES (10, 'Persoana Fizica', 'Marin', 'Gabriela', '2891201123456', 1, 'gabi.marin@yahoo.com', '0721000010', TO_DATE('1989-12-01', 'YYYY-MM-DD'), 4300);
INSERT INTO Client (cod_client, tip_client, nume, prenume, cod_identificare, cod_oras, email, telefon, data_nasterii, venit) VALUES (11, 'Persoana Fizica', 'Petrescu', 'Ionut', '1940615123456', 1, 'ionut.petrescu@gmail.com', '0721000011', TO_DATE('1994-06-15', 'YYYY-MM-DD'), 3900);
INSERT INTO Client (cod_client, tip_client, nume, prenume, cod_identificare, cod_oras, email, telefon, data_nasterii, venit) VALUES (12, 'Persoana Fizica', 'Nistor', 'Camelia', '2870422123456', 1, 'camelia.nistor@gmail.com', '0721000012', TO_DATE('1987-04-22', 'YYYY-MM-DD'), 5800);
INSERT INTO Client (cod_client, tip_client, nume, prenume, cod_identificare, cod_oras, email, telefon, data_nasterii, venit) VALUES (13, 'Persoana Fizica', 'Florea', 'Robert', '1960830123456', 1, 'robert.florea@outlook.com', '0721000013', TO_DATE('1996-08-30', 'YYYY-MM-DD'), 4700);
INSERT INTO Client (cod_client, tip_client, nume, prenume, cod_identificare, cod_oras, email, telefon, data_nasterii, venit) VALUES (14, 'Persoana Fizica', 'Munteanu', 'Diana', '2980112123456', 1, 'diana.munteanu@gmail.com', '0721000014', TO_DATE('1998-01-12', 'YYYY-MM-DD'), 3600);
INSERT INTO Client (cod_client, tip_client, nume, prenume, cod_identificare, cod_oras, email, telefon, data_nasterii, venit) VALUES (15, 'Persoana Fizica', 'Sandu', 'Marius', '1860505123456', 1, 'marius.sandu@yahoo.com', '0721000015', TO_DATE('1986-05-05', 'YYYY-MM-DD'), 6200);
INSERT INTO Client (cod_client, tip_client, nume, prenume, cod_identificare, cod_oras, email, telefon, data_nasterii, venit) VALUES (16, 'Persoana Fizica', 'Moldovan', 'Simona', '2901010123456', 1, 'simona.moldovan@gmail.com', '0721000016', TO_DATE('1990-10-10', 'YYYY-MM-DD'), 5100);
INSERT INTO Client (cod_client, tip_client, nume, prenume, cod_identificare, cod_oras, email, telefon, data_nasterii, venit) VALUES (17, 'Persoana Fizica', 'Stefan', 'Adrian', '1920318123456', 1, 'adrian.stefan@gmail.com', '0721000017', TO_DATE('1992-03-18', 'YYYY-MM-DD'), 5300);
INSERT INTO Client (cod_client, tip_client, nume, prenume, cod_identificare, cod_oras, email, telefon, data_nasterii, venit) VALUES (18, 'Persoana Fizica', 'Lazar', 'Oana', '2930725123456', 1, 'oana.lazar@outlook.com', '0721000018', TO_DATE('1993-07-25', 'YYYY-MM-DD'), 4000);
INSERT INTO Client (cod_client, tip_client, nume, prenume, cod_identificare, cod_oras, email, telefon, data_nasterii, venit) VALUES (19, 'Persoana Fizica', 'Cristea', 'Lucian', '1890909123456', 1, 'lucian.cristea@gmail.com', '0721000019', TO_DATE('1989-09-09', 'YYYY-MM-DD'), 5900);
INSERT INTO Client (cod_client, tip_client, nume, prenume, cod_identificare, cod_oras, email, telefon, data_nasterii, venit) VALUES (20, 'Persoana Fizica', 'Voicu', 'Raluca', '2951111123456', 1, 'raluca.voicu@gmail.com', '0721000020', TO_DATE('1995-11-11', 'YYYY-MM-DD'), 4200);
INSERT INTO Client (cod_client, tip_client, nume, prenume, cod_identificare, cod_oras, telefon)
VALUES (9005, 'Persoana Fizica', 'Stoica', 'Dublu', '90005', 1, '0700000005');
INSERT INTO Client (cod_client, tip_client, nume, prenume, cod_identificare, cod_oras, telefon)
VALUES (9001, 'Persoana Fizica', 'Popescu', 'Success', '90001', 1, '0700000001');
INSERT INTO Client (cod_client, tip_client, nume, prenume, cod_identificare, cod_oras, telefon)
VALUES (9002, 'Persoana Fizica', 'Ionescu', 'Blocat', '90002', 1, '0700000002');
INSERT INTO Client (cod_client, tip_client, nume, prenume, cod_identificare, cod_oras, telefon)
VALUES (9003, 'Persoana Fizica', 'Georgescu', 'Early', '90003', 1, '0700000003');
INSERT INTO Client (cod_client, tip_client, nume, prenume, cod_identificare, cod_oras, telefon)
VALUES (9004, 'Persoana Fizica', 'Dumitru', 'Sarac', '90004', 1, '0700000004');


INSERT INTO Cont_bancar (cod_contbancar, iban, tip_cont, sold_curent, status, limita_credit, cod_client) VALUES (1, 'RO01BANC0000000000000000000001', 'DEBIT', 15000, 'activ', 0, 1);
INSERT INTO Cont_bancar (cod_contbancar, iban, tip_cont, sold_curent, status, limita_credit, cod_client) VALUES (2, 'RO02BANC0000000000000000000002', 'DEBIT', 35000, 'activ', 0, 2);
INSERT INTO Cont_bancar (cod_contbancar, iban, tip_cont, sold_curent, status, limita_credit, cod_client) VALUES (3, 'RO03BANC0000000000000000000003', 'DEBIT', 2500, 'activ', 0, 3);
INSERT INTO Cont_bancar (cod_contbancar, iban, tip_cont, sold_curent, status, limita_credit, cod_client) VALUES (4, 'RO04BANC0000000000000000000004', 'DEBIT', 1200, 'activ', 0, 4);
INSERT INTO Cont_bancar (cod_contbancar, iban, tip_cont, sold_curent, status, limita_credit, cod_client) VALUES (5, 'RO05BANC0000000000000000000005', 'DEBIT', 4000, 'activ', 0, 5);
INSERT INTO Cont_bancar (cod_contbancar, iban, tip_cont, sold_curent, status, limita_credit, cod_client) VALUES (6, 'RO06BANC0000000000000000000006', 'DEBIT', 800, 'activ', 0, 6);
INSERT INTO Cont_bancar (cod_contbancar, iban, tip_cont, sold_curent, status, limita_credit, cod_client) VALUES (7, 'RO07BANC0000000000000000000007', 'DEBIT', 5500, 'activ', 0, 7);
INSERT INTO Cont_bancar (cod_contbancar, iban, tip_cont, sold_curent, status, limita_credit, cod_client) VALUES (8, 'RO08BANC0000000000000000000008', 'DEBIT', 3200, 'activ', 0, 8);
INSERT INTO Cont_bancar (cod_contbancar, iban, tip_cont, sold_curent, status, limita_credit, cod_client) VALUES (9, 'RO09BANC0000000000000000000009', 'DEBIT', 1500, 'activ', 0, 9);
INSERT INTO Cont_bancar (cod_contbancar, iban, tip_cont, sold_curent, status, limita_credit, cod_client) VALUES (10, 'RO10BANC0000000000000000000010', 'DEBIT', 2100, 'activ', 0, 10);
INSERT INTO Cont_bancar (cod_contbancar, iban, tip_cont, sold_curent, status, limita_credit, cod_client) VALUES (11, 'RO11BANC0000000000000000000011', 'DEBIT', 900, 'activ', 0, 11);
INSERT INTO Cont_bancar (cod_contbancar, iban, tip_cont, sold_curent, status, limita_credit, cod_client) VALUES (12, 'RO12BANC0000000000000000000012', 'DEBIT', 6000, 'activ', 0, 12);
INSERT INTO Cont_bancar (cod_contbancar, iban, tip_cont, sold_curent, status, limita_credit, cod_client) VALUES (13, 'RO13BANC0000000000000000000013', 'DEBIT', 100, 'activ', 0, 13);
INSERT INTO Cont_bancar (cod_contbancar, iban, tip_cont, sold_curent, status, limita_credit, cod_client) VALUES (14, 'RO14BANC0000000000000000000014', 'DEBIT', 450, 'activ', 0, 14);
INSERT INTO Cont_bancar (cod_contbancar, iban, tip_cont, sold_curent, status, limita_credit, cod_client) VALUES (15, 'RO15BANC0000000000000000000015', 'DEBIT', 7800, 'activ', 0, 15);
INSERT INTO Cont_bancar (cod_contbancar, iban, tip_cont, sold_curent, status, limita_credit, cod_client) VALUES (16, 'RO16BANC0000000000000000000016', 'DEBIT', 3400, 'activ', 0, 16);
INSERT INTO Cont_bancar (cod_contbancar, iban, tip_cont, sold_curent, status, limita_credit, cod_client) VALUES (17, 'RO17BANC0000000000000000000017', 'DEBIT', 2900, 'activ', 0, 17);
INSERT INTO Cont_bancar (cod_contbancar, iban, tip_cont, sold_curent, status, limita_credit, cod_client) VALUES (18, 'RO18BANC0000000000000000000018', 'DEBIT', 1800, 'activ', 0, 18);
INSERT INTO Cont_bancar (cod_contbancar, iban, tip_cont, sold_curent, status, limita_credit, cod_client) VALUES (19, 'RO19BANC0000000000000000000019', 'DEBIT', 5200, 'activ', 0, 19);
INSERT INTO Cont_bancar (cod_contbancar, iban, tip_cont, sold_curent, status, limita_credit, cod_client) VALUES (20, 'RO20BANC0000000000000000000020', 'DEBIT', 4100, 'activ', 0, 20);
INSERT INTO Cont_bancar (cod_contbancar, iban, tip_cont, sold_curent, status, limita_credit, cod_client) VALUES (21, 'RO21BANC0000000000000000000021', 'CREDIT', -500, 'activ', 5000, 3);
INSERT INTO Cont_bancar (cod_contbancar, iban, tip_cont, sold_curent, status, limita_credit, cod_client) VALUES (22, 'RO22BANC0000000000000000000022', 'CREDIT', 0, 'activ', 10000, 4);
INSERT INTO Cont_bancar (cod_contbancar, iban, tip_cont, sold_curent, status, limita_credit, cod_client) VALUES (23, 'RO23BANC0000000000000000000023', 'CREDIT', -200, 'activ', 3000, 5);
INSERT INTO Cont_bancar (cod_contbancar, iban, tip_cont, sold_curent, status, limita_credit, cod_client) VALUES (24, 'RO24BANC0000000000000000000024', 'ECONOMII', 10000, 'activ', 0, 6);
INSERT INTO Cont_bancar (cod_contbancar, iban, tip_cont, sold_curent, status, limita_credit, cod_client) VALUES (25, 'RO25BANC000000000000000000025', 'DEBIT', 0, 'blocat', 0, 2);
INSERT INTO Cont_bancar (cod_contbancar, iban, tip_cont, sold_curent, status, limita_credit, cod_client) VALUES (26, 'RO26BANC000000000000000000026', 'DEBIT', 0, 'activ', 0, 3);
INSERT INTO Cont_bancar (cod_contbancar, iban, tip_cont, sold_curent, status, limita_credit, cod_client)
VALUES (102, 'RO88DUPL0000000000000000000102', 'DEBIT', 0, 'activ', 0, 3);
INSERT INTO Cont_bancar (cod_contbancar, iban, tip_cont, sold_curent, status, limita_credit, cod_client)
VALUES (9001, 'RO99TEST0000000000001', 'DEBIT', 2000, 'activ', 0, 9001);
INSERT INTO Cont_bancar (cod_contbancar, iban, tip_cont, sold_curent, status, limita_credit, cod_client)
VALUES (9002, 'RO99TEST0000000000002', 'DEBIT', 2000, 'blocat', 0, 9002);
INSERT INTO Cont_bancar (cod_contbancar, iban, tip_cont, sold_curent, status, limita_credit, cod_client)
VALUES (9003, 'RO99TEST0000000000003', 'DEBIT', 2000, 'activ', 0, 9003);
INSERT INTO Cont_bancar (cod_contbancar, iban, tip_cont, sold_curent, status, limita_credit, cod_client)
VALUES (9004, 'RO99TEST0000000000004', 'DEBIT', 10, 'activ', 0, 9004);
INSERT INTO Cont_bancar (cod_contbancar, iban, tip_cont, sold_curent, status, limita_credit, cod_client)
VALUES (9005, 'RO99TEST0000000000005', 'DEBIT', 5000, 'activ', 0, 9005);


INSERT INTO Card (cod_card, nr_card, data_expirare, status, cod_contbancar) VALUES (1, '4000123456780001', TO_DATE('2028-05-30', 'YYYY-MM-DD'), 'activ', 1);
INSERT INTO Card (cod_card, nr_card, data_expirare, status, cod_contbancar) VALUES (2, '4000123456780002', TO_DATE('2028-06-15', 'YYYY-MM-DD'), 'activ', 2);
INSERT INTO Card (cod_card, nr_card, data_expirare, status, cod_contbancar) VALUES (3, '4000123456780003', TO_DATE('2028-07-20', 'YYYY-MM-DD'), 'activ', 3);
INSERT INTO Card (cod_card, nr_card, data_expirare, status, cod_contbancar) VALUES (4, '4000123456780004', TO_DATE('2028-08-10', 'YYYY-MM-DD'), 'activ', 4);
INSERT INTO Card (cod_card, nr_card, data_expirare, status, cod_contbancar) VALUES (5, '4000123456780005', TO_DATE('2028-09-05', 'YYYY-MM-DD'), 'activ', 5);
INSERT INTO Card (cod_card, nr_card, data_expirare, status, cod_contbancar) VALUES (6, '4000123456780006', TO_DATE('2028-10-12', 'YYYY-MM-DD'), 'activ', 6);
INSERT INTO Card (cod_card, nr_card, data_expirare, status, cod_contbancar) VALUES (7, '4000123456780007', TO_DATE('2028-11-25', 'YYYY-MM-DD'), 'activ', 7);
INSERT INTO Card (cod_card, nr_card, data_expirare, status, cod_contbancar) VALUES (8, '4000123456780008', TO_DATE('2028-12-01', 'YYYY-MM-DD'), 'activ', 8);
INSERT INTO Card (cod_card, nr_card, data_expirare, status, cod_contbancar) VALUES (9, '4000123456780009', TO_DATE('2029-01-14', 'YYYY-MM-DD'), 'activ', 9);
INSERT INTO Card (cod_card, nr_card, data_expirare, status, cod_contbancar) VALUES (10, '4000123456780010', TO_DATE('2029-02-28', 'YYYY-MM-DD'), 'activ', 10);
INSERT INTO Card (cod_card, nr_card, data_expirare, status, cod_contbancar) VALUES (11, '4000123456780011', TO_DATE('2029-03-15', 'YYYY-MM-DD'), 'activ', 11);
INSERT INTO Card (cod_card, nr_card, data_expirare, status, cod_contbancar) VALUES (12, '4000123456780012', TO_DATE('2029-04-20', 'YYYY-MM-DD'), 'activ', 12);
INSERT INTO Card (cod_card, nr_card, data_expirare, status, cod_contbancar) VALUES (13, '4000123456780013', TO_DATE('2029-05-05', 'YYYY-MM-DD'), 'activ', 13);
INSERT INTO Card (cod_card, nr_card, data_expirare, status, cod_contbancar) VALUES (14, '4000123456780014', TO_DATE('2029-06-18', 'YYYY-MM-DD'), 'activ', 14);
INSERT INTO Card (cod_card, nr_card, data_expirare, status, cod_contbancar) VALUES (15, '4000123456780015', TO_DATE('2029-07-22', 'YYYY-MM-DD'), 'activ', 15);
INSERT INTO Card (cod_card, nr_card, data_expirare, status, cod_contbancar) VALUES (16, '4000123456780016', TO_DATE('2029-08-30', 'YYYY-MM-DD'), 'activ', 16);
INSERT INTO Card (cod_card, nr_card, data_expirare, status, cod_contbancar) VALUES (17, '4000123456780017', TO_DATE('2029-09-10', 'YYYY-MM-DD'), 'activ', 17);
INSERT INTO Card (cod_card, nr_card, data_expirare, status, cod_contbancar) VALUES (18, '4000123456780018', TO_DATE('2029-10-05', 'YYYY-MM-DD'), 'activ', 18);
INSERT INTO Card (cod_card, nr_card, data_expirare, status, cod_contbancar) VALUES (19, '4000123456780019', TO_DATE('2029-11-12', 'YYYY-MM-DD'), 'activ', 19);
INSERT INTO Card (cod_card, nr_card, data_expirare, status, cod_contbancar) VALUES (20, '4000123456780020', TO_DATE('2029-12-25', 'YYYY-MM-DD'), 'activ', 20);
INSERT INTO Card (cod_card, nr_card, data_expirare, status, cod_contbancar) VALUES (21, '4000123456780021', TO_DATE('2030-01-01', 'YYYY-MM-DD'), 'activ', 21);
INSERT INTO Card (cod_card, nr_card, data_expirare, status, cod_contbancar) VALUES (22, '4000123456780022', TO_DATE('2030-02-14', 'YYYY-MM-DD'), 'activ', 22);
INSERT INTO Card (cod_card, nr_card, data_expirare, status, cod_contbancar) VALUES (23, '4000123456780023', TO_DATE('2030-03-20', 'YYYY-MM-DD'), 'activ', 23);
INSERT INTO Card (cod_card, nr_card, data_expirare, status, cod_contbancar) VALUES (24, '4000123456780024', TO_DATE('2030-04-10', 'YYYY-MM-DD'), 'activ', 24);
INSERT INTO Card (cod_card, nr_card, data_expirare, status, cod_contbancar) VALUES (25, '4000123456780025', TO_DATE('2020-01-01', 'YYYY-MM-DD'), 'expirat', 1);
INSERT INTO Card (cod_card, nr_card, data_expirare, status, cod_contbancar) VALUES (26, '4000123456780026', TO_DATE('2029-01-01', 'YYYY-MM-DD'), 'activ', 25);
INSERT INTO Card (cod_card, nr_card, data_expirare, status, cod_contbancar) VALUES (27, '4000123456780027', TO_DATE('2029-01-01', 'YYYY-MM-DD'), 'activ', 26);
INSERT INTO Card (cod_card, nr_card, data_expirare, status, cod_contbancar) VALUES (27, '4000123456780027', TO_DATE('2029-01-01', 'YYYY-MM-DD'), 'activ', 26);
INSERT INTO Card (cod_card, nr_card, data_expirare, status, cod_contbancar) VALUES (28, '4000123456780028', TO_DATE('2029-01-01', 'YYYY-MM-DD'), 'activ', 3);
INSERT INTO Card (cod_card, nr_card, data_expirare, status, cod_contbancar) VALUES (29, '4000163456780003', TO_DATE('2029-01-01', 'YYYY-MM-DD'), 'activ', 3);
INSERT INTO Card (cod_card, nr_card, data_expirare, status, cod_contbancar)
VALUES (102, '5555444433330003', TO_DATE('2029-01-01', 'YYYY-MM-DD'), 'activ', 102);

INSERT INTO Depozit (cod_depozit, nume, dobanda_anuala, perioada_luni, suma_minima) VALUES (1, 'Depozit Standard 1 Luna', 3.50, 1, 500);
INSERT INTO Depozit (cod_depozit, nume, dobanda_anuala, perioada_luni, suma_minima) VALUES (2, 'Depozit Trimestrial', 4.25, 3, 500);
INSERT INTO Depozit (cod_depozit, nume, dobanda_anuala, perioada_luni, suma_minima) VALUES (3, 'Depozit Semestrial', 5.00, 6, 1000);
INSERT INTO Depozit (cod_depozit, nume, dobanda_anuala, perioada_luni, suma_minima) VALUES (4, 'Depozit Anual Fix', 6.50, 12, 1000);
INSERT INTO Depozit (cod_depozit, nume, dobanda_anuala, perioada_luni, suma_minima) VALUES (5, 'Depozit Junior', 4.00, 12, 100);
INSERT INTO Depozit (cod_depozit, nume, dobanda_anuala, perioada_luni, suma_minima) VALUES (6, 'Depozit Maturitate 2 Ani', 7.20, 24, 5000);

INSERT INTO Asigurare (cod_asigurare, tip_asigurare, prima_asigurare, furnizor, comision_banca) VALUES (1, 'Asigurare Viata', 150.00, 'Allianz Tiriac', 15.00);
INSERT INTO Asigurare (cod_asigurare, tip_asigurare, prima_asigurare, furnizor, comision_banca) VALUES (2, 'Asigurare Calatorie', 50.00, 'Groupama', 5.00);
INSERT INTO Asigurare (cod_asigurare, tip_asigurare, prima_asigurare, furnizor, comision_banca) VALUES (3, 'Asigurare Locuinta PAD', 100.00, 'Omniasig', 10.00);
INSERT INTO Asigurare (cod_asigurare, tip_asigurare, prima_asigurare, furnizor, comision_banca) VALUES (4, 'Asigurare Sanatate', 300.00, 'Signal Iduna', 30.00);
INSERT INTO Asigurare (cod_asigurare, tip_asigurare, prima_asigurare, furnizor, comision_banca) VALUES (5, 'Asigurare CASCO', 1200.00, 'Generali', 100.00);
INSERT INTO Asigurare (cod_asigurare, tip_asigurare, prima_asigurare, furnizor, comision_banca) VALUES (6, 'Asigurare Pierdere Venit', 80.00, 'Asirom', 8.00);

INSERT INTO Credit (cod_credit, nume, dobanda_referinta, suma_maxima, tip_dobanda, marja_banca) VALUES (1, 'Credit Nevoi Personale', 2.50, 100000, 'FIXA', 8.50);
INSERT INTO Credit (cod_credit, nume, dobanda_referinta, suma_maxima, tip_dobanda, marja_banca) VALUES (2, 'Credit Ipotecar Standard', 4.50, 1500000, 'VARIABILA', 2.50);
INSERT INTO Credit (cod_credit, nume, dobanda_referinta, suma_maxima, tip_dobanda, marja_banca) VALUES (3, 'Credit Auto', 3.00, 300000, 'FIXA', 6.00);
INSERT INTO Credit (cod_credit, nume, dobanda_referinta, suma_maxima, tip_dobanda, marja_banca) VALUES (4, 'Credit Refinantare', 4.50, 200000, 'VARIABILA', 3.00);
INSERT INTO Credit (cod_credit, nume, dobanda_referinta, suma_maxima, tip_dobanda, marja_banca) VALUES (5, 'Credit Studii', 1.50, 50000, 'FIXA', 4.50);
INSERT INTO Credit (cod_credit, nume, dobanda_referinta, suma_maxima, tip_dobanda, marja_banca) VALUES (6, 'Credit Prima Casa', 4.50, 350000, 'VARIABILA', 2.00);

INSERT INTO Tranzactie (cod_tranzactie, data_ora, suma, detalii, canal_operatiune, cod_cont_sursa, cod_cont_destinatie, cod_card, iban_cont_destinatie_extern) VALUES (1, TO_DATE('2024-01-10 10:30', 'YYYY-MM-DD HH24:MI'), 250.50, 'Cumparaturi Mega Image', 'POS', 1, NULL, 1, NULL);
INSERT INTO Tranzactie (cod_tranzactie, data_ora, suma, detalii, canal_operatiune, cod_cont_sursa, cod_cont_destinatie, cod_card, iban_cont_destinatie_extern) VALUES (2, TO_DATE('2024-01-11 14:15', 'YYYY-MM-DD HH24:MI'), 500.00, 'Retragere numerar ATM Unirii', 'ATM', 2, NULL, 2, NULL);
INSERT INTO Tranzactie (cod_tranzactie, data_ora, suma, detalii, canal_operatiune, cod_cont_sursa, cod_cont_destinatie, cod_card, iban_cont_destinatie_extern) VALUES (3, TO_DATE('2024-01-12 09:00', 'YYYY-MM-DD HH24:MI'), 120.00, 'Abonament Netflix', 'ONLINE', 3, NULL, 3, NULL);
INSERT INTO Tranzactie (cod_tranzactie, data_ora, suma, detalii, canal_operatiune, cod_cont_sursa, cod_cont_destinatie, cod_card, iban_cont_destinatie_extern) VALUES (4, TO_DATE('2024-01-15 10:00', 'YYYY-MM-DD HH24:MI'), 4500.00, 'Plata Salariu', 'Transfer Intern', 1, 3, NULL, NULL);
INSERT INTO Tranzactie (cod_tranzactie, data_ora, suma, detalii, canal_operatiune, cod_cont_sursa, cod_cont_destinatie, cod_card, iban_cont_destinatie_extern) VALUES (5, TO_DATE('2024-01-20 11:00', 'YYYY-MM-DD HH24:MI'), 1000.00, 'Transfer in cont economii', 'Transfer Intern', 2, 24, NULL, NULL);
INSERT INTO Tranzactie (cod_tranzactie, data_ora, suma, detalii, canal_operatiune, cod_cont_sursa, cod_cont_destinatie, cod_card, iban_cont_destinatie_extern) VALUES (6, TO_DATE('2024-01-25 16:30', 'YYYY-MM-DD HH24:MI'), 350.00, 'Factura Enel', 'Transfer Extern', 4, NULL, NULL, 'RO99RNCB0000000000000001');
INSERT INTO Tranzactie (cod_tranzactie, data_ora, suma, detalii, canal_operatiune, cod_cont_sursa, cod_cont_destinatie, cod_card, iban_cont_destinatie_extern) VALUES (7, TO_DATE('2024-01-26 20:00', 'YYYY-MM-DD HH24:MI'), 185.00, 'Cina Restaurant', 'POS', 10, NULL, 10, NULL);
INSERT INTO Tranzactie (cod_tranzactie, data_ora, suma, detalii, canal_operatiune, cod_cont_sursa, cod_cont_destinatie, cod_card, iban_cont_destinatie_extern) VALUES (8, TO_DATE('2024-01-28 12:00', 'YYYY-MM-DD HH24:MI'), 500.00, 'Bani de buzunar', 'Transfer Intern', 5, 14, NULL, NULL);
INSERT INTO Tranzactie (cod_tranzactie, data_ora, suma, detalii, canal_operatiune, cod_cont_sursa, cod_cont_destinatie, cod_card, iban_cont_destinatie_extern) VALUES (9, TO_DATE('2024-02-15 10:05', 'YYYY-MM-DD HH24:MI'), 5200.00, 'Salariu Februarie', 'Transfer Intern', 1, 4, NULL, NULL);
INSERT INTO Tranzactie (cod_tranzactie, data_ora, suma, detalii, canal_operatiune, cod_cont_sursa, cod_cont_destinatie, cod_card, iban_cont_destinatie_extern) VALUES (10, TO_DATE('2024-02-15 10:10', 'YYYY-MM-DD HH24:MI'), 6000.00, 'Salariu Februarie', 'Transfer Intern', 1, 5, NULL, NULL);
INSERT INTO Tranzactie (cod_tranzactie, data_ora, suma, detalii, canal_operatiune, cod_cont_sursa, cod_cont_destinatie, cod_card, iban_cont_destinatie_extern) VALUES (11, TO_DATE('2024-02-16 14:30', 'YYYY-MM-DD HH24:MI'), 3500.00, 'Achizitie Laptop eMAG', 'ONLINE', 21, NULL, 21, NULL);
INSERT INTO Tranzactie (cod_tranzactie, data_ora, suma, detalii, canal_operatiune, cod_cont_sursa, cod_cont_destinatie, cod_card, iban_cont_destinatie_extern) VALUES (12, TO_DATE('2024-02-17 08:45', 'YYYY-MM-DD HH24:MI'), 350.00, 'Alimentare OMV', 'POS', 7, NULL, 7, NULL);
INSERT INTO Tranzactie (cod_tranzactie, data_ora, suma, detalii, canal_operatiune, cod_cont_sursa, cod_cont_destinatie, cod_card, iban_cont_destinatie_extern) VALUES (13, TO_DATE('2024-02-18 09:00', 'YYYY-MM-DD HH24:MI'), 200.00, 'Economii lunare', 'Transfer Intern', 6, 24, NULL, NULL);
INSERT INTO Tranzactie (cod_tranzactie, data_ora, suma, detalii, canal_operatiune, cod_cont_sursa, cod_cont_destinatie, cod_card, iban_cont_destinatie_extern) VALUES (14, TO_DATE('2024-02-20 11:00', 'YYYY-MM-DD HH24:MI'), 1800.00, 'Plata chirie Februarie', 'Transfer Extern', 8, NULL, NULL, 'RO55INGB0000999988887777');
INSERT INTO Tranzactie (cod_tranzactie, data_ora, suma, detalii, canal_operatiune, cod_cont_sursa, cod_cont_destinatie, cod_card, iban_cont_destinatie_extern) VALUES (15, TO_DATE('2024-02-21 21:30', 'YYYY-MM-DD HH24:MI'), 75.00, 'Cota parte cina', 'Transfer Intern', 9, 10, NULL, NULL);
INSERT INTO Tranzactie (cod_tranzactie, data_ora, suma, detalii, canal_operatiune, cod_cont_sursa, cod_cont_destinatie, cod_card, iban_cont_destinatie_extern) VALUES (16, TO_DATE('2024-02-22 07:00', 'YYYY-MM-DD HH24:MI'), 180.00, 'World Class Abonament', 'POS', 11, NULL, 11, NULL);
INSERT INTO Tranzactie (cod_tranzactie, data_ora, suma, detalii, canal_operatiune, cod_cont_sursa, cod_cont_destinatie, cod_card, iban_cont_destinatie_extern) VALUES (17, TO_DATE('2024-02-23 16:00', 'YYYY-MM-DD HH24:MI'), 4200.00, 'IKEA Mobila Living', 'POS', 22, NULL, 22, NULL);
INSERT INTO Tranzactie (cod_tranzactie, data_ora, suma, detalii, canal_operatiune, cod_cont_sursa, cod_cont_destinatie, cod_card, iban_cont_destinatie_extern) VALUES (18, TO_DATE('2024-02-24 10:00', 'YYYY-MM-DD HH24:MI'), 15000.00, 'Factura Materiale Constructii', 'Transfer Extern', 2, NULL, NULL, 'RO10BRDE4500450045004500');
INSERT INTO Tranzactie (cod_tranzactie, data_ora, suma, detalii, canal_operatiune, cod_cont_sursa, cod_cont_destinatie, cod_card, iban_cont_destinatie_extern) VALUES (19, TO_DATE('2024-02-25 23:00', 'YYYY-MM-DD HH24:MI'), 100.00, 'Retragere ATM Gara', 'ATM', 15, NULL, 15, NULL);
INSERT INTO Tranzactie (cod_tranzactie, data_ora, suma, detalii, canal_operatiune, cod_cont_sursa, cod_cont_destinatie, cod_card, iban_cont_destinatie_extern) VALUES (20, TO_DATE('2024-02-26 14:00', 'YYYY-MM-DD HH24:MI'), 100.00, 'Donatie Salvati Copiii', 'Transfer Extern', 12, NULL, NULL, 'RO01TREZ7000700070007000');
INSERT INTO Tranzactie (cod_tranzactie, data_ora, suma, detalii, canal_operatiune, cod_cont_sursa, cod_cont_destinatie, cod_card, iban_cont_destinatie_extern) VALUES (21, TO_DATE('2024-02-27 18:30', 'YYYY-MM-DD HH24:MI'), 450.90, 'ZARA Afi Cotroceni', 'POS', 18, NULL, 18, NULL);
INSERT INTO Tranzactie (cod_tranzactie, data_ora, suma, detalii, canal_operatiune, cod_cont_sursa, cod_cont_destinatie, cod_card, iban_cont_destinatie_extern) VALUES (22, TO_DATE('2024-02-28 10:00', 'YYYY-MM-DD HH24:MI'), 500.00, 'Alimentare Card Credit', 'Transfer Intern', 3, 21, NULL, NULL);
INSERT INTO Tranzactie (cod_tranzactie, data_ora, suma, detalii, canal_operatiune, cod_cont_sursa, cod_cont_destinatie, cod_card, iban_cont_destinatie_extern) VALUES (23, TO_DATE('2024-03-01 09:30', 'YYYY-MM-DD HH24:MI'), 1200.00, 'Polita RCA', 'ONLINE', 5, NULL, 5, NULL);

INSERT INTO Audit_Tranzactie (cod_audit, cod_tranzactie, cod_angajat, motiv_verificare, rezultat_verificare, data_audit)
VALUES (1, 18, 1, 'Verificare AML - Suma depaseste pragul de raportare automata', 'aprobat', TO_DATE('2024-02-25 09:00', 'YYYY-MM-DD HH24:MI'));
INSERT INTO Audit_Tranzactie (cod_audit, cod_tranzactie, cod_angajat, motiv_verificare, rezultat_verificare, data_audit)
VALUES (2, 11, 4, 'Suspiciune frauda - Tipar de cumparare neobisnuit pentru client', 'aprobat', TO_DATE('2024-02-16 16:00', 'YYYY-MM-DD HH24:MI'));
INSERT INTO Audit_Tranzactie (cod_audit, cod_tranzactie, cod_angajat, motiv_verificare, rezultat_verificare, data_audit)
VALUES (3, 14, 5, 'Validare cont beneficiar extern inainte de procesare finala', 'aprobat', TO_DATE('2024-02-20 12:30', 'YYYY-MM-DD HH24:MI'));
INSERT INTO Audit_Tranzactie (cod_audit, cod_tranzactie, cod_angajat, motiv_verificare, rezultat_verificare, data_audit)
VALUES (4, 19, 10, 'Utilizare card la ATM in locatie de risc ridicat', 'respins', TO_DATE('2024-02-26 09:15', 'YYYY-MM-DD HH24:MI'));
INSERT INTO Audit_Tranzactie (cod_audit, cod_tranzactie, cod_angajat, motiv_verificare, rezultat_verificare, data_audit)
VALUES (5, 16, 2, 'Control intern de calitate - Verificare aleatorie', 'aprobat', TO_DATE('2024-02-23 10:00', 'YYYY-MM-DD HH24:MI'));
INSERT INTO Audit_Tranzactie (cod_audit, cod_tranzactie, cod_angajat, motiv_verificare, rezultat_verificare, data_audit)
VALUES (6, 20, 8, 'Verificare conformitate ONG beneficiar', 'aprobat', TO_DATE('2024-02-26 15:45', 'YYYY-MM-DD HH24:MI'));

COMMIT;

INSERT INTO Beneficiaza_de (cod_beneficiazade, data_semnare, data_scadenta, suma_acordata, dobanda, status, rata_lunara, cod_client, cod_angajat, cod_credit, cod_contbancar)
VALUES (1, TO_DATE('2022-02-15', 'YYYY-MM-DD'), TO_DATE('2027-02-15', 'YYYY-MM-DD'), 20000.00, 11.00, 'activ', 450.00, 3, 3, 1, 3);
INSERT INTO Beneficiaza_de (cod_beneficiazade, data_semnare, data_scadenta, suma_acordata, dobanda, status, rata_lunara, cod_client, cod_angajat, cod_credit, cod_contbancar)
VALUES (2, TO_DATE('2021-08-10', 'YYYY-MM-DD'), TO_DATE('2051-08-10', 'YYYY-MM-DD'), 350000.00, 7.00, 'activ', 2100.00, 4, 4, 2, 4);
INSERT INTO Beneficiaza_de (cod_beneficiazade, data_semnare, data_scadenta, suma_acordata, dobanda, status, rata_lunara, cod_client, cod_angajat, cod_credit, cod_contbancar)
VALUES (3, TO_DATE('2023-01-20', 'YYYY-MM-DD'), TO_DATE('2028-01-20', 'YYYY-MM-DD'), 60000.00, 9.00, 'activ', 1200.00, 5, 7, 3, 5);
INSERT INTO Beneficiaza_de (cod_beneficiazade, data_semnare, data_scadenta, suma_acordata, dobanda, status, rata_lunara, cod_client, cod_angajat, cod_credit, cod_contbancar)
VALUES (4, TO_DATE('2019-05-05', 'YYYY-MM-DD'), TO_DATE('2022-05-05', 'YYYY-MM-DD'), 10000.00, 10.50, 'inactiv', 0.00, 6, 2, 1, 6);
INSERT INTO Beneficiaza_de (cod_beneficiazade, data_semnare, data_scadenta, suma_acordata, dobanda, status, rata_lunara, cod_client, cod_angajat, cod_credit, cod_contbancar)
VALUES (5, TO_DATE('2023-09-15', 'YYYY-MM-DD'), TO_DATE('2026-09-15', 'YYYY-MM-DD'), 15000.00, 6.00, 'activ', 450.00, 14, 13, 5, 14);
INSERT INTO Beneficiaza_de (cod_beneficiazade, data_semnare, data_scadenta, suma_acordata, dobanda, status, rata_lunara, cod_client, cod_angajat, cod_credit, cod_contbancar)
VALUES (6, TO_DATE('2023-06-01', 'YYYY-MM-DD'), TO_DATE('2025-06-01', 'YYYY-MM-DD'), 100000.00, 5.50, 'activ', 4500.00, 1, 10, 1, 1);
INSERT INTO Beneficiaza_de (cod_beneficiazade, data_semnare, data_scadenta, suma_acordata, dobanda, status, rata_lunara, cod_client, cod_angajat, cod_credit, cod_contbancar) VALUES (7, TO_DATE('2023-11-10', 'YYYY-MM-DD'), TO_DATE('2028-11-10', 'YYYY-MM-DD'), 45000.00, 9.50, 'activ', 980.00, 8, 4, 1, 8);
INSERT INTO Beneficiaza_de (cod_beneficiazade, data_semnare, data_scadenta, suma_acordata, dobanda, status, rata_lunara, cod_client, cod_angajat, cod_credit, cod_contbancar) VALUES (8, TO_DATE('2022-05-20', 'YYYY-MM-DD'), TO_DATE('2052-05-20', 'YYYY-MM-DD'), 280000.00, 6.80, 'activ', 1850.00, 15, 10, 2, 15);
INSERT INTO Beneficiaza_de (cod_beneficiazade, data_semnare, data_scadenta, suma_acordata, dobanda, status, rata_lunara, cod_client, cod_angajat, cod_credit, cod_contbancar) VALUES (9, TO_DATE('2024-01-15', 'YYYY-MM-DD'), TO_DATE('2029-01-15', 'YYYY-MM-DD'), 75000.00, 8.20, 'activ', 1500.00, 9, 7, 3, 9);
INSERT INTO Beneficiaza_de (cod_beneficiazade, data_semnare, data_scadenta, suma_acordata, dobanda, status, rata_lunara, cod_client, cod_angajat, cod_credit, cod_contbancar) VALUES (10, TO_DATE('2023-10-01', 'YYYY-MM-DD'), TO_DATE('2026-10-01', 'YYYY-MM-DD'), 12000.00, 4.50, 'activ', 360.00, 11, 13, 5, 11);
INSERT INTO Beneficiaza_de (cod_beneficiazade, data_semnare, data_scadenta, suma_acordata, dobanda, status, rata_lunara, cod_client, cod_angajat, cod_credit, cod_contbancar) VALUES (11, TO_DATE('2024-02-01', 'YYYY-MM-DD'), TO_DATE('2034-02-01', 'YYYY-MM-DD'), 95000.00, 7.50, 'activ', 1100.00, 19, 1, 4, 19);


INSERT INTO Constituie (cod_constituie, cod_oferta_depozit, cod_cont_bancar, data_maturitate, suma, status) VALUES (1, 1, 1, SYSDATE + 30, 5000.00, 'activ');
INSERT INTO Constituie (cod_constituie, cod_oferta_depozit, cod_cont_bancar, data_maturitate, suma, status) VALUES (2, 4, 2, SYSDATE + 365, 20000.00, 'activ');
INSERT INTO Constituie (cod_constituie, cod_oferta_depozit, cod_cont_bancar, data_maturitate, suma, status) VALUES (3, 1, 3, SYSDATE + 30, 2500.00, 'activ');
INSERT INTO Constituie (cod_constituie, cod_oferta_depozit, cod_cont_bancar, data_maturitate, suma, status) VALUES (4, 5, 24, SYSDATE + 365, 1000.00, 'activ');
INSERT INTO Constituie (cod_constituie, cod_oferta_depozit, cod_cont_bancar, data_maturitate, suma, status) VALUES (5, 2, 4, SYSDATE - 10, 3000.00, 'lichidat');
INSERT INTO Constituie (cod_constituie, cod_oferta_depozit, cod_cont_bancar, data_maturitate, suma, status) VALUES (6, 3, 5, SYSDATE + 180, 4000.00, 'inactiv');
INSERT INTO Constituie (cod_constituie, cod_oferta_depozit, cod_cont_bancar, data_maturitate, suma, status) VALUES (7, 6, 7, SYSDATE + 730, 8000.00, 'activ');
INSERT INTO Constituie (cod_constituie, cod_oferta_depozit, cod_cont_bancar, data_maturitate, suma, status) VALUES (8, 2, 12, SYSDATE + 90, 1500.00, 'activ');
INSERT INTO Constituie (cod_constituie, cod_oferta_depozit, cod_cont_bancar, data_maturitate, suma, status) VALUES (9, 1, 15, SYSDATE - 5, 2000.00, 'lichidat');
INSERT INTO Constituie (cod_constituie, cod_oferta_depozit, cod_cont_bancar, data_maturitate, suma, status) VALUES (10, 4, 18, SYSDATE + 365, 5000.00, 'activ');
INSERT INTO Constituie (cod_constituie, cod_oferta_depozit, cod_cont_bancar, data_maturitate, suma, status) VALUES (11, 3, 20, SYSDATE + 180, 10000.00, 'activ');

INSERT INTO Incheie (cod_incheie, cod_client, cod_asigurare, data_start, data_expirare, suma_asigurata, cod_cont_bancar)
VALUES (9001, 9001, 1, SYSDATE-360, SYSDATE + 5, 50000, 9001);
INSERT INTO Incheie (cod_incheie, cod_client, cod_asigurare, data_start, data_expirare, suma_asigurata, cod_cont_bancar)
VALUES (9002, 9002, 1, SYSDATE-360, SYSDATE + 5, 50000, 9002);
INSERT INTO Incheie (cod_incheie, cod_client, cod_asigurare, data_start, data_expirare, suma_asigurata, cod_cont_bancar)
VALUES (9003, 9003, 1, SYSDATE-360, SYSDATE + 100, 50000, 9003);
INSERT INTO Incheie (cod_incheie, cod_client, cod_asigurare, data_start, data_expirare, suma_asigurata, cod_cont_bancar)
VALUES (9004, 9004, 1, SYSDATE-360, SYSDATE + 5, 50000, 9004);
INSERT INTO Incheie (cod_incheie, cod_client, cod_asigurare, data_start, data_expirare, suma_asigurata, cod_cont_bancar)
VALUES (9005, 9005, 1, SYSDATE-360, SYSDATE + 5, 50000, 9005);
INSERT INTO Incheie (cod_incheie, cod_client, cod_asigurare, data_start, data_expirare, suma_asigurata, cod_cont_bancar)
VALUES (9006, 9005, 1, SYSDATE-360, SYSDATE + 10, 50000, 9005);
INSERT INTO Incheie (cod_incheie, cod_client, cod_asigurare, data_start, data_expirare, suma_asigurata, cod_cont_bancar) VALUES (30, 13, 1, SYSDATE-360, SYSDATE + 2, 50000, 13);
INSERT INTO Incheie (cod_incheie, cod_client, cod_asigurare, data_start, data_expirare, suma_asigurata, cod_cont_bancar) VALUES (31, 9, 2, SYSDATE-360, SYSDATE, 10000, 9);
INSERT INTO Incheie (cod_incheie, cod_client, cod_asigurare, data_start, data_expirare, suma_asigurata, cod_cont_bancar) VALUES (32, 2, 3, SYSDATE-360, SYSDATE + 10, 100000, 25);
INSERT INTO Incheie (cod_incheie, cod_client, cod_asigurare, data_start, data_expirare, suma_asigurata, cod_cont_bancar) VALUES (33, 11, 4, SYSDATE-360, SYSDATE + 20, 5000, 11);
INSERT INTO Incheie (cod_incheie, cod_client, cod_asigurare, data_start, data_expirare, suma_asigurata, cod_cont_bancar) VALUES (34, 14, 1, SYSDATE-360, SYSDATE + 40, 50000, 14);
INSERT INTO Incheie (cod_incheie, cod_client, cod_asigurare, data_start, data_expirare, suma_asigurata, cod_cont_bancar) VALUES (35, 3, 5, SYSDATE-360, SYSDATE + 15, 45000, 21);
INSERT INTO Incheie (cod_incheie, cod_client, cod_asigurare, data_start, data_expirare, suma_asigurata, cod_cont_bancar) VALUES (36, 6, 6, SYSDATE-360, SYSDATE + 5, 20000, 24);
INSERT INTO Incheie (cod_incheie, cod_client, cod_asigurare, data_start, data_expirare, suma_asigurata, cod_cont_bancar) VALUES (37, 12, 1, SYSDATE-360, SYSDATE + 29, 60000, 12);
INSERT INTO Incheie (cod_incheie, cod_client, cod_asigurare, data_start, data_expirare, suma_asigurata, cod_cont_bancar) VALUES (38, 15, 5, SYSDATE-360, SYSDATE + 1, 85000, 15);
INSERT INTO Incheie (cod_incheie, cod_client, cod_asigurare, data_start, data_expirare, suma_asigurata, cod_cont_bancar) VALUES (39, 10, 2, SYSDATE-360, SYSDATE + 60, 15000, 10);
COMMIT;