CREATE DATABASE hospital_analytics;

USE hospital_analytics;

CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL,
    location VARCHAR(100)
);

CREATE TABLE patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender VARCHAR(10),
    date_of_birth DATE,
    phone VARCHAR(15),
    email VARCHAR(100),
    address VARCHAR(255),
    registration_date DATE
);

CREATE TABLE doctors (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    specialization VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100),
    department_id INT,
    FOREIGN KEY (department_id) 
        REFERENCES departments(department_id)
);

CREATE TABLE appointments (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    appointment_time TIME,
    reason VARCHAR(255),
    status VARCHAR(30),

    FOREIGN KEY (patient_id)
        REFERENCES patients(patient_id),

    FOREIGN KEY (doctor_id)
        REFERENCES doctors(doctor_id)
);

CREATE TABLE treatments (
    treatment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    doctor_id INT,
    treatment_date DATE,
    diagnosis VARCHAR(255),
    treatment_description VARCHAR(500),
    treatment_cost DECIMAL(10,2),

    FOREIGN KEY (patient_id)
        REFERENCES patients(patient_id),

    FOREIGN KEY (doctor_id)
        REFERENCES doctors(doctor_id)
);

CREATE TABLE billing (
    bill_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    treatment_id INT,
    bill_date DATE,
    amount DECIMAL(10,2),
    payment_method VARCHAR(30),
    payment_status VARCHAR(30),

    FOREIGN KEY (patient_id)
        REFERENCES patients(patient_id),

    FOREIGN KEY (treatment_id)
        REFERENCES treatments(treatment_id)
);

SELECT * FROM departments;

INSERT INTO patients
(first_name, last_name, gender, date_of_birth, phone, email, address, registration_date)
VALUES
('Arun', 'Kumar', 'Male', '1995-04-12', '9876543210', 'arun.kumar@email.com', 'Chennai', '2026-01-10'),
('Priya', 'Sharma', 'Female', '1998-07-25', '9876543211', 'priya.sharma@email.com', 'Coimbatore', '2026-01-15'),
('Rahul', 'Raj', 'Male', '1990-11-03', '9876543212', 'rahul.raj@email.com', 'Madurai', '2026-01-20'),
('Divya', 'Krishnan', 'Female', '2001-02-18', '9876543213', 'divya.krishnan@email.com', 'Chennai', '2026-02-02'),
('Vijay', 'Suresh', 'Male', '1987-09-30', '9876543214', 'vijay.suresh@email.com', 'Salem', '2026-02-08'),
('Anitha', 'Mohan', 'Female', '1993-06-14', '9876543215', 'anitha.mohan@email.com', 'Trichy', '2026-02-12'),
('Karthik', 'Ravi', 'Male', '1996-12-22', '9876543216', 'karthik.ravi@email.com', 'Chennai', '2026-02-18'),
('Meena', 'Devi', 'Female', '1985-03-09', '9876543217', 'meena.devi@email.com', 'Madurai', '2026-02-25'),
('Sanjay', 'Kumar', 'Male', '1999-08-17', '9876543218', 'sanjay.kumar@email.com', 'Coimbatore', '2026-03-01'),
('Lakshmi', 'Priya', 'Female', '1992-10-05', '9876543219', 'lakshmi.priya@email.com', 'Chennai', '2026-03-05');

SELECT * FROM patients;

INSERT INTO departments (department_id, department_name, location)
VALUES
(1, 'Cardiology', 'Block A'),
(2, 'Neurology', 'Block A'),
(3, 'Orthopedics', 'Block B'),
(4, 'Pediatrics', 'Block B'),
(5, 'General Medicine', 'Block C'),
(6, 'Dermatology', 'Block C'),
(7, 'Emergency', 'Block D'),
(8, 'Radiology', 'Block D'),
(9, 'Oncology', 'Block E'),
(10, 'Gynecology', 'Block E');

SELECT * FROM departments;

SHOW TABLES;

DESCRIBE departments

SELECT * FROM doctors;

SELECT department_id, department_name
FROM departments;


SHOW CREATE TABLE doctors;

USE hospital_analytics;

INSERT INTO doctors
(first_name, last_name, specialization, phone, email, department_id)
VALUES
('Arun', 'Kumar', 'Cardiologist', '9876543210', 'arun@hospital.com', 1);

SELECT * FROM doctors;

