-- Top 5 students by total payments (last 12 months)
WITH student_totals AS (
  SELECT s.student_id,
         s.first_name || ' ' || s.last_name AS student_name,
         NVL(SUM(p.amount),0) AS total_paid
  FROM students s
  LEFT JOIN enrollments e ON e.student_id = s.student_id
  LEFT JOIN payments p    ON p.enrollment_id = e.enrollment_id
  WHERE p.payment_date BETWEEN ADD_MONTHS(TRUNC(SYSDATE,'MM'), -12) AND SYSDATE
     OR p.payment_date IS NULL
  GROUP BY s.student_id, s.first_name, s.last_name
)
SELECT student_id, student_name, total_paid,
       RANK() OVER (ORDER BY total_paid DESC)     AS rnk,
       ROW_NUMBER() OVER (ORDER BY total_paid DESC) AS rn
FROM student_totals
ORDER BY total_paid DESC
FETCH FIRST 5 ROWS ONLY;
