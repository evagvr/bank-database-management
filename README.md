# Banking Database Management System
A relational database designed to manage core banking operations. This project goes beyond simple data storage, implementing procedural business logic, automated security triggers, and advanced data recovery mechanisms using Oracle SQL and PL/SQL.
## Features:
* 15 normalized tables mapping out a standard banking structure splitted in 12 core tables (Cities, Branches, Bank Units, Employees, Clients, Accounts, Cards, Transactions, Audits of Transactions, Loans, Deposits, Insurances) and 3 associative tables(Beneficiaza_de: The bridge connecting Clients, Employees, Credits, and Accounts; Constituie: The bridge connecting Deposits and Accounts; Incheie: The bridge connecting Clients, Insurance (Asigurare), and Accounts). Includes strict constraint management (Primary/Foreign keys, UNIQUE, and CHECK constraints).

* The database utilizes advanced PL/SQL procedures and functions to automate banking workflows and generate analytical reports:
  * **Branch Risk Analysis (`analiza_risk_sucursala`):** A procedure that evaluates the risk profile of a specific branch. It iterates through active loan contracts, fetching the client's last 5 transactions using `VARRAY` collections, and calculates total client indebtedness using Nested Tables and `BULK COLLECT`. It also aggregates total loans granted categorized by interest type.
  * **Liquidity & Interest Reporting (`raport_lichiditate_depozite`):** Automates the calculation of projected interest payouts. It scans all active deposit accounts, computes the individual interest owed based on annual rates and maturity periods, and aggregates the total attracted capital per deposit product.
  * **Card Verification Function (`verificare_status_card_client`):** A standalone function that validates card usability prior to transactions. It cross-references the card's expiration date with the linked bank account's status, utilizing custom Exception Handling (`PRAGMA EXCEPTION_INIT`) to gracefully flag expired cards or blocked accounts.
  * **Insurance Eligibility Engine (`verifica_eligibilitate_asigurare`):** A procedure that acts as a payment gateway for policy renewals. It evaluates available funds (dynamically factoring in credit limits for credit accounts), verifies account active status, and enforces renewal time windows. It uses `OUT` parameters to return exact processing statuses and insured amounts.

* BEFORE INSERT triggers that validate source funds, credit limits, card-to-account ownership, and active account statuses before allowing transfers.

* A system-level DDL trigger that prevents accidental dropping/truncating of critical tables.
  * Automated pre-drop data archiving that saves deleted table records as XML.
  * Time-locked triggers restricting updates to the credit portfolio outside of standard business hours.

## Structure:
### Scripts:
  * 01_schema.sql - Table creations and constraints.
  * 02_seed_data.sql - INSERT statements for testing and validation.
  * 03_business_logic.sql - PL/SQL Procedures and Functions.
  * 04_security_triggers.sql - Audit tables and database triggers.
### Diagrams:
  * diagrama-relationala - E/R Diagram
  * diagrama-conceptuala - Conceptual Diagram