INSERT INTO doctors
(first_name, last_name, specialization, phone, email, department_id)
VALUES
('Priya', 'Sharma', 'Neurologist', '9876543211', 'priya@hospital.com', 2),
('Ravi', 'Kumar', 'Orthopedic Surgeon', '9876543212', 'ravi@hospital.com', 3),
('Meena', 'Raj', 'Pediatrician', '9876543213', 'meena@hospital.com', 4),
('Karthik', 'S', 'General Physician', '9876543214', 'karthik@hospital.com', 5),
('Divya', 'Mohan', 'Dermatologist', '9876543215', 'divya@hospital.com', 6),
('Suresh', 'Babu', 'Emergency Physician', '9876543216', 'suresh@hospital.com', 7),
('Anitha', 'Joseph', 'Radiologist', '9876543217', 'anitha@hospital.com', 8),
('Naveen', 'Raj', 'Oncologist', '9876543218', 'naveen@hospital.com', 9),
('Lakshmi', 'Devi', 'Gynecologist', '9876543219', 'lakshmi@hospital.com', 10);

SELECT * FROM doctors;

DESCRIBE appointments;

SELECT patient_id, patient_name
FROM patients;

SELECT doctor_id, first_name, last_name
FROM doctors;

DESCRIBE patients;

USE hospital_analytics;

SELECT patient_id, first_name, last_name
FROM patients;

DESCRIBE patients;

INSERT INTO appointments
(patient_id, doctor_id, appointment_date, appointment_time, reason, status)
VALUES
(1, 1, '2026-08-01', '09:00:00', 'Chest pain', 'Completed'),
(2, 2, '2026-08-02', '10:00:00', 'Headache', 'Completed'),
(3, 3, '2026-08-03', '11:00:00', 'Knee pain', 'Completed'),
(4, 4, '2026-08-04', '09:30:00', 'Child fever', 'Completed'),
(5, 5, '2026-08-05', '10:30:00', 'General checkup', 'Completed'),
(6, 6, '2026-08-06', '11:30:00', 'Skin allergy', 'Completed'),
(7, 7, '2026-08-07', '08:30:00', 'Emergency consultation', 'Completed'),
(8, 8, '2026-08-08', '12:00:00', 'X-ray consultation', 'Completed'),
(9, 9, '2026-08-09', '14:00:00', 'Cancer consultation', 'Scheduled'),
(10, 10, '2026-08-10', '15:00:00', 'Routine gynecology checkup', 'Scheduled');

SELECT * FROM appointments;

SHOW Tables;

SHOW COLUMNS FROM treatments;

INSERT INTO treatments
(patient_id, doctor_id, treatment_date, diagnosis, treatment_description, treatment_cost)
VALUES
(1, 1, '2026-08-01', 'Hypertension', 'Blood pressure monitoring and medication', 2500.00),
(2, 2, '2026-08-02', 'Migraine', 'Neurological consultation and medication', 3000.00),
(3, 3, '2026-08-03', 'Knee Arthritis', 'Physiotherapy and pain management', 4500.00),
(4, 4, '2026-08-04', 'Viral Fever', 'Medication and hydration treatment', 1500.00),
(5, 5, '2026-08-05', 'Diabetes', 'Blood sugar monitoring and medication', 3500.00),
(6, 6, '2026-08-06', 'Skin Allergy', 'Allergy treatment and medication', 2000.00),
(7, 7, '2026-08-07', 'Minor Injury', 'Wound cleaning and dressing', 1800.00),
(8, 8, '2026-08-08', 'Fracture', 'X-ray evaluation and fracture treatment', 6000.00),
(9, 9, '2026-08-09', 'Tumor Evaluation', 'Oncology consultation and investigation', 8000.00),
(10, 10, '2026-08-10', 'Routine Checkup', 'General health examination', 2000.00);

SHOW COLUMNS FROM billing;

INSERT INTO billing
(treatment_id, bill_date, amount, payment_method, payment_status)
VALUES
(1, '2026-08-01', 2500.00, 'Cash', 'Paid'),
(2, '2026-08-02', 3000.00, 'UPI', 'Paid'),
(3, '2026-08-03', 4500.00, 'Credit Card', 'Paid'),
(4, '2026-08-04', 1500.00, 'Cash', 'Paid'),
(5, '2026-08-05', 3500.00, 'UPI', 'Paid'),
(6, '2026-08-06', 2000.00, 'Debit Card', 'Paid'),
(7, '2026-08-07', 1800.00, 'Cash', 'Pending'),
(8, '2026-08-08', 6000.00, 'Credit Card', 'Paid'),
(9, '2026-08-09', 8000.00, 'UPI', 'Pending'),
(10, '2026-08-10', 2000.00, 'Debit Card', 'Paid');

