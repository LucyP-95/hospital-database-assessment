# Project aim: 
To create a hospital database that incorporates data from 4 tables: doctors,
patients, prescriptions and hospitals. (see data folder) The database should have the functionality to link 
these entities to enable the sql queries listed below under sql.  

# Database
The Database is compiled of 3 tables, linked by foreign keys. The doctors table and the patients table have been compiled into the table
doctors_and_patients, with the primary key of person_id. The two remaining tables are hospital and prescriptions.

- hospital — contains hospital information
- doctors_and_patients — stores doctor and patient data, linked to hospital via hospital_id
- prescriptions — links to doctors_and_patients via doctor_id and patient_id

# Main files:
## planning
Two planning files are listed. The entity relationship diagram for this database is saved in the ERD file. 
The pseudocode for the creation of this database is saved in the pseudocode file. 

## data 
The data used to populate this database is saved in the data folder.

## sql
The sql queries used to create, load and extract data are saved in the folder sql, under the names create.sql.
load.sql and query.sql respectively. The purpose of the queries is listed as a comment above the sql in 
each file. 

# How to use:
- Run create.sql to generate the database schema.
- Run load.sql to populate the tables (update file paths as needed).
- Run the queries in query.sql to extract data, following the comments above each query.
