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