SELECT * FROM billing;

SELECT * FROM patients;

SELECT * FROM doctors;

SELECT * FROM appointments;

SELECT * FROM treatments;

SELECT * FROM billing;

SELECT COUNT(*) AS total_patients
FROM patients;

SELECT COUNT(*) AS total_doctors
FROM doctors;

SELECT COUNT(*) AS total_appointments
FROM appointments;

SELECT SUM(amount) AS total_revenue
FROM billing;

SELECT AVG(treatment_cost) AS average_treatment_cost
FROM treatments;

SELECT
    department_id,
    COUNT(*) AS total_doctors
FROM doctors
GROUP BY department_id;

SELECT
    doctor_id,
    COUNT(*) AS total_appointments
FROM appointments
GROUP BY doctor_id;

SELECT
    doctor_id,
    SUM(treatment_cost) AS total_treatment_cost
FROM treatments
GROUP BY doctor_id;

SELECT
    doctor_id,
    AVG(treatment_cost) AS average_treatment_cost
FROM treatments
GROUP BY doctor_id;

SELECT
    d.department_name,
    COUNT(dr.doctor_id) AS total_doctors
FROM departments d
LEFT JOIN doctors dr
    ON d.department_id = dr.department_id
GROUP BY d.department_name;

SELECT
    department_id,
    COUNT(*) AS total_doctors
FROM doctors
GROUP BY department_id
HAVING COUNT(*) > 1;

SELECT
    doctor_id,
    SUM(treatment_cost) AS total_cost
FROM treatments
GROUP BY doctor_id
HAVING SUM(treatment_cost) > 5000;

SELECT
    doctor_id,
    AVG(treatment_cost) AS average_cost
FROM treatments
GROUP BY doctor_id
HAVING AVG(treatment_cost) > 3000;

SELECT
    p.first_name AS patient_first_name,
    p.last_name AS patient_last_name,
    d.first_name AS doctor_first_name,
    d.last_name AS doctor_last_name,
    a.appointment_date,
    a.reason,
    a.status
FROM appointments a
INNER JOIN patients p
    ON a.patient_id = p.patient_id
INNER JOIN doctors d
    ON a.doctor_id = d.doctor_id;
    
    
SELECT
    p.patient_id,
    p.first_name,
    p.last_name,
    a.appointment_date,
    a.status
FROM patients p
LEFT JOIN appointments a
    ON p.patient_id = a.patient_id;
    
SELECT
    d.doctor_id,
    d.first_name,
    d.last_name,
    a.appointment_date,
    a.status
FROM appointments a
RIGHT JOIN doctors d
    ON a.doctor_id = d.doctor_id;
    
SELECT
    d.doctor_id,
    d.first_name,
    d.last_name,
    COUNT(a.appointment_id) AS total_appointments
FROM doctors d
LEFT JOIN appointments a
    ON d.doctor_id = a.doctor_id
GROUP BY
    d.doctor_id,
    d.first_name,
    d.last_name;
    
SELECT
    dep.department_name,
    d.first_name,
    d.last_name,
    COUNT(a.appointment_id) AS total_appointments
FROM departments dep
JOIN doctors d
    ON dep.department_id = d.department_id
LEFT JOIN appointments a
    ON d.doctor_id = a.doctor_id
GROUP BY
    dep.department_name,
    d.doctor_id,
    d.first_name,
    d.last_name;
    
    
SELECT first_name AS person_name
FROM patients

UNION

SELECT first_name AS person_name
FROM doctors;

SELECT first_name AS person_name
FROM patients

UNION ALL

SELECT first_name AS person_name
FROM doctors;

SELECT
    treatment_id,
    diagnosis,
    treatment_cost,
    CASE
        WHEN treatment_cost < 2500 THEN 'Low Cost'
        WHEN treatment_cost BETWEEN 2500 AND 5000 THEN 'Medium Cost'
        ELSE 'High Cost'
    END AS cost_category
FROM treatments;

SELECT
    treatment_id,
    amount,
    payment_status,
    CASE
        WHEN payment_status = 'Paid' THEN 'Completed Payment'
        WHEN payment_status = 'Pending' THEN 'Payment Pending'
        ELSE 'Other'
    END AS payment_category
FROM billing;

