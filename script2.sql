USE zxiao72assign2db;
SELECT * FROM patient;

-- load patient data
LOAD DATA LOCAL INFILE "/home/centos/assignment2/loaddatafall2019.txt"
INTO TABLE patient
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(patient_ohip, first_name, last_name);

-- insert patient
INSERT INTO patient (patient_ohip, first_name, last_name)
VALUES (444361469, "Olivia", "Xiao");

SELECT * FROM patient;

-- insert doctor
SELECT * FROM doctor;

INSERT INTO doctor (first_name, last_name, specialty, licensed_date, license_number, hospital_code)
VALUES ("Bernie", "Kavorikian", "Urologist", "1980-09-09", "RD34", NULL);

INSERT INTO doctor (first_name, last_name, specialty, licensed_date, license_number, hospital_code)
VALUES ("Joey", "Shabado", "Podiatrist", "1960-06-24", "GD56", NULL);

INSERT INTO doctor (first_name, last_name, specialty, licensed_date, license_number, hospital_code)
VALUES ("Ross", "Clooney", "Surgeon", "1987-06-20", "HT45", NULL);

INSERT INTO doctor (first_name, last_name, specialty, licensed_date, license_number, hospital_code)
VALUES ("Ben", "Spock", "Pediatrician", "1955-02-20", "YT67", NULL);

INSERT INTO doctor (first_name, last_name, specialty, licensed_date, license_number, hospital_code)
VALUES ("Mandy", "Webster", "Surgeon", "1990-08-08", "JK78", NULL);

INSERT INTO doctor (first_name, last_name, specialty, licensed_date, license_number, hospital_code)
VALUES ("Colleen", "Aziz", "Surgeon", "1989-08-24", "SE66", NULL);

INSERT INTO doctor (first_name, last_name, specialty, licensed_date, license_number, hospital_code)
VALUES ("Weiyi", "Song", "Psychiatrist", "1992-02-17", "PG13", NULL);

SELECT * FROM doctor;

-- insert hospital
SELECT * FROM hospital;

INSERT INTO hospital (hospital_name, city, province, number_beds, hospital_code, current_head, start_date)
VALUES ("St. Joseph", "London", "On", 1000, "BBC", "GD56", "1999-09-10");

INSERT INTO hospital (hospital_name, city, province, number_beds, hospital_code, current_head, start_date)
VALUES ("Victoria", "London", "On", 1600, "ABC", "YT67", "1997-12-07");

INSERT INTO hospital (hospital_name, city, province, number_beds, hospital_code, current_head, start_date)
VALUES ("Victoria", "Victoria", "BC", 1200, "DDE", "SE66", "1989-08-24");

SELECT * FROM hospital;

-- insert treat
SELECT * FROM treat;

INSERT INTO treat (license_number, patient_ohip)
VALUES ("GD56", 110112113);

INSERT INTO treat (license_number, patient_ohip)
VALUES ("HT45", 444555666);

INSERT INTO treat (license_number, patient_ohip)
VALUES ("JK78", 444555666);

INSERT INTO treat (license_number, patient_ohip)
VALUES ("JK78", 111222333);

INSERT INTO treat (license_number, patient_ohip)
VALUES ("SE66", 111222333);

INSERT INTO treat (license_number, patient_ohip)
VALUES ("YT67", 111222333);

INSERT INTO treat (license_number, patient_ohip)
VALUES ("GD56", 333444555);

INSERT INTO treat (license_number, patient_ohip)
VALUES ("YT67", 667766777);

INSERT INTO treat (license_number, patient_ohip)
VALUES ("JK78", 667766777);

INSERT INTO treat (license_number, patient_ohip)
VALUES ("GD56", 667766777);

INSERT INTO treat (license_number, patient_ohip)
VALUES ("YT67", 111222111);

INSERT INTO treat (license_number, patient_ohip)
VALUES ("HT45", 444361469);

SELECT * FROM treat;

-- update doctor
SELECT * FROM doctor;

UPDATE doctor SET hospital_code = "BBC" WHERE license_number = "RD34";
UPDATE doctor SET hospital_code = "BBC" WHERE license_number = "GD56";
UPDATE doctor SET hospital_code = "ABC" WHERE license_number = "HT45";
UPDATE doctor SET hospital_code = "ABC" WHERE license_number = "YT67";
UPDATE doctor SET hospital_code = "ABC" WHERE license_number = "JK78";
UPDATE doctor SET hospital_code = "ABC" WHERE license_number = "SE66";
UPDATE doctor SET hospital_code = "DDE" WHERE license_number = "PG13";

SELECT * FROM doctor;

-- update patient
SELECT * FROM patient;
UPDATE patient SET patient_ohip = 111222111 WHERE last_name = "Brown";
SELECT * FROM patient;


-- update treat 
UPDATE treat t, doctor d1, doctor d2
SET t.license_number = d2.license_number
WHERE t.license_number = d1.license_number AND
d1.last_name = 'Spock' AND d2.last_name = 'Clooney';
