
select patient_id, first_name, last_name, email
from patients
where email not like '%@%.%'
or email like '%@'
or email like '@%'
order by patient_id



update patients
set email = null
where email is not null
and (email not like '%@%.%'
     or email like '%@'
     or email like '@%'
     or email in ('notvalid', 'user@', 'bad@@mail.com', 'not_an_email'));
  

select 
count(*) as total_patients,
count(case when email is null 
  or email not like '%@%.%' 
  or email like '%@' 
  or email like '@%' 
  then 1 end) as bad_or_missing_emails
from patients;

select  gender,count(*) as count
from patients
group by gender
order by count desc;

update patients
set gender = 'M' where gender like 'Male' 

update patients
set gender = 'F' where gender like 'female'

select status, count(*) 
from appointments 
group by status 
order by count(*) desc;

update appointments
set status = 'Completed' where status = 'COMPLETED';

update appointments
set status = 'Completed' where status = 'complet ed';

update appointments
set status = 'No-Show' where status = 'no show';

select first_name, last_name, date_of_birth, count(*)
from patients
group by first_name, last_name, date_of_birth
having count(*) > 1;

delete from patients p
where p.patient_id not in (select min(patient_id) from patients
group by first_name, last_name, date_of_birth
);

select invoice_id, total_amount, patient_responsibility, amount_paid
from invoices
where total_amount < 0
   or patient_responsibility < 0
   or amount_paid < 0

update invoices
set total_amount = null
where total_amount < 0;

select doctor_id, first_name, last_name, department_id
from doctors
where department_id not in (select department_id from departments);

update doctors
set department_id = null
where department_id not in (select department_id from departments);