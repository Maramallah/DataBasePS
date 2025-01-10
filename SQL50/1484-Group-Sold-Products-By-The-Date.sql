#use the group_concat to do it
select sell_date , count(distinct product) as num_sold ,
GROUP_CONCAT(distinct product order by product SEPARATOR ',') as products
from (SELECT DISTINCT sell_date,product FROM Activities) as Activities 
group by sell_date