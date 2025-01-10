#start
(select name as results 
-- instied of on use using 
from MovieRating inner JOIN Users using(user_id)
group by name
-- as simple as that 
order by count(*) desc, name
limit 1)
-- if user and movie name are the same allow duplications
union all
(select title as results 
from  MovieRating inner JOIN Movies USING(movie_id)
where year(created_at)=2020 and month(created_at)=2
group by title
-- u can order by agg function
order by avg(rating) desc , title
limit 1)