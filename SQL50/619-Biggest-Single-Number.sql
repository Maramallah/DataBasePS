#coalesce will ive null other wise and limit one gives max num 
# we wrote it cuz other wise we will be having empty set insted of null 
SELECT COALESCE ((SELECT num FROM MyNumbers GROUP BY num HAVING COUNT(num) = 1 ORDER BY num DESC LIMIT 1), null) AS num;