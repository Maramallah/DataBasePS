# Write your MySQL query statement below
-- here we used if condition to swap ids which is a better idea than swapping names
-- if id is odd the it moves to next id id+1 if even moves to past id id-1
-- gotta check the last id cuz if it`s odd then we don`t change it 
-- else we make it the prev
-- select if(
--     id<(select max(id) from Seat),
--     if(id%2=0, id-1, id+1),
--     if(id%2=0, id-1,id)) as id, student 
--     from Seat
--     order by id
-- or with window function 
-- if id is even take the previous name else check if there is a name after and replace with it 
select id , if(id%2=0,
 lag(student) over(order by id) , 
 ifnull(lead(student)over(order by id), 
 student)) as student 
from Seat
