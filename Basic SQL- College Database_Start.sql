/* SQL Exercise based on College Database
Please check the ERD diagram to make sure that you understand fields in each table and how they are related
You can query this database directly through the below link:
https://www.db-book.com/
For each question, please copy the SQL code and result at the end.
In Class: questions with odd number, take home: questions with even numbers.
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

-- 2. Retrieve all details of students who are enrolled in the Computer Science department.


-- 3. Find the names of all instructors in the Physics department.



-- Aggregate Functions:

-- 4.Calculate the average salary of instructors in the Computer Science department.



-- 5. Count the total number of students enrolled in each department.



-- 6. Find the total number of courses that have prerequisites.



-- 7.List the course with the highest number of credits.



-- 8. Retrieve the average number of credits for all students.

-- Joins:
-- 9.	List the names of all students along with their advisor's name.




-- 10. Retrieve the list of courses taught by each instructor along with the section and year.



-- 11. List all the sections and their respective classrooms for the year 2018.



-- 12. Retrieve the list of courses taken by students along with their grades and course titles.



-- 13.Find all instructors who have taught more than one course.


-- Subqueries:
-- 14. List the names of students who are enrolled in the same course as Brown


-- 15.	Query: Find the course that has the maximum number of students enrolled.



-- 16.	Retrieve all courses that do not have any prerequisites.




-- 17.	List all students who have taken 'BIO-301' but have not yet completed the course.


-- 18 Find number of A each student received across all courses.



-- 19 Find the prerequisite course names for the robotics course


-- 20 List the students who have taken all the prerequisites for the robotics course

