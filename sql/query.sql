
#Print a list of all doctors based at a particular hospital.
SELECT name, person_id FROM doctors_and_patients WHERE hospital_id=23;


#Print a list of all prescriptions for a particular patient, ordered by the prescription date.
SELECT * FROM prescriptions WHERE patient_id = 140 ORDER BY prescription_date;


#Print a list of all prescriptions that a particular doctor has prescribed.

SELECT * FROM prescriptions WHERE doctor_id = 4;

#Add a new patient to the database, including being registered with one of the doctors.

INSERT into doctors_and_patients (name, date_of_birth, address, role, assigned_doctor_id) VALUES ('Gabrielle Alonso', '1955-01-14', '123 Park Road, City Centre, Q23 THH','patient', 4); 

# Identify which doctor has made the most prescriptions.

CREATE VIEW totals AS SELECT prescriptions.prescription_id, prescriptions.medication, prescriptions.doctor_id, prescriptions.prescription_date, doctors_and_patients.name
FROM prescriptions
INNER JOIN doctors_and_patients
ON doctors_and_patients.person_id = doctor_id;

SELECT name, COUNT(*) from totals GROUP BY name ORDER BY COUNT(*) DESC LIMIT 1;

#Print a list of all doctors at the hospital with biggest size

#First filter hospital to find the biggest size 
SELECT size, name FROM hospital ORDER BY size DESC LIMIT 1;

#Then create view from a join of hospital and doctors_and_patients displaying hospital names and doctors who work there

CREATE VIEW size AS SELECT doctors_and_patients.person_id, doctors_and_patients.hospital_id, doctors_and_patients.name AS doctor_name, hospital_name AS hospital_name FROM hospital INNER JOIN doctors_and_patients ON doctors_and_patients.hospital_id = hospital.hospital_id;

SELECT * FROM size WHERE hospital_name = 'Peters, Anderson and Baker Hospital';




