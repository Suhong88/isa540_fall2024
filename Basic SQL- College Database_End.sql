/* SQL Exercise based on College Database
Please check the ERD diagram to make sure that you understand fields in each table and how they are related
You can query this database directly through the below link:
https://www.db-book.com/
For each question, please copy the SQL code and result at the end.
*/

-- Basic Query

-- 1. List all course titles along with the number of credits they offer.

Select title, credits
from course;Select title, credits
from course;

/*
title	credits
Intro. to Biology	4
Genetics	4
Computational Biology	3
Intro. to Computer Science	4
Game Design	4
Robotics	3
Image Processing	3
Database System Concepts	3
Intro. to Digital Systems	3
Investment Banking	3
World History	3
Music Video Production	3
Physical Principles	4
*/

*/

-- 2. Retrieve all details of students who are enrolled in the 'Computer Science' department.

SELECT * 
FROM student
WHERE dept_name = ‘Comp. Sci.’;


-- 3. Find the names of all instructors in the 'Physics' department.

SELECT name
FROM instructor
WHERE dept_name = 'Physics';

-- Aggregate Functions:

-- 4.Calculate the average salary of instructors in the Computer Science department.

SELECT AVG(salary)
FROM instructor
WHERE dept_name = 'Comp. Sci.’;

-- 5. Count the total number of students enrolled in each department.

SELECT dept_name, COUNT(*)
FROM student
GROUP BY dept_name;

-- 6. Find the total number of courses that have prerequisites.

SELECT COUNT(*)
FROM prereq;

-- 7.List the course with the highest number of credits.

SELECT title
FROM course
WHERE credits = (SELECT MAX(credits) FROM course);

-- 8. Retrieve the average number of credits for all students.

SELECT AVG(tot_cred)
FROM student;

-- Joins:
-- 9.	List the names of all students along with their advisor's name.

SELECT s.name AS student_name, i.name AS advisor_name
FROM student s
INNER JOIN advisor a ON s.id = a.s_id
INNER JOIN instructor i ON a.i_id = i.id;


-- 10. Retrieve the list of courses taught by each instructor along with the section and year.

SELECT i.name, c.title, sec.sec_id, sec.year
FROM teaches t
INNER JOIN instructor i ON t.id = i.id
INNER JOIN section sec ON t.course_id = sec.course_id AND t.sec_id = sec.sec_id
INNER JOIN course c ON sec.course_id = c.course_id;

-- 11. List all the sections and their respective classrooms for the year 2018.

SELECT sec.sec_id, sec.course_id, c.room_number
FROM section sec
INNER JOIN classroom c ON sec.building = c.building AND sec.room_number = c.room_number
WHERE sec.year = 2018;

-- 12. Retrieve the list of courses taken by students along with their grades and course titles.

SELECT s.name, c.title, t.grade
FROM takes t
INNER JOIN student s ON t.id = s.id
INNER JOIN course c ON t.course_id = c.course_id;

-- 13.Find all instructors who have taught more than one course.

SELECT i.name, COUNT(t.course_id) AS courses_taught
FROM instructor i
INNER JOIN teaches t ON i.id = t.id
GROUP BY i.name
HAVING COUNT(t.course_id) > 1;

-- Subqueries:
-- 14. List the names of students who are enrolled in the same course as Brown

SELECT s.name
FROM takes t
INNER JOIN student s ON t.id = s.id
WHERE t.course_id IN 
			(SELECT course_id FROM takes t INNER JOIN student s ON t.id = s.id WHERE s.name = ‘Brown’);

-- 15.	Query: Find the course that has the maximum number of students enrolled.

SELECT course_id, COUNT(*) AS total_students
FROM takes
GROUP BY course_id
ORDER BY total_students DESC
LIMIT 1;

-- 16.	Retrieve all courses that do not have any prerequisites.

SELECT title 
FROM course 
WHERE course_id NOT IN (SELECT course_id FROM prereq);


-- 17.	List all students who have taken 'BIO-301' but have not yet completed the course.

SELECT s.name FROM student s
INNER JOIN takes t ON s.id = t.id
WHERE t.course_id = 'BIO-301' AND t.grade IS NULL;
Group By and Having:

-- 18 Find number of A each student received across all courses.
SELECT s.name, count(t.grade) AS A_grade
FROM student s
INNER JOIN takes t ON s.id = t.id
where t.grade='A'
GROUP BY s.name


-- 19 Find the prerequisite course names for the robotics course

SELECT c.title AS course_name, p_c.title AS prereq_course_name
FROM prereq p
INNER JOIN course c ON p.course_id = c.course_id
INNER JOIN course p_c ON p.prereq_id = p_c.course_id
Where c.title='Robotics'
 
-- 20 List the students who have taken all the prerequisites for the Robotics course

SELECT DISTINCT s.name
FROM student s
INNER JOIN takes t ON s.id = t.id
INNER JOIN section s on s.course_id=t.course_id
INNER JOIN course c ON c.course_id = s.course_id
where c.course_id in ( SELECT p_c.course_id AS prereq_course_id
FROM prereq p
INNER JOIN course c ON p.course_id = c.course_id
INNER JOIN course p_c ON p.prereq_id = p_c.course_id
Where c.title='Robotics')

