alter table departments
add primary key (department_id);

alter table insurance_providers
add primary key (insurance_id);

alter table doctors
add primary key (doctor_id);

alter table staff
add primary key (staff_id);

alter table patients
add primary key (patient_id);

alter table appointments
add primary key (appointment_id);

alter table treatments
add primary key (treatment_id);

alter table invoices
add primary key (invoice_id);

alter table doctors
add constraint fk_doctors_department
foreign key (department_id) references departments(department_id);


alter table staff
add constraint fk_staff_department
foreign key (department_id) references departments(department_id);

alter table patients
add constraint fk_patients_insurance
foreign key (insurance_id) references insurance_providers(insurance_id);

alter table appointments
add constraint fk_appointments_patient
foreign key (patient_id) references patients(patient_id)


alter table appointments
add constraint fk_appointments_doctor
foreign key (doctor_id) references doctors(doctor_id);

alter table treatments
add constraint fk_treatments_appointment
foreign key (appointment_id) references appointments(appointment_id);


alter table treatments
add constraint fk_treatments_patient
foreign key (patient_id) references patients(patient_id);


alter table invoices
add constraint fk_invoices_appointment
foreign key (appointment_id) references appointments(appointment_id);


alter table invoices
add constraint fk_invoices_patient
foreign key (patient_id) references patients(patient_id);

update patients
set insurance_id = null
where insurance_id not in (select insurance_id from insurance_providers);

update staff
set department_id = null
where department_id not in (select department_id from departments);

update doctors
set department_id = null
where department_id not in (select department_id from departments);

update appointments
set patient_id = null
where patient_id not in (select patient_id from patients);

update treatments
set appointment_id = null
where appointment_id not in (select appointment_id from appointments);


update invoices
set appointment_id = null
where appointment_id not in (select appointment_id from appointments);

update treatments
set patient_id = null
where patient_id not in (select patient_id from patients);

alter table invoices
alter column patient_id type integer
using patient_id::integer;

update invoices
set patient_id = null
where patient_id not in (select patient_id from patients);

alter table treatments
alter column patient_id type integer
using patient_id::integer;

alter table treatments 
alter column patient_id type integer using patient_id::numeric::integer;