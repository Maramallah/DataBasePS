# Write your MySQL query statement below
-- cte table that has all ides superetly 
WITH
  AllIds AS (
    SELECT requester_id AS id FROM RequestAccepted
    UNION ALL
    SELECT accepter_id FROM RequestAccepted
  )
SELECT
  id,
  -- count all even null 
  COUNT(*) AS num
FROM AllIds
-- means group by first column
GROUP BY 1
-- order by second 
ORDER BY 2 DESC
LIMIT 1;