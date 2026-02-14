
#To load data from hospital.csv table into database  
LOAD DATA LOCAL INFILE '/home/ubuntu/assessments/hpdm206Z/assessment1/hospital.csv' INTO TABLE hospital
 FIELDS TERMINATED BY ','
 OPTIONALLY ENCLOSED BY '"'
 LINES TERMINATED BY '\n'
 IGNORE 1 LINES
 (hospital_id, name, address, size, type, @acc_status)
 
 #To transform accreditation status into a boolean data type  
 SET accreditation_status =
 IF (@acc_status) = 'accredited', 1, 0);
 
 #To load data from patients.csv table into database  
LOAD DATA LOCAL INFILE '/home/ubuntu/assessments/hpdm206Z/assessment1/patients.csv'' INTO TABLE 'doctors_and_patients'
 FIELDS TERMINATED BY ','
 OPTIONALLY ENCLOSED BY '"'
 LINES TERMINATED BY '\n'
 IGNORE 1 LINES
 (person_id, name, date_of_birth, address, role, assigned_doctor_id) 
SET hospital_id = NULL; 

#To load data from doctors.csv table into database  
LOAD DATA LOCAL INFILE '/home/ubuntu/assessments/hpdm206Z/assessment1/doctors.csv' INTO TABLE doctors_and_patients
 FIELDS TERMINATED BY ','
 OPTIONALLY ENCLOSED BY '"'
 LINES TERMINATED BY '\n'
 IGNORE 1 LINES
 (person_id, name, date_of_birth, address, role, hospital_id); 

#To load data from prescriptions.csv table into database  
LOAD DATA LOCAL INFILE '/home/ubuntu/assessments/hpdm206Z/assessment1/prescriptions.csv' INTO TABLE prescriptions
 FIELDS TERMINATED BY ','
 OPTIONALLY ENCLOSED BY '"'
 LINES TERMINATED BY '\n'
 IGNORE 1 LINES
 (prescription_id, patient_id, doctor_id, medication, prescription_date);
 