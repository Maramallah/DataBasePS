# Write your MySQL query statement below
SELECT
   distinct(visited_on),
    SUM(amount) OVER (
        ORDER BY visited_on
        RANGE BETWEEN INTERVAL 6 DAY PRECEDING AND CURRENT ROW
    ) AS amount,
    round((sum(amount) OVER (
        ORDER BY visited_on
        RANGE BETWEEN INTERVAL 6 DAY PRECEDING AND CURRENT ROW
    )/7),2) AS average_amount
FROM Customer
limit 100000000000 offset 6;