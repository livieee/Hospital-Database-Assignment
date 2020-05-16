-- Query 1
SELECT last_name FROM patient;
-- Query 2
SELECT DISTINCT last_name FROM patient;
-- Query 3
SELECT * FROM doctor ORDER BY last_name;
-- Query 4
SELECT hospital_name, hospital_code FROM hospital
WHERE number_beds > 1500;
-- Query 5
SELECT last_name, first_name FROM doctor d, hospital h
WHERE d.hospital_code = h.hospital_code
AND hospital_name = "St. Joseph";
-- Query 6
SELECT first_name, last_name FROM patient
WHERE last_name LIKE 'G%';
-- Query 7
SELECT p.first_name, p.last_name FROM patient p, treat t, doctor d
WHERE p.patient_ohip = t.patient_ohip AND t.license_number = d.license_number
-- Query 8
SELECT hospital_name, city, d.last_name FROM hospital h, doctor d
WHERE h.current_head = d.license_number;
-- Query 9
SELECT SUM(number_beds) AS "Total Number of Beds" FROM hospital;
-- Query 10
SELECT p.first_name, d.first_name FROM patient p, doctor d, treat t, hospital h
WHERE p.patient_ohip = t.patient_ohip
AND d.license_number = t.license_number
AND d.license_number = h.current_head;
-- Query 11
SELECT last_name, first_name FROM doctor d, hospital h
WHERE d.hospital_code = h.hospital_code
AND hospital_name = "Victoria"
AND specialty = "Surgeon";
-- Query 12
SELECT first_name FROM doctor d
WHERE d.license_number NOT IN(
  SELECT t.license_number FROM treat t
);
-- Query 13
SELECT last_name, first_name FROM doctor d, treat t
WHERE d.license_number = t.license_number
GROUP BY d.license_number
HAVING COUNT(patient_ohip) > 1;
