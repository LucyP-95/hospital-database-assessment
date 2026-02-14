#Creating a databse called `hospital_database`
CREATE DATABASE hospital_database;

USE hospital_database;

#Creating a table called `hospital`and defining column names and data type 
CREATE TABLE `hospital` (

`hospital_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,

`name` VARCHAR(150) NOT NULL,

`address` VARCHAR(150) NOT NULL,

`size` INT UNSIGNED NOT NULL,

`type` VARCHAR(150) NOT NULL,

`accreditation_status` BOOLEAN NOT NULL DEFAULT 0, 

PRIMARY KEY (`hospital_id`) 

);


CREATE TABLE `doctors_and_patients` (

`person_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,

`name` VARCHAR (50) NOT NULL,

`date_of_birth` DATE NOT NULL,

`address` VARCHAR (150) NOT NULL,

`role` ENUM ('doctor', 'patient')

`assigned_doctor_id` INT UNSIGNED NULL AUTO_INCREMENT,

`hospital_id` INT UNSIGNED NULL, 

PRIMARY KEY (`person_id`),

FOREIGN KEY (`hospital_id`) 
REFERENCES hospital(hospital_id)  	

); 

CREATE TABLE `prescriptions` (

`prescription_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,

`patient_id` INT UNSIGNED NOT NULL,

`doctor_id` INT UNSIGNED NOT NULL,

`medication` VARCHAR (50) NOT NULL,

`prescription_date` DATE NOT NULL,

PRIMARY KEY (`prescription_id`),

FOREIGN KEY (`doctor_id`)
REFERENCES doctors_and_patients(person_id),
 
FOREIGN KEY (`patient_id`)
REFERENCES doctors_and_patients(person_id)

);

