with department_revenue as
(select d.department_name,
sum(i.total_amount) as revenue
from invoices i
join appointments a
on i.appointment_id = a.appointment_id
join doctors doc
on a.doctor_id = doc.doctor_id
join departments d
on doc.department_id = d.department_id
group by d.department_name)
select department_name,
round(revenue, 2) as revenue
from department_revenue
order by revenue desc


select department_name,
total_billed,
rank() over (order by total_billed desc) as revenue_rank
from (
select d.department_name,
sum(i.total_amount) as total_billed
from invoices i
join appointments a
on i.appointment_id = a.appointment_id
join doctors doc
on a.doctor_id = doc.doctor_id
join departments d
on doc.department_id = d.department_id
group by d.department_name)


select d.department_name,
doc.first_name || ' ' || doc.last_name as doctor_name,
count(a.appointment_id) as appointments,
rank() over (partition by d.department_name
order by count(a.appointment_id) desc) as doctor_rank
from appointments a
join doctors doc
on a.doctor_id = doc.doctor_id
join departments d
on doc.department_id = d.department_id
group by d.department_name,
doc.doctor_id,
doc.first_name,
doc.last_name

with doctor_workload as
(select d.department_name,
doc.doctor_id,
doc.first_name || ' ' || doc.last_name as doctor_name,
count(a.appointment_id) as appointment_count
from appointments a
join doctors doc
on a.doctor_id = doc.doctor_id
join departments d
on doc.department_id = d.department_id
group by d.department_name, doc.doctor_id, doc.first_name,doc.last_name),
ranked as
(select *, dense_rank() over (partition by department_name
order by appointment_count desc) as doctor_rank
from doctor_workload)
select * from ranked where doctor_rank <= 3 order by department_name, doctor_rank

