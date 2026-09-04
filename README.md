# Hospital Management System – SQL Data Analysis Project

## Project Overview

This project demonstrates a complete end-to-end SQL workflow on a realistic hospital dataset.  
It covers database creation, data cleaning, constraint enforcement, exploratory analysis, business insights, and advanced SQL techniques (CTEs, window functions, ranking).

The dataset simulates a multi-department hospital with patients, doctors, staff, appointments, treatments, invoices, and insurance providers.

---

## Dataset Description

| Table                  | Description                                      | Approx. Rows |
|------------------------|--------------------------------------------------|--------------|
| `patients`             | Patient demographics & insurance                 | ~15,000+     |
| `doctors`              | Doctor profiles & specialties                    | ~200         |
| `staff`                | Non-doctor hospital staff                        | ~100+        |
| `departments`          | Hospital departments                             | ~12          |
| `appointments`         | Appointment records (status, duration, reason)   | ~100,000     |
| `treatments`           | Diagnosis & procedure details                    | ~39,000      |
| `invoices`             | Billing, payments & outstanding amounts          | ~25,000      |
| `insurance_providers`  | Insurance companies & plans                      | ~9           |

**Key Relationships**
- Patients → Appointments → Treatments / Invoices  
- Doctors → Appointments (via department)  
- Patients → Insurance Providers  
- Staff / Doctors → Departments  

---

## Project Structure
Hospital-SQL-Analysis/
├── data/
│   ├── patients
│   ├── doctors
│   ├── staff
│   ├── departments
│   ├── appointments
│   ├── treatments
│   ├── invoices
│   └── insurance_providers
│
├── SQL Analysis/
│   ├── 01_Database_Creation.sql
│   ├── 02_Data_Cleaning.sql
│   ├── 03_Adding_Constraints.sql
│   ├── 04_Exploratory_Analysis.sql
│   ├── 05_Business_Analysis.sql
│   └── 06_Advanced_SQL_Analysis.sql
│
├── screenshots/
│   ├── 01_Data_rows_count
│   ├── 02_Gender_discrepancies_updated
│   ├── 03_Status_updated
│   ├── 04_Hospital_master_stat
│   ├── 05_Appointment_status_distribution
│   ├── 06_Dept_wise_avg_duration
│   ├── 07_Top_reasons_for_visit
│   ├── 08_Doc_dept_wise_appt_count
│   ├── 09_Payment_status
│   ├── 10_Payer_wise_payment_status
│   ├── 11_Dept_wise_payment_status
│   ├── 12_Dept_wise_no_show_rate
│   ├── 13_Frequently_visiting_pts
│   ├── 14_Dept_wise_revenue_ranking
│   └── 15_Dept_wise_top_3_docs
│
├── docs/
│   └── ER_Diagram.png
│
└── README.md



## SQL Scripts Breakdown

| Script                        | Purpose                                                                                                           |
|-------------------------------|-------------------------------------------------------------------------------------------------------------------|
| `01_Database_Creation.sql`    | Creates all 8 tables with initial schema                                                                          |
| `02_Data_Cleaning.sql`        | Fixes invalid emails, standardizes gender & status, removes duplicates, handles negative amounts & orphan records |
| `03_Adding_Constraints.sql`   | Adds Primary Keys + Foreign Keys and cleans remaining referential integrity issues                                |
| `04_Exploratory_Analysis.sql` | Row counts, demographics, appointment status, department workload, revenue overview, payment methods              |
| `05_Business_Analysis.sql`    | Cancellation / No-Show rates by department, inactive doctors, high-frequency patients                             |
| `06_Advanced_SQL_Analysis.sql`| CTEs, window functions (`RANK`, `DENSE_RANK`), department revenue ranking, top-3 doctors per department           |

---

## Entity-Relationship Diagram

![ER Diagram](docs/ER_Diagram.png)

### Main Relationships

departments 1 ─── * doctors
departments 1 ─── * staff
insurance_providers 1 ─── * patients
patients 1 ─── * appointments
doctors 1 ─── * appointments
appointments 1 ─── * treatments
appointments 1 ─── * invoices
patients 1 ─── * treatments
patients 1 ─── * invoices


---

## How to Run the Project

1. Create a PostgreSQL database (recommended).
2. Run the scripts **in order**:

```sql
\i "SQL Analysis/01_Database_Creation.sql"
\i "SQL Analysis/02_Data_Cleaning.sql"
\i "SQL Analysis/03_Adding_Constraints.sql"
\i "SQL Analysis/04_Exploratory_Analysis.sql"
\i "SQL Analysis/05_Business_Analysis.sql"
\i "SQL Analysis/06_Advanced_SQL_Analysis.sql"

3.Import data from the files inside the data/ folder.

## Tools Used

1.PostgreSQL
2.Excel (data source)
3.Git & GitHub
