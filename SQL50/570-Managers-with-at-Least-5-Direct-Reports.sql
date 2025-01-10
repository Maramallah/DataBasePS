# Write your MySQL query statement below
# Write your MySQL query statement below
select name from (
select m.id as id  , m.name , e.id as empid , e.name as empname from Employee m left join Employee e
on m.id = e.managerId) m
group by id 
having count(id)>4

