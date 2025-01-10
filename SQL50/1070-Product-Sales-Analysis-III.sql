# Write your MySQL query statement below

select product_id , year as first_year, quantity , price 
from Sales 
#if you want the both to be equal the both in the in clause 
where (product_id,year) in (select product_id ,min(year) as year from Sales 
group by product_id) 