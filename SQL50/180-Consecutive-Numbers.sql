# Write your MySQL query statement below
#a common table to use as u like in selects and joins 
-- CTE is ideal for temporary, one-time use and simplifies complex queries for a single query scope.
-- View is a persistent database object that acts like a virtual table, reusable across different queries and sessions.
#common table expression
with cte as (
    select num,
    lead(num,1) over() num1,
    lead(num,2) over() num2
    from logs

)

select distinct num ConsecutiveNums from cte where (num=num1) and (num=num2)