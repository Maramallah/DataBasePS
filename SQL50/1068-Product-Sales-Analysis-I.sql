# Write your MySQL query statement below
select 
e.product_name  ,
s.year,
s.price
from Sales s
left join Product e
on s.product_id =e.product_id