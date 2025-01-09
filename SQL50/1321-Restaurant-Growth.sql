# Write your MySQL query statement below
-- SELECT
--    distinct(visited_on),
--    -- u get sum of each date and if there is 0~ 6 days befor it 
--     SUM(amount) OVER (
--         ORDER BY visited_on
--         -- means the range is 6 including the date ur on 
--         RANGE BETWEEN INTERVAL 6 DAY PRECEDING AND CURRENT ROW
--     ) AS amount,
--     -- u want it to divide it on 7 days so u won`t use avg cuz it`ll divid it by the num of all rows or the num of date occourance it`s self 
--     round((sum(amount) OVER (
--         ORDER BY visited_on
--         RANGE BETWEEN INTERVAL 6 DAY PRECEDING AND CURRENT ROW
--     )/7),2) AS average_amount
-- FROM Customer
-- -- here cuz i don`t want to the first 6 days so off set delets them 
-- limit 100000000000 offset 6;
-- or use a cte and start date with 6 days after first day
-- WITH RollingWindow AS (
--     SELECT
--         visited_on,
--         SUM(amount) OVER (
--             ORDER BY visited_on
--             RANGE BETWEEN INTERVAL 6 DAY PRECEDING AND CURRENT ROW
--         ) AS amount,
--         ROUND(SUM(amount) OVER (
--             ORDER BY visited_on
--             RANGE BETWEEN INTERVAL 6 DAY PRECEDING AND CURRENT ROW
--         ) / 7, 2) AS average_amount,
--         -- this over do the same job as (select min(visited_on) from customers)
--         MIN(visited_on) OVER () + INTERVAL 6 DAY AS start_date
--     FROM Customer
-- )
-- SELECT distinct(visited_on), amount, average_amount
-- FROM RollingWindow
-- WHERE visited_on >= start_date
-- ORDER BY visited_on;
-- or use sekf join 
select a.visited_on , sum(amount) as amount ,
round(sum(amount)/7,2) as average_amount
from (select distinct(visited_on) from Customer ) a join Customer b
on datediff(a.visited_on , b.visited_on ) between 0 and 6 
group by  a.visited_on
having count(distinct(b.visited_on)) =7
order by a.visited_on 

