SELECT 
    c.contest_id, 
    ROUND((COUNT(c.user_id) / (SELECT COUNT(user_id) FROM Users)) * 100, 2) AS percentage
FROM 
    Register c
GROUP BY 
    c.contest_id
order by percentage desc , contest_id asc
