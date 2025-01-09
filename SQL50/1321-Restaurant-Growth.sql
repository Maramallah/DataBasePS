# Write your MySQL query statement below
SELECT
   distinct(visited_on),
   -- u get sum of each date and if there is 0~ 6 days befor it 
    SUM(amount) OVER (
        ORDER BY visited_on
        -- means the range is 6 including the date ur on 
        RANGE BETWEEN INTERVAL 6 DAY PRECEDING AND CURRENT ROW
    ) AS amount,
    -- u want it to divide it on 7 days so u won`t use avg cuz it`ll divid it by the num of all rows or the num of date occourance it`s self 
    round((sum(amount) OVER (
        ORDER BY visited_on
        RANGE BETWEEN INTERVAL 6 DAY PRECEDING AND CURRENT ROW
    )/7),2) AS average_amount
FROM Customer
-- here cuz i don`t want to the first 6 days so off set delets them 
limit 100000000000 offset 6;