
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
--11.============================================================= Write a SQL statement to add employee_id column in job_history table as foreign key referencing to the primary key employee_id of employees table.
ALTER TABLE izzasjobs_history ADD employee_id INT;
ALTER TABLE izzasjobs_history ADD CONSTRAINT fk_employee_id FOREIGN KEY (employee_id) REFERENCES employees(employee_id);
--===============================================================12. Drop column Email.
ALTER TABLE izzajobs DROP COLUMN email;
--13. ALTER table EMPLOYEE created in question 10 and apply the constraint CHECK on First_Name attribute such that ENAME should always be inserted in capital letters.
ALTER TABLE employees ADD CONSTRAINT chk_first_name_uppercase CHECK (First_Name = UPPER(First_Name));
-- 14. =======================================================ALTER table EMPLOYEE created in question 10 and apply the constraint on Salary attribute such that no two salaries of the employees should be similar. (Hint Unique)
ALTER TABLE employees ADD CONSTRAINT unique_salary UNIQUE (Salary);
--15. =============================ALTER table Employee created in question 10 and apply constraint on Phone_No such that Phone_No should not be entered empty (Hint modify).
ALTER TABLE employees MODIFY Phone_No VARCHAR(20) NOT NULL;
--=====================================================16. Write a SQL statement to insert one row into the table employees.
INSERT INTO employees (employee_id, First_Name, Last_Name, Salary, Phone_No) VALUES (1, 'John', 'Doe', 50000, '123-456-7890');
--17.======================================== Write a SQL statement to add a primary key for a combination of columns employee_id and job_id in employees table, give the reason why this command is showing error.
ALTER TABLE employees ADD CONSTRAINT pk_employee_job PRIMARY KEY (employee_id, job_id);
--18.======================================== Write a SQL statement to add an index named indx_job_id on job_id column in the table job_history.
CREATE INDEX indx_job_id ON izzasjobs_history (job_id);
--19.========================================== Write a SQL statement to remove employee table’s data but not the schema.
TRUNCATE TABLE employees;
--20.============================================ Write a SQL statement to remove employee table.
DROP TABLE employees;






