# Hospital Management System – SQL Data Analysis Project

## Project Overview
This project demonstrates a complete end-to-end SQL workflow on a realistic hospital dataset.  
It covers database creation, data cleaning, constraint enforcement, exploratory analysis, business insights, and advanced SQL techniques (CTEs, window functions, ranking).

The dataset simulates a multi-department hospital with patients, doctors, staff, appointments, treatments, invoices, and insurance providers.

## Dataset Description

| Table                  | Description                                      | Approx. Rows|
|------------------------|--------------------------------------------------|-------------|
| `patients`             | Patient demographics & insurance                 | ~15,000+    |
| `doctors`              | Doctor profiles & specialties                    | ~200        |
| `staff`                | Non-doctor hospital staff                        | ~100+       |
| `departments`          | Hospital departments                             | ~12         |
| `appointments`         | Appointment records (status, duration, reason)   | ~100,000    |
| `treatments`           | Diagnosis & procedure details                    | ~39,000     |
| `invoices`             | Billing, payments & outstanding amounts          | ~25,000     |
| `insurance_providers`  | Insurance companies & plans                      | -9          |

**Key relationships**
- Patients → Appointments → Treatments / Invoices
- Doctors → Appointments (via department)
- Patients → Insurance Providers
- Staff / Doctors → Departments

## Project Structure
Hospital-SQL-Analysis/
├── data/
|     └── patients
|     └── doctors
|     └── staff
|     └── departments
|     └── appointments
|     └── treatments
|     └── invoices
|     └── insurance_providers
├── SQL Analysis/
|     └── 01_Database_Creation.sql
|     └── 02_Data_Cleaning.sql
|     └── 03_Adding_Constraints.sql
|     └── 04_Exploratory_Analysis.sql
|     └── 05_Business_Analysis.sql
|     └── 06_Advanced_SQL_Analysis.sql      
├── screenshots/                           
│     └── 01_Data_rows_count
│     └── 02_Gender discrepencies updated
│     └── 03_Status updated
│     └── 04_Hospital master stat
│     └── 05_Appointment status distribution
│     └── 06_Dept wise avg duration
│     └── 07_Top reasons for visit
│     └── 08_Doc dept wise appt count
│     └── 09_Payment status
│     └── 10_Payer wise payment status
│     └── 11_ Dept wise payment status
│     └── 12_ Dept wise no show rate
│     └── 13_ Frequently visiting pts
│     └── 14_ Dept wise revenue ranking
│     └── 15_ Dept wise top 3 docs
├── docs/
│   └── ER_Diagram.png                      
└── README.md
