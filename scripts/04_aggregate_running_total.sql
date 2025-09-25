-- monthly revenue per course and running total (cumulative)
WITH monthly_rev AS (
  SELECT c.course_id,
         c.title,
         TRUNC(p.payment_date,'MM') AS month,
         SUM(p.amount) AS revenue
  FROM payments p
  JOIN enrollments e ON p.enrollment_id = e.enrollment_id
  JOIN courses c     ON e.course_id = c.course_id
  GROUP BY c.course_id, c.title, TRUNC(p.payment_date,'MM')
)
SELECT course_id, title, month, revenue,
       SUM(revenue) OVER (PARTITION BY course_id ORDER BY month
                          ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_total
FROM monthly_rev
ORDER BY course_id, month;
