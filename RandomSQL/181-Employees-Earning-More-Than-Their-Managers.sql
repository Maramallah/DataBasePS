# Write your MySQL query statement below
select e.name as Employee from 
Employee e inner join Employee m
on m.id= e.managerId
where e.salary>m.salary