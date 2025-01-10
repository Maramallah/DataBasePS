# Write your MySQL query statement below
select * 
from Cinema 
where id&1 != 0 and description != 'boring'
order by rating desc 
