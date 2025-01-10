# Write your MySQL query statement below

select m.employee_id , m.name , count(e.employee_id) as reports_count  ,
#round to integar
 round(avg(e.age),0) as average_age
from Employees e inner join  Employees m 
on m.employee_id= e.reports_to
group by m.employee_id
order by m.employee_id
