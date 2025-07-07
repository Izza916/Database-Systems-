--==================================== LAB WORK
--======================lab work=======================
select * from employees where first_name= 'steven' and last_name='king';
select * from employees where department_id=90;
select * from employees where first_name='john';
select * from employees where department_id=90;
--q2 comparison (q1)
select * from employees where department_id = (select department_id from employees where first_name='steven' and last_name='king');
select * from employees where first_name='steven' and last_name='king';

-- ================================CLASS TASKS 1,2,3,4,5 AND 15
--1.=============================== Display the average salary for each job, but only for jobs where the average salary is greater than $10,000. Display the job ID and the average salary.
select job_id, avg(salary) as avg_salary from employees group by job_id having avg(salary) > 10000;
--2. =================================For each department that has more than 2 employees, retrieve the department number and the number of its employees who are making more than $10,000.
SELECT department_id, count(employee_id) as employee_count from employees where salary > 10000 group by department_id having count(employee_id)>2;
--3.================================== Display the name of the department that has the most recent job start date. Use ROWNUM to ensure only the most recent record is considered.
SELECT department_name FROM ( SELECT department_name, start_date FROM departments ORDER BY start_date DESC ) WHERE ROWNUM = 1;
--4.================================== Create indexes on employee_id in both employees and job_history tables. List employees who do not have any records in the job_history table.
CREATE INDEX idx_employee_id_employees ON employees(employee_id);
CREATE INDEX idx_employee_id_job_history ON job_history(employee_id);
SELECT employee_id, first_name, last_name FROM employees WHERE employee_id NOT IN (SELECT employee_id FROM job_history);
--5. ====================================Display the department number and the salary of the highest-paid employee in that department. Excluding departments where the maximum salary is below $2,000. Sort the results in descending order of the salary.
select department_id, MAX(salary) as max_salary from employees group by department_id having max(salary) >=2000 order by max_salary desc;
--15.=========================================== Create a replica of employees table and increase the salary of employees by 12% who have a salary between $5,000 and $10,000.
CREATE TABLE employees_copy AS SELECT * FROM employees;
UPDATE employees_copy SET salary = salary * 1.12 WHERE salary BETWEEN 5000 AND 10000;
--displaying values
SELECT employee_id, first_name, last_name, salary FROM employees_copy WHERE salary BETWEEN 5600 AND 11200; 
















