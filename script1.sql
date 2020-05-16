SHOW DATABASES;
DROP DATABASE IF EXISTS zxiao72assign2db;
CREATE DATABASE zxiao72assign2db;
USE zxiao72assign2db;

GRANT USAGE ON *.* TO 'ta'@'localhost';
DROP USER 'ta'@'localhost';
CREATE USER 'ta'@'localhost' IDENTIFIED BY 'cs3319';
GRANT ALL PRIVILEGES ON yourwesternuseridassign2db.* TO 'ta'@'localhost';
FLUSH PRIVILEGES;
SHOW TABLES;

CREATE TABLE doctor(
  first_name VARCHAR(20),
  last_name VARCHAR(20),
  specialty VARCHAR(20),
  licensed_date DATE,
  license_number CHAR(4) NOT NULL,
  hospital_code CHAR (3),
  PRIMARY KEY (license_number)
);

CREATE TABLE patient(
  patient_ohip CHAR (9) NOT NULL,
  first_name VARCHAR(20),
  last_name VARCHAR(20),
  PRIMARY KEY (patient_ohip)
);

CREATE TABLE hospital(
  hospital_name VARCHAR(20),
  city VARCHAR(20),
  province VARCHAR(20),
  number_beds INT,
  hospital_code CHAR(3) NOT NULL,
  current_head CHAR(4),
  start_date DATE,
  PRIMARY KEY (hospital_code),
  FOREIGN KEY (current_head) REFERENCES doctor (license_number) ON DELETE CASCADE
);

ALTER TABLE doctor
ADD FOREIGN KEY (hospital_code) REFERENCES hospital (hospital_code);

CREATE TABLE treat(
  license_number CHAR(4) NOT NULL,
  patient_ohip CHAR(9) NOT NULL,
  PRIMARY KEY(license_number, patient_ohip),
  FOREIGN KEY(license_number) REFERENCES doctor(license_number),
  FOREIGN KEY(patient_ohip) REFERENCES patient(patient_ohip) ON DELETE CASCADE
);

SHOW TABLES;
