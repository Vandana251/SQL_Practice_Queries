create database company_db;
use company_db;
drop table if exists employees;
create table employees (
    employeeid int primary key,
    firstname varchar(50),
    lastname varchar(50),
    department varchar(50),
    salary decimal(10,2)
);
insert into employees
(employeeid, firstname, lastname, department, salary)
values
(1, 'ravi', 'kumar', 'hr', 45000),
(2, 'anil', 'reddy', 'it', 60000),
(3, 'suresh', 'rao', 'it', 70000),
(4, 'priya', 'sharma', 'hr', 55000),
(5, 'kiran', 'kumar', 'sales', 40000);
-- 1.select clause
-- select all columns from employees
select * from employees;
-- select distinct — unique values
select distinct department from employees;
-- concatenate firstname and lastname as fullname
select concat(firstname, ' ', lastname) as fullname from employees;
-- use as keyword
select firstname as employee_name from employees;
-- calculate total salary of all employeess
select sum(salary) as total_salary from employees;
-- - 2. where clause
-- employees from hr department
select * from employees where department = 'hr';
-- comparison operators
select * from employees where salary = 60000;

select * from employees where salary <> 60000;

select * from employees where salary > 50000;

select * from employees where salary < 50000;

select * from employees where salary >= 60000;

select * from employees where salary <= 50000;
-- and, or, not
select * from employees where department = 'hr'and salary > 50000;
select * from employees where department = 'hr'or department = 'it';
select * from employees where not department = 'hr';
insert into orders values
(1, 'ravi', 2500.00),
(2, 'sai', 4500.00),
(3, 'kiran', 1500.00),
(4, 'anil', 6000.00),
(5, 'rahul', 3500.00);

select * from orders;
-- orders with total amount greater than 1000
select * from orders where totalamount > 1000;
-- 3. order by clause
-- asc — ascending order
select * from employees order by salary asc;
-- desc — descending order
select * from employees order by salary desc;
-- top 3 products based on salary in descending order
select * from employees order by salary desc limit 3;
-- sort using multiple columns
select * from employees order by department asc, salary desc;
-- 4. group by clause
-- total number of employees in each department
select department, count(*) as employee_count from employees group by department;
-- aggregate functions with group by
-- count()
select department, count(*) as employee_count, sum(salary) as total_salary, avg(salary) as average_salary, max(salary) as maximum_salary, min(salary) as minimum_salary from employees group by department;
-- average salary in each department
select department, avg(salary) as average_salary from employees group by department;
-- 5. having clause
-- departments with more than 5 employees
select department, count(*) as employee_count from employees group by department having count(*) > 5;
-- aggregate functions with having
select department, avg(salary) as average_salary from employees group by department having avg(salary) > 50000;
-- departments with average salary greater than 50000
select department, avg(salary) as average_salary from employees group by department having avg(salary) > 50000;
-- departments with total salary greater than 500000
select department, sum(salary) as total_salary from employees group by department having sum(salary) > 500000;
select department, avg(salary) as average_salary from employees where salary > 50000 group by department having avg(salary) > 50000;
