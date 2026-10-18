# Hospital Management SQL Project

A MySQL project that manages and analyzes hospital data: departments, patients, doctors, appointments, treatments, and billing. It covers database design, sample data, analysis queries, and advanced SQL such as CTEs, window functions, views, and stored procedures.

## Database Schema

The database `hospital_analytics` has 6 related tables:

| Table | Description | Sample Rows |
|-------|-------------|-------------|
| `departments` | Department name and location (Cardiology, Neurology, Orthopedics, etc.) | 10 |
| `patients` | Patient details: name, gender, date of birth, contact, address, registration date | 10 |
| `doctors` | Doctor details: name, specialization, contact, department | 10 |
| `appointments` | Appointments between patients and doctors with date, time, reason, and status | 10 |
| `treatments` | Diagnosis, treatment description, date, and cost | 10 |
| `billing` | Bills with amount, payment method, and payment status | 10 |

**Relationships (foreign keys):**
- `doctors.department_id` → `departments.department_id`
- `appointments.patient_id` → `patients.patient_id`
- `appointments.doctor_id` → `doctors.doctor_id`
- `treatments.patient_id` → `patients.patient_id`
- `treatments.doctor_id` → `doctors.doctor_id`
- `billing.patient_id` → `patients.patient_id`
- `billing.treatment_id` → `treatments.treatment_id`

## Analysis Covered

### 1. Basic Analysis
- Total patients, doctors, and appointments
- Total revenue from billing
- Average treatment cost

### 2. Grouping and Aggregation
- Doctors per department
- Appointments per doctor
- Total and average treatment cost per doctor
- `HAVING` filters (departments with more than 1 doctor, doctors with total cost above 5000, average cost above 3000)

### 3. Joins
- `INNER JOIN` to combine patients, doctors, and appointments
- `LEFT JOIN` to list all patients, even without appointments
- `RIGHT JOIN` to list all doctors, even without appointments
- Appointment count per doctor and per department
- `UNION` and `UNION ALL` to combine patient and doctor names

### 4. CASE Statements
- Treatment cost categories: Low, Medium, High
- Payment status categories: Completed, Pending

### 5. String and Date Functions
- `UPPER`, `LOWER`, `CONCAT`, `LENGTH`, `LEFT`, `RIGHT`
- `YEAR`, `MONTH`, `DAY`, `DATEDIFF`, `CURDATE`

### 6. Subqueries and CTEs
- Treatments costing more than the average
- Most expensive treatment
- CTE for above-average treatment cost
- CTE for total cost per doctor

### 7. Window Functions
- `ROW_NUMBER()`, `RANK()`, `DENSE_RANK()` for treatment cost ranking
- `RANK() OVER (PARTITION BY doctor_id)` for ranking within each doctor
- `LAG()` and `LEAD()` for previous and next treatment cost
- Running total and running average

### 8. Views and Stored Procedures
- View: `patient_appointment_details` (patient, doctor, date, time, reason, status)
- Stored procedure: `GetDoctorAppointments(doctorID)` returns all appointments for a doctor

## SQL Concepts Used
- `CREATE DATABASE`, `CREATE TABLE`, primary keys, foreign keys, `AUTO_INCREMENT`
- `INSERT`, `SELECT`, `WHERE`, `ORDER BY`
- Aggregate functions: `COUNT`, `SUM`, `AVG`, `MAX`
- `GROUP BY` and `HAVING`
- `INNER`, `LEFT`, `RIGHT` joins, `UNION`
- `CASE` expressions
- Subqueries and CTEs
- Window functions
- Views and stored procedures

## Tools Used
- MySQL
- MySQL Workbench

## How to Run
1. Open MySQL Workbench (or any MySQL client).
2. Open `Hospital_Management.sql`.
3. Run the script from top to bottom. It creates the database and tables, inserts sample data, and runs all the analysis queries.

## Files
- `Hospital_Management.sql` – schema, sample data, analysis queries, view, and stored procedure

## Author
**Lefana Rose A**
GitHub: [lefanarose](https://github.com/lefanarose)
