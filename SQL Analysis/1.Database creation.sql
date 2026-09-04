create table appointments (
    appointment_id        integer primary key,
    patient_id            integer references patients(patient_id),
    doctor_id             integer references doctors(doctor_id),
    appointment_datetime  timestamp,
    status                varchar(30),
    reason_for_visit      varchar(200),
    notes                 text,
    created_at            timestamp,
    duration_minutes      integer
)


create table departments (
department_id integer,
department_name varchar(100),
location varchar(120),
phone_ext varchar(20),
cost_center varchar(20))


create table doctors (
doctor_id integer,
first_name varchar(50),
last_name varchar(50),
specialty varchar(100),
department_id integer,
nationality varchar(40),
hire_date varchar(20),
license_number varchar(40),
email varchar(120),
phone varchar(30),
years_experience integer,
is_active boolean)


create table insurance_providers (
insurance_id integer,
provider_name varchar(100),
plan_type varchar(50),
contact_phone varchar(30),
network_status varchar(30))


create table invoices (
    invoice_id                 integer primary key,
    appointment_id             integer references appointments(appointment_id),
    patient_id                 integer references patients(patient_id),
    invoice_date               date,
    total_amount               numeric(12,2),
    insurance_covered_amount   numeric(12,2),
    patient_responsibility     numeric(12,2),
    amount_paid                numeric(12,2),
    payment_status             varchar(40),
    payment_method             varchar(40),
    last_payment_date          date,
    days_to_pay                integer
)



create table patients (
patient_id integer,
first_name varchar(50),
last_name varchar(50),
date_of_birth varchar(20),
gender varchar(10),
phone varchar(50),
email varchar(150),
address_line varchar(200),
city varchar(80),
emirate varchar(50),
insurance_id integer,
registration_date varchar(20),
blood_type varchar(5),
emergency_contact_name varchar(100),
emergency_contact_phone varchar(20),
nationality varchar(40),
is_deceased boolean)


create table staff (
staff_id integer,
first_name varchar(50),
last_name varchar(50),
role varchar(70),
department_id integer,
nationality varchar(40),
hire_date varchar(20),
shift varchar(20),
email varchar(150),
is_active boolean)


create table treatments (
    treatment_id           integer primary key,
    appointment_id         integer references appointments(appointment_id),
    patient_id             integer references patients(patient_id),
    diagnosis_code         varchar(20),
    diagnosis_description  varchar(250),
    procedure_code         varchar(20),
    severity               varchar(20),
    follow_up_required     boolean
)


alter table treatments
alter column patient_id type varchar(20)

alter table invoices
alter column days_to_pay type varchar(20)

alter table treatments
alter column appointment_id type varchar(20)
