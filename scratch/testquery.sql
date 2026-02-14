
#Print a list of all doctors based at a particular hospital.
SELECT name, person_id FROM doctors_and_patients WHERE hospital_id=23;
+--------------------+-----------+
| name               | person_id |
+--------------------+-----------+
| Dr. Ashley Hooper  |         2 |
| Dr. Calvin Howell  |        45 |
| Dr. Erica Holloway |        47 |
| Dr. Haley Long     |        65 |
| Dr. Shaun Morrison |        96 |
+--------------------+-----------+

#Print a list of all prescriptions for a particular patient, ordered by the prescription date.
SELECT * FROM prescriptions WHERE patient_id = 140 ORDER BY prescription_date;
+-----------------+------------+-----------+--------------+-------------------+
| prescription_id | patient_id | doctor_id | medication   | prescription_date |
+-----------------+------------+-----------+--------------+-------------------+
|             265 |        140 |         4 | Atorvastatin | 2023-08-04        |
|             423 |        140 |         4 | Amoxicillin  | 2024-06-18        |
+-----------------+------------+-----------+--------------+-------------------+

#Print a list of all prescriptions that a particular doctor has prescribed.

SELECT * FROM prescriptions WHERE doctor_id = 4;

#Add a new patient to the database, including being registered with one of the doctors.

INSERT into doctors_and_patients (name, date_of_birth, address, role, assigned_doctor_id) VALUES ('Gabrielle Alonso', '1955-01-14', '123 Park Road, City Centre, Q23 THH','patient', 4); 

# Identify which doctor has made the most prescriptions.

CREATE VIEW totals AS SELECT prescriptions.prescription_id, prescriptions.medication, prescriptions.doctor_id, prescriptions.prescription_date, doctors_and_patients.name
FROM prescriptions
INNER JOIN doctors_and_patients
ON doctors_and_patients.person_id = doctor_id;

SELECT name, COUNT(*) from totals GROUP BY name;

#Print a list of all doctors at the hospital with biggest size

#First filter hospital to find the biggest size 
SELECT size, name FROM hospital ORDER BY size DESC LIMIT 1;

#Then create view from a join of hospital and doctors_and_patients displaying hospital names and doctors who work there

CREATE VIEW size AS SELECT doctors_and_patients.name AS doctor_name, hospital.name AS hospital_name FROM hospital INNER JOIN doctors_and_patients  ON doctors_and_patients.hospital_id = hospital.hospital_id;

#Finally use count function to total doctors working at specific hospital 
SELECT hospital_name, COUNT(*) AS doctors FROM size WHERE hospital_name = 'Peters, Anderson and Baker Hospital' GROUP BY hospital_name;

