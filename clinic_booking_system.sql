-- Clinic booking system

CREATE DATABASE clinic_system;

USE clinic_system;

-- === Table: Specializations ===
CREATE TABLE Specializations (
    specialization_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

-- Data for Specializations
INSERT INTO Specializations (name) VALUES 
('Cardiology'), 
('Pediatrics'), 
('Dermatology'),
('Orthopedics'),
('Neurology'),
('Oncology'),
('Psychiatry'),
('Ophthalmology'),
('Dentistry'),
('General Surgery');

-- === Table: Doctors ===
CREATE TABLE Doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    specialization_id INT,
    FOREIGN KEY (specialization_id) REFERENCES Specializations(specialization_id)
);

-- Data for Doctors
INSERT INTO Doctors (name, email, specialization_id) VALUES 
('Dr. Diana Zulu', 'dianazulu@UTH.com', 1),
('Dr. Cathy Musasa', 'cathymusasa@UTH.com', 2),
('Dr. Steven Nyundu', 'stevennyundu@UTH.com', 3),
('Dr. David Mweemba', 'davidmweemba@UTH.com', 4),
('Dr. Emma Banda', 'emmaband@UTH.com', 5),
('Dr. Salome Chisanga', 'salomechisanga@UTH.com', 6),
('Dr. George Simbeye', 'georgesimbeye@UTH.com', 7),
('Dr. Helen Harris', 'helen.harris@UTH.com', 8),
('Dr. Anthony Zimba', 'anthonyzimba@UTH.com', 9),
('Dr. Jack Tembo', 'jacktembo@UTH.com', 10);

-- === Table: Patients ===
CREATE TABLE Patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE,
    phone VARCHAR(15) UNIQUE,
    email VARCHAR(100) UNIQUE
);

-- Patients Data
INSERT INTO Patients (name, date_of_birth, phone, email) VALUES
('John Phiri', '1990-05-12', '1234567890', 'johnphir@gmail.com'),
('Jane Tembo', '1985-09-23', '0987654321', 'janetembo@yahoo.com'),
('Michael Jordan', '1980-12-05', '2233445566', 'michaeljordan@gmail.com'),
('Sarah Miller', '1992-04-15', '1122334455', 'sarahmiller@gmail.com'),
('David Smith', '1978-07-09', '9988776655', 'davidsmith@yahoo.com'),
('Emily Zulu', '2000-01-25', '4455667788', 'emilyzulu@yahoo.com'),
('Alice Banda', '1986-06-19', '1234325647', 'alicebanda@gmail.com'),
('Charlie Davis', '1993-11-03', '8765432109', 'charliedavis@gamil.com'),
('Grace Kabaso', '1988-05-20', '5566778899', 'gracekabaso@yahoo.com'),
('Samuel Jere', '1995-02-14', '6677889900', 'samueljere@gmail.com');

-- === Table: Appointments ===
CREATE TABLE Appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    doctor_id INT NOT NULL,
    patient_id INT NOT NULL,
    appointment_date DATETIME NOT NULL,
    status ENUM('Scheduled', 'Completed', 'Cancelled') DEFAULT 'Scheduled',
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

-- Data for Appointments
INSERT INTO Appointments (doctor_id, patient_id, appointment_date, status) VALUES
(1, 1, '2025-05-15 10:00:00', 'Scheduled'),
(2, 2, '2025-05-16 14:00:00', 'Completed'),
(3, 3, '2025-05-17 09:30:00', 'Scheduled'),
(4, 4, '2025-05-18 11:00:00', 'Completed'),
(5, 5, '2025-05-19 13:00:00', 'Scheduled'),
(6, 6, '2025-05-20 15:00:00', 'Completed'),
(7, 7, '2025-05-21 10:45:00', 'Scheduled'),
(8, 8, '2025-05-22 14:30:00', 'Completed'),
(9, 9, '2025-05-23 16:00:00', 'Scheduled'),
(10, 10, '2025-05-24 08:15:00', 'Completed');

-- === Table: Medications ===
CREATE TABLE Medications (
    medication_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    dosage VARCHAR(50)
);

-- Data for Medications
INSERT INTO Medications (name, dosage) VALUES
('Ibuprofen', '200mg'),
('Amoxicillin', '500mg'),
('Paracetamol', '500mg'),
('Aspirin', '300mg'),
('Metformin', '500mg'),
('Lisinopril', '10mg'),
('Simvastatin', '20mg'),
('Losartan', '50mg'),
('Prednisone', '5mg'),
('Cetirizine', '10mg');

-- === Table: Prescriptions ===
CREATE TABLE Prescriptions (
    prescription_id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id INT NOT NULL,
    notes TEXT,
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id)
);

-- Data for Prescriptions
INSERT INTO Prescriptions (appointment_id, notes) VALUES
(1, 'Patient has a cold. Prescribed Ibuprofen for pain relief.'),
(2, 'Follow-up appointment. Prescribed Amoxicillin for infection.'),
(3, 'Prescribed Paracetamol for fever.'),
(4, 'Prescribed Aspirin for pain and swelling.'),
(5, 'Prescribed Metformin for blood sugar management.'),
(6, 'Prescribed Lisinopril for hypertension.'),
(7, 'Prescribed Simvastatin for high cholesterol.'),
(8, 'Prescribed Losartan for high blood pressure.'),
(9, 'Prescribed Prednisone for inflammation.'),
(10, 'Prescribed Cetirizine for allergies.');

-- === Table: Prescription_Medications ===
CREATE TABLE Prescription_Medications (
    prescription_id INT,
    medication_id INT,
    PRIMARY KEY (prescription_id, medication_id),
    FOREIGN KEY (prescription_id) REFERENCES Prescriptions(prescription_id),
    FOREIGN KEY (medication_id) REFERENCES Medications(medication_id)
);

-- Data for Prescription_Medications
INSERT INTO Prescription_Medications (prescription_id, medication_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);
