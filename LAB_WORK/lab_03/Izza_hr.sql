--===========================================CLASS PRACTICE TASKS============================================================================
create table BAI5c (name varchar(20) unique, age int not null);
select * from BAI5c;
create table employee_task (fname varchar(20) unique, minit char(20) unique, lname varchar(20), ssn int not null, bdate varchar(20), address varchar(20) unique, sex char(20) unique, salary int unique, super_ssn int not null unique, DNo int not null);
ALTER table BAI5c modify (lname char(20), color char(20));
ALTER table employee_task ADD (studentId varchar(20) unique, phonenum int not null);
ALTER table employee_task modify(lname int);
ALTER table employee_task drop column lname;
create table fsample (idd int, age int, empl_id2 int,  foreign key(empl_id2) references employees (employee_id));
insert into BAI5c (id, name, age, lname, color, height) values (1,'MEHAK', 2, 'MAZHAR', 'RED', 5 );

--==================================================LAB TASKS======================================================================================
--1.================================= skipped============ Create a new user using SQL command Line and grant privileges (Hint: See Installation Guide). We are  using this user to create our own database with related tables.
--2.==================================Create a table named as student_record having fields (Name, Roll no, Section, Course and Semester.
create table student_record (Name varchar(50), roll_no int primary key, section varchar(10), course varchar(50), semester varchar(10)); 
--3. ==============================================Add your record for the current semester in student_record table.
INSERT INTO student_record (Name, roll_no, section, course, semester) VALUES ('izza', 12, 'A', 'DB', '5');
--4. ==============================================Now add a new field ( Year ) with the default value ‘2000’ in the student_record table.
ALTER TABLE student_record ADD year INT DEFAULT 2000;
--5. ==============================================Create table Jobs and job_History with the same fields as given in HR Schema in which job_ID is considered as primary key in jobs table.
create table izzajobs(job_id int primary key, job_title varchar(50), min_salary int, max_salary int);
create table izzasjobs_history (emloyee_id int, start_date date, end_date date, job_id int);
--6. ==============================================Change the data type of ‘start_date’ from date to character in Jobs table.
ALTER table izzasjobs_history modify start_date char(10);
--7.================================================ Write a SQL statement to add job_id column in job_history table as foreign key referencing to the primary key job_id of jobs table.
ALTER table izzasjobs_history add constraint fk_job_id foreign key(job_id) references izzajobs(job_id);
--8. ===============================================Insert any 3 records in jobs table and job_History table and observe the output.
INSERT INTO izzajobs(job_id, job_title, min_salary, max_salary) values (1,'manager',50000,100000),(2,'engineer',40000,80000),(3,'analyst',30000,60000);
INSERT INTO izzasjobs_history (employee_id, start_date, end_date, job_id) values (101, '2023-01-01','2024-01-01',1), (102,'2023-02-01','2024-02-01',2), (103,'2023-03-01','2024-03-01',3);
--9.================================================ Add Column Email in Jobs table.
ALTER TABLE izzajobs add email VARCHAR(50);
--10. ===============================================Create replica of employee table.
create table employee_replica AS select * from employees;