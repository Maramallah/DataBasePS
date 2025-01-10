# Write your MySQL query statement below
select w.id from Weather w inner join Weather b 
#table of both versions on this condition
on w.recordDate = DATE_ADD(b.recordDate, INTERVAL 1 DAY)
#then get back and achive this one
where w.temperature > b.temperature  