-- Month over month % change per course
WITH monthly_rev AS (
  SELECT c.course_id,
         TRUNC(p.payment_date,'MM') AS month,
         SUM(p.amount) AS revenue
  FROM payments p
  JOIN enrollments e ON p.enrollment_id = e.enrollment_id
  JOIN courses c     ON e.course_id = c.course_id
  GROUP BY c.course_id, TRUNC(p.payment_date,'MM')
)
SELECT course_id, month, revenue,
       LAG(revenue) OVER (PARTITION BY course_id ORDER BY month) AS prev_revenue,
       CASE 
         WHEN LAG(revenue) OVER (PARTITION BY course_id ORDER BY month) IS NULL THEN NULL
         ELSE ROUND( (revenue - LAG(revenue) OVER (PARTITION BY course_id ORDER BY month))
                      / LAG(revenue) OVER (PARTITION BY course_id ORDER BY month) * 100, 2)
       END AS pct_change
FROM monthly_rev
ORDER BY course_id, month;
