-- 620. Not Boring Movies
SELECT
  id , 
  movie , 
  description ,
  rating
FROM Cinema
WHERE (id % 2) <> 0 AND description <> "boring"
ORDER BY rating DESC
----------------------------------------------------------------
-- 1251. Average Selling Price
SELECT 
  p.product_id,
  round(sum(p.price * u.units) / sum(units),2) AS average_price
FROM Prices p 
LEFT JOIN UnitsSold u 
ON p.product_id = u.product_id
AND u.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY p.product_id
---------------------------
-- 1075. Project Employees I
SELECT 
   p.project_id,
   round(AVG(e.experience_years),2) average_years
FROM Project p 
INNER JOIN Employee e 
ON p.employee_id = e.employee_id
GROUP BY    p.project_id
---------------------
-- 1211. Queries Quality and Percentage
# Write your MySQL query statement below
with cte as ( 
SELECT 
   query_name, 
   CASE WHEN rating < 3 THEN 1 ELSE 0 END AS poor_query_flag,
   rating / position ratio
FROM Queries ) 

SELECT 
     query_name,
     round(AVG(ratio) , 2)  AS quality,
     round(sum(poor_query_flag) * 100 / count(*),2)   poor_query_percentage
FROM cte
GROUP BY query_name
-------------------------------------
