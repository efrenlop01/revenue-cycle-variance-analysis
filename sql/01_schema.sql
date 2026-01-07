CREATE DATABASE revenue_cycle;
USE revenue_cycle;

CREATE TABLE patients (
    patient_id VARCHAR(10) PRIMARY KEY,
    age_group VARCHAR(10),
    gender CHAR(1)
);

CREATE TABLE encounters (
    encounter_id VARCHAR(12) PRIMARY KEY,
    patient_id VARCHAR(10),
    service_line VARCHAR(50),
    facility VARCHAR(50),
    encounter_date DATE,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

CREATE TABLE claims (
    claim_id VARCHAR(12) PRIMARY KEY,
    encounter_id VARCHAR(12),
    payor VARCHAR(50),
    billed_amount DECIMAL(10,2),
    claim_submit_date DATE,
    claim_status VARCHAR(20),
    FOREIGN KEY (encounter_id) REFERENCES encounters(encounter_id)
);

CREATE TABLE payments (
    payment_id VARCHAR(12) PRIMARY KEY,
    claim_id VARCHAR(12),
    paid_amount DECIMAL(10,2),
    denial_reason VARCHAR(100),
    payment_date DATE,
    FOREIGN KEY (claim_id) REFERENCES claims(claim_id)
);

SHOW TABLES;
SELECT COUNT(*) AS patients FROM patients;
SELECT COUNT(*) AS encounters FROM encounters;
SELECT COUNT(*) AS claims FROM claims;
SELECT COUNT(*) AS payments FROM payments;
