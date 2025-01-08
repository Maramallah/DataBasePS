# Write your MySQL query statement below
-- use union once to get how many he accepted and how many he requested 
-- union all cuz there will be duplications
-- order by sum count 
-- get the most by limit 1
select id , sum(c) as num from (
select requester_id as id , count(requester_id) as c 
from RequestAccepted 
group by requester_id
union all
select accepter_id as id , count(accepter_id) as c 
from RequestAccepted 
group by accepter_id) s
group by id 
order by sum(c) desc
limit 1