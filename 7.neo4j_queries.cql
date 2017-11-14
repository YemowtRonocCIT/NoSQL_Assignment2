Query 1:
(Most popular cuisine)

MATCH (n:restaurants) 
WITH n.cuisine AS cuisines, count(n.cuisine) AS count_cuisine 
ORDER BY count_cuisine DESC 
LIMIT 1 
RETURN cuisines, count_cuisine;