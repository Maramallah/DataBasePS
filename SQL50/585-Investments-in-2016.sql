# Write your MySQL query statement below
# Write your MySQL query statement below
WITH
  InsuranceWithCounts AS (
    SELECT
      tiv_2016,
      COUNT(*) OVER(PARTITION by tiv_2015) AS tiv_2015_count,
      COUNT(*) OVER(PARTITION by lat, lon) AS city_count
    FROM Insurance
  )
SELECT ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM InsuranceWithCounts
WHERE tiv_2015_count > 1
  AND city_count = 1;
-- or 
-- # Write your MySQL query statement below
-- select round(sum(tiv_2016),2) as tiv_2016 from Insurance
-- where tiv_2015 in 
-- (select tiv_2015  from Insurance
-- group by tiv_2015
-- having count(*)>1) and
-- (lat,lon) in 
-- ( select lat , lon from Insurance 
-- group by lat,lon
-- having count(*) =1 
-- )






