-- Student revenue quartiles
WITH student_totals AS (
  SELECT s.student_id,
         s.first_name || ' ' || s.last_name AS student_name,
         NVL(SUM(p.amount),0) AS total_paid
  FROM students s
  LEFT JOIN enrollments e ON e.student_id = s.student_id
  LEFT JOIN payments p    ON p.enrollment_id = e.enrollment_id
  GROUP BY s.student_id, s.first_name, s.last_name
)
SELECT student_id, student_name, total_paid,
       NTILE(4) OVER (ORDER BY total_paid DESC) AS quartile,
       CUME_DIST() OVER (ORDER BY total_paid DESC) AS cum_dist
FROM student_totals
ORDER BY total_paid DESC;
