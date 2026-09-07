create database if not exists constraint_practice;
use constraint_practice;
-- 1. create a table with primary key on a single column
drop table if exists students_q1;
create table students_q1 (
    student_id int primary key,
    student_name varchar(50)
);
-- 2. add primary key to an existing table
drop table if exists students_q2;
create table students_q2 (
    student_id int,
    student_name varchar(50)
);
alter table students_q2 add primary key (student_id);
-- 3. create a composite primary key on multiple columns
drop table if exists student_courses_q3;
create table student_courses_q3 (
    student_id int,
    course_id int,
    course_name varchar(50),
    primary key (student_id, course_id)
);
-- 4. add foreign key to an existing table
drop table if exists employees_q4;
drop table if exists departments_q4;
create table departments_q4 (
    dept_id int primary key,
    dept_name varchar(50)
);
create table employees_q4 (
    employee_id int primary key,
    employee_name varchar(50),
    dept_id int
);
alter table employees_q4 add constraint fk_dept_q4
foreign key (dept_id) references departments_q4(dept_id);
-- 5. drop primary key
drop table if exists students_q5;
create table students_q5 (
    student_id int primary key,
    student_name varchar(50)
);
alter table students_q5 drop primary key;
-- 6. create unique constraint
drop table if exists users_q6;
create table users_q6 (
    user_id int primary key,
    email varchar(100) unique
);
-- 7. drop unique constraint
drop table if exists users_q7;
create table users_q7 (
    user_id int primary key,
    email varchar(100) unique
);
alter table users_q7 drop index email;
-- 8. enforce not null
drop table if exists employees_q8;
create table employees_q8 (
    employee_id int primary key,
    employee_name varchar(100) not null
);
-- 9. modify an existing column to enforce not null
drop table if exists employees_q9;
create table employees_q9 (
    employee_id int primary key,
    employee_name varchar(50)
);
alter table employees_q9 modify employee_name varchar(50) not null;
-- 10. define default constraint
drop table if exists employees_q10;
create table employees_q10 (
    employee_id int primary key,
    employee_name varchar(100),
    city varchar(50) default 'vijayawada'
);
-- 11. alter an existing column to add default
drop table if exists employees_q11;
create table employees_q11 (
    employee_id int primary key,
    employee_name varchar(100),
    city varchar(50)
);
alter table employees_q11 alter city set default 'vijayawada';
-- 12. add check constraint to ensure values fall within a range
drop table if exists employees_q12;
create table employees_q12 (
    employee_id int primary key,
    salary decimal(10,2),
    constraint chk_salary_q12
    check (salary between 10000 and 100000)
);
-- 13. drop check constraint
alter table employees_q12 drop check chk_salary_q12;
-- 14. temporarily disable foreign key checks
set foreign_key_checks = 0;
-- 15. re-enable foreign key checks
set foreign_key_checks = 1;
-- 16. rename an existing constraint
drop table if exists employees_q16;
create table employees_q16 (
    employee_id int primary key,
    salary decimal(10,2),
    constraint chk_salary_old_q16 check (salary > 10000)
);
alter table employees_q16 drop check chk_salary_old_q16;
alter table employees_q16 add constraint chk_salary_new_q16 check (salary > 10000);
-- 17. ensure a column value matches a predefined list
drop table if exists employees_q17;
create table employees_q17 (
    employee_id int primary key,
    department varchar(20),
    constraint chk_department_q17
    check (department in ('hr', 'it', 'sales'))
);
-- 18. ensure a column's value is greater than a threshold
drop table if exists employees_q18;
create table employees_q18 (
    employee_id int primary key,
    salary decimal(10,2),
    constraint chk_salary_q18
    check (salary > 10000)
);
-- 19. ensure a column value is based on a calculation involving other columns
drop table if exists employees_q19;
create table employees_q19 (
    employee_id int primary key,
    salary decimal(10,2),
    bonus decimal(10,2),
    total_salary decimal(10,2)
        generated always as (salary + bonus) stored
);
insert into employees_q19 (employee_id, salary, bonus) values (1, 20000, 5000);
select * from employees_q19;
