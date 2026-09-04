select d.department_name,
count(*) as total_appointments,
count(*) filter (where a.status = 'Cancelled') as cancelled,
count(*) filter (where a.status = 'No-Show') as no_shows,
round(count(*) filter (where a.status in ('Cancelled', 'No-Show')) * 100.0 / count(*),2 ) 
as cancellation_no_show_rate
from appointments a
join doctors doc
on a.doctor_id = doc.doctor_id
join departments d
on doc.department_id = d.department_id
group by d.department_name
order by cancellation_no_show_rate desc

select doc.doctor_id,
doc.first_name || ' ' ||   doc.last_name as doctor_full_name
from doctors doc
left join appointments a
on doc.doctor_id = a.doctor_id
where a.appointment_id is null


select p.patient_id,
p.first_name || ' '|| p.last_name as patient_full_name,
count(a.appointment_id) as appointment_count
from patients p
join appointments a
on p.patient_id = a.patient_id
group by p.patient_id,
p.first_name,
p.last_name
having count(a.appointment_id) > 10
order by appointment_count desc


select d.department_name,
count(*) as total_appointments,
count(*) filter (where a.status = 'Cancelled') as cancelled,
count(*) filter (where a.status = 'No-Show') as no_shows,
round(count(*) filter (where a.status in ('Cancelled', 'No-Show')) * 100.0 / count(*),2 ) 
as cancellation_no_show_rate
from appointments a
join doctors doc
on a.doctor_id = doc.doctor_id
join departments d
on doc.department_id = d.department_id
group by d.department_name
order by cancellation_no_show_rate desc


