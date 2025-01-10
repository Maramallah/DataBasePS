with w as (
    select person_name , sum(weight) over (order by turn) as sumw
    from Queue
)

select person_name from w 
where sumw <= 1000
order by sumw desc
limit 1;

