# Write your MySQL query statement below
select ifnull(
(select salary from (
    -- this gives even duplicates a chance to be on same group while 
    -- rank if same duplicates it erase one rank so me carefull
select distinct (salary) ,  DENSE_RANK() over(order by salary desc) as r 
from Employee )s
where r=2), null) as SecondHighestSalary 

