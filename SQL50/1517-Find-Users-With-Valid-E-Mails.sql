# Write your MySQL query statement below
select * from Users 
-- must start with letter and have letters or didgits or _.- and must end with @leetcode 
-- * means 0 or more accourance of the past in our case [a-zA-Z0-9_.-]
where mail REGEXP '^[a-zA-Z][a-zA-Z0-9_.-]*@leetcode\\.com$'