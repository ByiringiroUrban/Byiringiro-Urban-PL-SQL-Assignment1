-- monthly totals, then running cumulative total by region
SELECT region, sale_month,
       month_total,
       SUM(month_total) OVER (PARTITION BY region ORDER BY sale_month
             ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_total
FROM (
  SELECT c.region, TRUNC(t.sale_date,'MM') AS sale_month, SUM(t.amount) AS month_total
  FROM transactions t JOIN customers c ON c.customer_id = t.customer_id
  GROUP BY c.region, TRUNC(t.sale_date,'MM')
) x
ORDER BY region, sale_month;
