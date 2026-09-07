-- 1. create employees table
create table employees (
    employeeid int primary key,
    firstname varchar(50),
    lastname varchar(50),
    department varchar(20),
    salary decimal(10,2)
);

-- 2. add hiredate
alter table employees add hiredate date;

-- 3. rename department to dept
alter table employees rename column department to dept;

-- 4. create departments table
create table departments (
    deptid varchar(20),
    deptname varchar(100)
);

-- 5. add primary key
alter table departments add primary key (deptid);

-- 6. insert department
insert into departments (deptid, deptname)
values ('it', 'information technology');

-- 7. add foreign key
alter table employees
add constraint fk_employee_department
foreign key (dept) references departments(deptid);

-- 8. insert employee
insert into employees
(employeeid, firstname, lastname, dept, salary, hiredate)
values
(101, 'john', 'doe', 'it', 60000.00, '2024-05-14');

-- 9. check employee
select * from employees;

-- 10. update salary
update employees
set salary = 65000.00
where employeeid = 101;

-- 11. check updated employee
select * from employees;

-- 12. delete employee
delete from employees
where employeeid = 101;

-- 13. check after delete
select * from employees;

-- 14. create students table
create table students (
    studentid int,
    firstname varchar(50),
    lastname varchar(50),
    dateofbirth date
);

-- 15. not null on firstname
alter table students
modify firstname varchar(50) not null;

-- 16. unique on studentid
alter table students
add constraint uq_student_id unique (studentid);

-- 17. check dateofbirth
alter table students
add constraint chk_date_of_birth
check (dateofbirth <= '2026-08-20');

-- 18. default doe for lastname
alter table students
alter column lastname set default 'doe';

-- 19. describe tables
describe employees;
describe departments;
describe students;

-- 20. display tables
select * from employees;
select * from departments;
select * from students;
