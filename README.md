Clinic Booking System Database
📌 Project Title
Clinic Booking System

📝 Description
The Clinic Booking System is a MySQL-based database designed to help clinics manage key administrative and medical tasks. It handles data related to:

Doctors and their specializations

Patients and their contact details

Appointments scheduled between doctors and patients

Prescriptions issued during appointments

Medications linked to each prescription

The project demonstrates a structured relational database solution using standard SQL with realistic sample data and constraints (PK, FK, NOT NULL, UNIQUE, ENUM).

⚙️ How to Run/Setup the Project
🧩 Requirements
MySQL Server or MySQL Workbench installed locally

Any SQL client that supports .sql scripts

📥 Setup Steps
Create the Database
Open your SQL client and run the following:

sql
Copy
Edit
CREATE DATABASE clinic_system;
USE clinic_system;
Import the SQL Script

Download or clone the GitHub repository.

Locate the file named clinic_system.sql.

Run the SQL script using your client:

In MySQL Workbench: Open the file and click "Run".

In command-line:

bash
Copy
Edit
mysql -u your_username -p clinic_system < path/to/clinic_system.sql
Verify Setup

Check if tables are created:

sql
Copy
Edit
SHOW TABLES;
Check data:

sql
Copy
Edit
SELECT * FROM Doctors;
📊 Entity Relationship Diagram (ERD)
The ERD visualizes relationships between:

Doctors → Specializations (Many-to-One)

Appointments → Doctors & Patients (Many-to-One)

Prescriptions → Appointments (One-to-One)

Prescriptions → Medications (Many-to-Many via Prescription_Medications)

📁 Files in This Repository
clinic_system.sql:
A single, well-commented SQL script

README.md or README.txt:
This file, explaining the purpose, structure, and usage of the project.

