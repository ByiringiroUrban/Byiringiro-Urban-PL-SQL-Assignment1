-- Top products per region & quarter with RANK
SELECT region, year, quarter, product_id, product_name, total_revenue, rnk
FROM (
  SELECT region, year, quarter, product_id, product_name, total_revenue,
         RANK() OVER (PARTITION BY region, year, quarter ORDER BY total_revenue DESC) AS rnk
  FROM (
    SELECT c.region,
           TO_CHAR(t.sale_date,'YYYY') AS year,
           'Q' || TO_CHAR(TRUNC((TO_NUMBER(TO_CHAR(t.sale_date,'MM'))-1)/3)+1) AS quarter,
           p.product_id, p.name AS product_name,
           SUM(t.amount) AS total_revenue
    FROM transactions t
    JOIN customers c ON c.customer_id = t.customer_id
    JOIN products p  ON p.product_id = t.product_id
    GROUP BY c.region, TO_CHAR(t.sale_date,'YYYY'),
             'Q' || TO_CHAR(TRUNC((TO_NUMBER(TO_CHAR(t.sale_date,'MM'))-1)/3)+1),
             p.product_id, p.name
  ) grp
)
WHERE rnk <= 5
ORDER BY region, year, quarter, rnk;
