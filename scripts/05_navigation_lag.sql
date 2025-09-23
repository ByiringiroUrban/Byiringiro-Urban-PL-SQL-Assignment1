-- month over month growth %
SELECT region, sale_month, month_total,
       LAG(month_total) OVER (PARTITION BY region ORDER BY sale_month) AS prev_month_total,
       CASE WHEN LAG(month_total) OVER (PARTITION BY region ORDER BY sale_month) IS NULL
            THEN NULL
            ELSE ROUND( (month_total - LAG(month_total) OVER (PARTITION BY region ORDER BY sale_month))
                        / LAG(month_total) OVER (PARTITION BY region ORDER BY sale_month) * 100, 2)
       END AS pct_change
FROM (
  SELECT c.region, TRUNC(t.sale_date,'MM') AS sale_month, SUM(t.amount) AS month_total
  FROM transactions t JOIN customers c ON c.customer_id = t.customer_id
  GROUP BY c.region, TRUNC(t.sale_date,'MM')
) x
ORDER BY region, sale_month;
