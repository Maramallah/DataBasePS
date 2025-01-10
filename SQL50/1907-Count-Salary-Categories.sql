# Write your MySQL query statement below

SELECT 
    'Low Salary' AS category, 
    #or COUNT(if(income<20000,1,null)) AS accounts_count
    # null here works if u put 0 it`ll still countes all records 
    SUM( income < 20000 ) AS accounts_count 
FROM Accounts
UNION
SELECT 
    'Average Salary' AS category, 
    SUM(income BETWEEN 20000 AND 50000 ) AS accounts_count 
FROM Accounts
UNION
SELECT 
    'High Salary' AS category, 
    SUM( income > 50000 ) AS accounts_count 
FROM Accounts;