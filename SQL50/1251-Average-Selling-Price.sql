# Write your MySQL query statement below
select product_id, IFNULL(ROUND(SUM(price * units) / NULLIF(SUM(units), 0), 2), 0) AS average_price 
from (
select p.product_id ,p.price, s.units 
from Prices p left join UnitsSold s
on p.product_id = s.product_id and
( s.purchase_date >=p.start_date and s.purchase_date <= p.end_date) ) p
group by product_id