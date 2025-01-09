# Write your MySQL query statement below
-- select d.name as Department , e.name as Employee , e.salary as Salary
-- from (
-- select name , salary, departmentId , dense_rank() over (partition by departmentId order by salary desc)  as r  from Employee ) e left join Department d
-- on d.id= e.departmentId 
-- where e.r in (1,2,3)
WITH RankedEmployees AS (
    SELECT 
        e.name AS Employee, 
        e.salary AS Salary, 
        e.departmentId,
        DENSE_RANK() OVER (PARTITION BY e.departmentId ORDER BY e.salary DESC) AS r
    FROM Employee e
)
SELECT 
    d.name AS Department, 
    re.Employee, 
    re.Salary
FROM RankedEmployees re
LEFT JOIN Department d ON d.id = re.departmentId
WHERE re.r IN (1, 2, 3)
ORDER BY d.name, re.r;



