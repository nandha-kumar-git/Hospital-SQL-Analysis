select (select count(*) from appointments) as Total_patients,
(select count(*) from departments) as Total_departments,
(select count (*) from doctors) as Total_doctors,
(select count(*) from insurance_providers) as Total_insurance_providers,
(select count (*) from invoices) as Total_invoices,
(select count(*)from patients) as Total_patinets,
(select count(*)from staff) as Total_staffs,
(select count(*)from treatments) as Total_treatments


select gender , count(*) as patients,
round(
count(*)*100/sum(count(*)) over (),2) as percentage
from patients
group by gender
order by patients desc

select emirate, count(*) as patient_count
from patients
group by emirate
order by patient_count desc

select nationality, count(*) as patient_count
from patients
group by nationality
order by patient_count desc;

select i.provider_name, count(*) as patient_count
from patients p 
inner join insurance_providers i
on p.insurance_id = i.insurance_id
group by i.provider_name
order by patient_count desc;

select status, count(*) as appointments,
round (count(*)*100 / sum(count(*)) over (),2) as percentage
from appointments
group by status 
order by appointments desc;

select count(*) as total_appointments,
count(*) filter (where status = 'No-Show') as no_show_count,
round (count(*) filter (where status = 'No-Show')*100/count(*),2) as no_show_rate,
count(*) filter (where status = 'Cancelled') as cancelled_count,
round (count(*) filter (where status = 'Cancelled')*100/count(*),2) as cancellation_rate
from appointments

select d.department_name, count(*) as appointment_count
from appointments a
join doctors dc
on dc.doctor_id = a.doctor_id
join departments d
on d.department_id = dc.department_id
group by department_name
order by appointment_count desc

select d.department_name, count(*) as appointment_count,
round (avg(duration_minutes),2) as average_duration
from appointments a
join doctors dc
on dc.doctor_id = a.doctor_id
join departments d
on d.department_id = dc.department_id
group by department_name
order by average_duration desc

select reason_for_visit, count(*) as no_of_visits
from appointments
group by reason_for_visit 
order by no_of_visits desc

alter table appointments
alter column appointment_datetime type timestamp
using appointment_datetime::timestamp;

select date_trunc ('month', appointment_datetime) as month, count(*) as appointment_count
from appointments
group by 1
order by 1

select specialty, count(*) as doctor_count
from doctors
group by specialty
order by doctor_count desc

select doc.doctor_id,
doc.first_name || ' ' || doc.last_name as doctor_name,
doc.specialty,
count(a.appointment_id) as appointment_count
from doctors doc
join appointments a
on doc.doctor_id = a.doctor_id
group by
doc.doctor_id,
doc.first_name,
doc.last_name,
doc.specialty
order by appointment_count desc

select severity,
count(*) as treatment_count,
round(count(*) * 100.0 /sum(count(*)) over (), 2) as percentage
from treatments
group by severity
order by treatment_count desc

select count(*) as total_invoices,
round (sum(total_amount), 2) as total_billed,
round(sum(amount_paid), 2) as total_collected,
round(sum(total_amount - amount_paid),2) as outstanding_amount
from invoices

update invoices
set payment_status = 'Paid'
where payment_status = 'PAID'

select payment_status,
count(*) as invoice_count,
round(sum(total_amount), 2) as billed_amount,
round(sum(amount_paid), 2) as collected_amount
from invoices
group by payment_status
order by billed_amount desc;

select ip.provider_name,
count(*) as invoice_count,
round(sum(i.total_amount), 2) as total_billed,
round(sum(i.amount_paid), 2) as amount_collected,
round(sum(i.total_amount - i.amount_paid),2) as outstanding_amount
from invoices i
join patients p
on i.patient_id = p.patient_id
join insurance_providers ip
on p.insurance_id = ip.insurance_id
group by ip.provider_name
order by outstanding_amount desc

alter table invoices
alter column days_to_pay type numeric
using days_to_pay::numeric

select payment_method,
count(*) as invoice_count,
round(avg(days_to_pay),2) as avg_days_to_pay
from invoices
where days_to_pay is not null
group by payment_method
order by avg_days_to_pay desc


select d.department_name,
count(*) as invoice_count,
round(sum(i.total_amount), 2) as total_billed,
round(sum(i.amount_paid), 2) as total_collected,
round(sum(i.total_amount - i.amount_paid),2) as outstanding_amount
from invoices i
join appointments a
on i.appointment_id = a.appointment_id
join doctors doc
on a.doctor_id = doc.doctor_id
join departments d
on doc.department_id = d.department_id
group by d.department_name
order by total_billed desc