SELECT
    first_name,
    UPPER(first_name) AS uppercase_name
FROM patients;

SELECT
    first_name,
    LOWER(first_name) AS lowercase_name
FROM patients;

SELECT
    CONCAT(first_name, ' ', last_name) AS full_name
FROM patients;

SELECT
    first_name,
    LENGTH(first_name) AS name_length
FROM patients;

SELECT
    first_name,
    LEFT(first_name, 3) AS first_three_characters
FROM patients;

SELECT
    first_name,
    RIGHT(first_name, 2) AS last_two_characters
FROM patients;

SELECT
    patient_id,
    first_name,
    YEAR(registration_date) AS registration_year
FROM patients;

SELECT
    patient_id,
    first_name,
    MONTH(registration_date) AS registration_month
FROM patients;

SELECT
    patient_id,
    first_name,
    DAY(registration_date) AS registration_day
FROM patients;

SELECT
    patient_id,
    first_name,
    DATEDIFF(CURDATE(), registration_date) AS days_since_registration
FROM patients;

SELECT
    treatment_id,
    diagnosis,
    treatment_cost
FROM treatments
WHERE treatment_cost > (
    SELECT AVG(treatment_cost)
    FROM treatments
);

SELECT
    treatment_id,
    diagnosis,
    treatment_cost
FROM treatments
WHERE treatment_cost = (
    SELECT MAX(treatment_cost)
    FROM treatments
);

WITH average_cost AS (
    SELECT AVG(treatment_cost) AS avg_cost
    FROM treatments
)
SELECT
    t.treatment_id,
    t.diagnosis,
    t.treatment_cost
FROM treatments t
CROSS JOIN average_cost a
WHERE t.treatment_cost > a.avg_cost;

WITH doctor_cost AS (
    SELECT
        doctor_id,
        SUM(treatment_cost) AS total_cost
    FROM treatments
    GROUP BY doctor_id
)
SELECT *
FROM doctor_cost
ORDER BY total_cost DESC;

SELECT
    doctor_id,
    treatment_id,
    treatment_cost,
    ROW_NUMBER() OVER (
        ORDER BY treatment_cost DESC
    ) AS row_num
FROM treatments;

SELECT
    doctor_id,
    treatment_id,
    treatment_cost,
    RANK() OVER (
        ORDER BY treatment_cost DESC
    ) AS treatment_rank
FROM treatments;

SELECT
    doctor_id,
    treatment_id,
    treatment_cost,
    DENSE_RANK() OVER (
        ORDER BY treatment_cost DESC
    ) AS treatment_rank
FROM treatments;

SELECT
    doctor_id,
    treatment_id,
    treatment_cost,
    RANK() OVER (
        PARTITION BY doctor_id
        ORDER BY treatment_cost DESC
    ) AS doctor_treatment_rank
FROM treatments;

SELECT
    treatment_id,
    treatment_date,
    treatment_cost,
    LAG(treatment_cost) OVER (
        ORDER BY treatment_date
    ) AS previous_cost
FROM treatments;

SELECT
    treatment_id,
    treatment_date,
    treatment_cost,
    LEAD(treatment_cost) OVER (
        ORDER BY treatment_date
    ) AS next_cost
FROM treatments;

SELECT
    treatment_id,
    treatment_date,
    treatment_cost,
    SUM(treatment_cost) OVER (
        ORDER BY treatment_date
    ) AS running_total
FROM treatments;

SELECT
    treatment_id,
    treatment_date,
    treatment_cost,
    AVG(treatment_cost) OVER (
        ORDER BY treatment_date
    ) AS running_average
FROM treatments;

CREATE VIEW patient_appointment_details AS
SELECT
    p.patient_id,
    CONCAT(p.first_name, ' ', p.last_name) AS patient_name,
    CONCAT(d.first_name, ' ', d.last_name) AS doctor_name,
    a.appointment_date,
    a.appointment_time,
    a.reason,
    a.status
FROM patients p
JOIN appointments a
    ON p.patient_id = a.patient_id
JOIN doctors d
    ON a.doctor_id = d.doctor_id;
    
    DELIMITER //

CREATE PROCEDURE GetDoctorAppointments(IN doctorID INT)
BEGIN
    SELECT
        a.appointment_id,
        a.patient_id,
        a.appointment_date,
        a.appointment_time,
        a.reason,
        a.status
    FROM appointments a
    WHERE a.doctor_id = doctorID;
END //

DELIMITER ;

CALL GetDoctorAppointments(1);