# Write your MySQL query statement below
# need to groub by the machine id then for each mid+pid that is equivelent uget the start then end then u get the output then / number mid/2 cuz each repeting twice for each start and end
select machine_id , cast(AVG(TimeDifference) as DECIMAL(10, 3))  as  processing_time  from (
select e.machine_id, (e.timestamp - s.timestamp ) AS TimeDifference 
from Activity e inner join Activity s 
on e.machine_id = s.machine_id and  e.process_id=s.process_id and e.activity_type= 'end' and s.activity_type='start') AS DerivedTableAlias

group by machine_id