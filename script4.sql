-- Delete any doctor who got license before Jan 1, 1965
SELECT * FROM doctor;
DELETE FROM doctor WHERE licensed_date < "1965-01-01";
SELECT * FROM doctor;
-- The deletion fails due to the key constraint failure.
-- Because the licensed date is a foreign key of hospital and treat, the deletion will destroy the link between these tables.

-- Create a view: show all the p.first_name and p.last_name who are treated by head
-- made heads after 1995-12-31, display d.last_name and hospital_name
CREATE VIEW patient_treat_by_head AS
SELECT p.first_name, p.last_name, d.last_name AS "Doctor_Lastname", hospital_name
FROM patient p, treat t, hospital h, doctor d
WHERE p.patient_ohip = t.patient_ohip
AND d.license_number = t.license_number
AND h.current_head = d.license_number
AND start_date > "1995-12-31";

-- Select all row
SELECT * FROM patient_treat_by_head;

-- Show doctor table
SELECT * FROM doctor;
-- Show treat table
SELECT * FROM treat;

-- Delete the doctor with last name of Clooney
SELECT * FROM doctor;
DELETE FROM doctor WHERE last_name = "Clooney";
SELECT * FROM doctor;
-- The delete command works because there is a delete cascade on doctor table

-- Delete surgeons
DELETE FROM doctor WHERE specialty = "Surgeon";
-- Deletion fails because Dr.Aziz is a surgeon and a head of hospital.
