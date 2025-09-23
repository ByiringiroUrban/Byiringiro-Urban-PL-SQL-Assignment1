-- Example: ROW_NUMBER vs DENSE_RANK vs PERCENT_RANK
SELECT product_id, product_name, region, total_revenue,
       ROW_NUMBER() OVER (PARTITION BY region ORDER BY total_revenue DESC) AS rn,
       DENSE_RANK() OVER (PARTITION BY region ORDER BY total_revenue DESC) AS dr,
       PERCENT_RANK() OVER (PARTITION BY region ORDER BY total_revenue DESC) AS pr
FROM (
  SELECT p.product_id, p.name product_name, c.region, SUM(t.amount) AS total_revenue
  FROM transactions t JOIN products p ON t.product_id = p.product_id
                    JOIN customers c ON c.customer_id = t.customer_id
  GROUP BY p.product_id, p.name, c.region
) q
ORDER BY region, total_revenue DESC;
