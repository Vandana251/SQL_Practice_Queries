create database if not exists sql_assignment;
use sql_assignment;
-- 1. ddl
-- create students table
drop table if exists enrollments;
drop table if exists courses;
drop table if exists students;

create table students (studentid int, firstname varchar(50), lastname varchar(50),age int);
-- add gender column
alter table students add gender varchar(10);
-- rename age to studentage
alter table students rename column age to studentage;
-- drop gender
alter table students drop column gender;

-- 2. dml
-- insert john doe
insert into students (studentid, firstname, lastname, studentage) values (1, 'john', 'doe', 25);
-- update john's age to 26
update students set studentage = 26 where studentid = 1;
select * from students;

-- delete studentid 1
delete from students where studentid = 1;
select * from students;
-- insert multiple students
insert into students (studentid, firstname, lastname, studentage)
values
(1, 'john', 'smith', 26),
(2, 'alice', 'brown', 22),
(3, 'sarah', 'stone', 29),
(4, 'david', 'smith', 19),
(5, 'anna', 'wilson', 24);
-- change lastname of all johns to smith
update students set lastname = 'smith' where firstname = 'john';
select * from students where firstname = 'john';
-- delete students younger than 18
delete from students where studentage < 18;
select * from students where firstname = 'john';

-- courses table

create table courses (
    courseid int,
    coursename varchar(100),
    instructor varchar(100)
);
-- insert mathematics course
insert into courses (courseid, coursename, instructor)
values (1, 'mathematics', 'professor x');
-- update instructor
update courses set instructor = 'professor y' where courseid = 1;
select * from courses where courseid = 1;
-- delete courseid 1
delete from courses where courseid = 1;
-- truncate students
truncate table students;
-- drop courses table
drop table courses;
select * from courses;

-- 3. retrieval
-- sample data for retrieval queries
insert into students (studentid, firstname, lastname, studentage)
values
(1, 'john', 'smith', 25),
(2, 'alice', 'smith', 22),
(3, 'david', 'brown', 30),
(4, 'sara', 'sharma', 19),
(5, 'adam', 'singh', 27);

-- 1. retrieve all columns
select * from students;
-- 2. firstname and lastname
select firstname, lastname from students;
-- 3. distinct last names
select distinct lastname from students;
-- 4. students aged 20 or above
select * from students where studentage >= 20;
-- 5. last name starts with s
select * from students where lastname like 's%';
-- 6. first name contains a
select * from students where firstname like '%a%';
-- 7. oldest student
select * from students order by studentage desc limit 1;
-- 8. count of students
select count(*) as studentcount from students;
-- 9. students grouped by age
select studentage, count(*) as studentcount from students group by studentage;
-- 10. average age
select avg(studentage) as averageage from students;
-- 11. age ascending
select * from students order by studentage asc;
-- 12. age descending
select * from students order by studentage desc;
-- 13. top 5 oldest
select * from students order by studentage desc limit 5;
-- 14. 10 youngest
select * from students order by studentage asc limit 10;
-- 15. age between 20 and 30
select * from students where studentage between 20 and 30;
-- 16. count of students
select count(*) as studentcount from students;
-- 17. total number of courses
create table courses (courseid int,coursename varchar(100),instructor varchar(100));
insert into courses (courseid, coursename, instructor)
values
(1, 'ml', 'professor y'),
(2, 'ai', 'professor a'),
(3, 'dsa', 'professor y');
select count(*) as totalcourses from courses;
-- 18. average age
select avg(studentage) as averageage from students;
-- 19. maximum age
select max(studentage) as maximumage from students;
-- 20. minimum age
select min(studentage) as minimumage from students;
-- 21. count grouped by age
select studentage, count(*) as studentcount from students group by studentage;
-- enrollment table for course-related queries
create table enrollments (enrollmentid int primary key,studentid int,courseid int);
insert into enrollments (enrollmentid, studentid, courseid)
values
(1, 1, 1),
(2, 2, 1),
(3, 3, 2),
(4, 4, 2),
(5, 5, 3),
(6, 6, 3),
(7, 7, 1),
(8, 8, 3);
-- 22. courses taught by each instructor
select instructor, count(*) as totalcourses from courses group by instructor;
-- 23. average age in each course
select c.coursename, avg(s.studentage) as averageage from courses c join enrollments e on c.courseid = e.courseid
join students s on e.studentid = s.studentid group by c.coursename;
-- 24. oldest student in each course
select c.coursename, max(s.studentage) as oldestage from courses c
join enrollments e on c.courseid = e.courseid
join students s on e.studentid = s.studentid group by c.coursename;
-- 25. youngest student in each course
select c.coursename, min(s.studentage) as youngestage from courses c
join enrollments e on c.courseid = e.courseid
join students s on e.studentid = s.studentid group by c.coursename;
-- 26. male and female students
-- gender was dropped earlier, so add it again for this question.
alter table students add gender varchar(10);
update students set gender = case when studentid in (1, 3, 5, 8, 10) then 'male' else 'female' end;
select gender, count(*) as studentcount from students group by gender;
-- 27. students younger than 25
select count(*) as studentcount from students where studentage < 25;
-- 28. students aged 20 to 30
select count(*) as studentcount from students where studentage between 20 and 30;
-- 29. average age of students whose last name starts with s
select avg(studentage) as averageage from students where lastname like 's%';
-- 30. count of students whose first name contains a
select count(*) as studentcount from students where firstname like '%a%';
