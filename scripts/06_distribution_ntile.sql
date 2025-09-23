-- customer segmentation by total spend per region
SELECT customer_id, customer_name, region, total_spend,
       NTILE(4) OVER (PARTITION BY region ORDER BY total_spend DESC) AS quartile,
       CUME_DIST() OVER (PARTITION BY region ORDER BY total_spend DESC) AS cum_dist
FROM (
  SELECT c.customer_id, c.name AS customer_name, c.region, SUM(t.amount) AS total_spend
  FROM transactions t JOIN customers c ON c.customer_id = t.customer_id
  GROUP BY c.customer_id, c.name, c.region
) s
ORDER BY region, quartile, total_spend DESC;
