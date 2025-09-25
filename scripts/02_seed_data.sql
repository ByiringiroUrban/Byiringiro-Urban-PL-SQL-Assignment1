INSERT INTO students(first_name,last_name,email) VALUES ('Alice','Mukamana','alice@wise.rw');
INSERT INTO students(first_name,last_name,email) VALUES ('Bobola','Ngarambe','bobola@wise.rw');

INSERT INTO courses(course_code,title,price) VALUES ('PY-101','Python from Scratch',150.00);
INSERT INTO courses(course_code,title,price) VALUES ('JS-101','JavaScript Basics',120.00);


INSERT INTO enrollments(student_id,course_id) VALUES (1,1);
INSERT INTO enrollments(student_id,course_id) VALUES (2,1);
INSERT INTO enrollments(student_id,course_id) VALUES (2,2);

-- payments
INSERT INTO payments(enrollment_id,payment_date,amount) VALUES (1, TO_DATE('2025-08-01','YYYY-MM-DD'), 150.00);
INSERT INTO payments(enrollment_id,payment_date,amount) VALUES (2, TO_DATE('2025-08-05','YYYY-MM-DD'), 150.00);
INSERT INTO payments(enrollment_id,payment_date,amount) VALUES (3, TO_DATE('2025-09-01','YYYY-MM-DD'), 120.00);
COMMIT;
