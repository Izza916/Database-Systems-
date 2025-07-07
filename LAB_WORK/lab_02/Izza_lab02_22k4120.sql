--ALL CLASS TASKS DONE IN PRACTICE
select * from employees;
--
select distinct (department_id) from employees;
--
select distinct (salary) from employees;
--
select distinct (EMPLOYEE_ID) from employees;
--
select all(salary) from employees;
--
select * from employees where salary not between 10000 and 20000;
--
select EMPLOYEE_ID, FIRST_NAME from employees WHERE EMPLOYEE_ID between 100 and 110;
--
select DEPARTMENT_ID, FIRST_NAME from employees WHERE DEPARTMENT_ID NOT between 80 and 100;
--
SELECT * FROM JOBS WHERE JOB_TITLE in ('Accounting Manager', 'Purchasing Manager');
--
select * from employees where job_id in ('IT_PROG', 'AD_VP');
--
SELECT * FROM EMPLOYEES WHERE FIRST_NAME LIKE '%_a%';
--
SELECT * FROM EMPLOYEES WHERE FIRST_NAME LIKE '%_h%';
--
SELECT * FROM EMPLOYEES WHERE FIRST_NAME LIKE '%_x%';
--
SELECT * FROM EMPLOYEES WHERE FIRST_NAME LIKE '%d';
--
SELECT * FROM EMPLOYEES WHERE FIRST_NAME LIKE '_D';
--
SELECT * FROM EMPLOYEES WHERE FIRST_NAME LIKE 'A%';
--
SELECT * FROM EMPLOYEES WHERE FIRST_NAME LIKE '%_a%';
--
SELECT * FROM EMPLOYEES WHERE FIRST_NAME LIKE '__a%';
--
SELECT * FROM EMPLOYEES WHERE FIRST_NAME LIKE '__x%';
--
SELECT * FROM employees WHERE commission_pct is not null;
--
SELECT * FROM employees WHERE commission_pct is null;
--
SELECT * FROM employees WHERE dapartment_id is null;
--
SELECT * FROM employees WHERE  SALARY is null;
--
select greatest(22,88) from DUAL;
--
select least(22,88) from DUAL;
-- least row function but for column min funcion 
select min(Salary) from employees;
--
select ABS(-99) FROM DUAL;
--
select FLOOR(99.99) FROM DUAL;
--
select CIEL(9.999) FROM DUAL;

SELECT ROUND(1.56, 2) FROM DUAL;
--
SELECT TRUNC(1.57,2) FROM DUAL;
--
SELECT UPPER ('izza') FROM DUAL;
--
SELECT LOWER ('IZZA') FROM DUAL;
--
SELECT initcap ('IZza') FROM DUAL;
--
SELECT trim('i' from 'izzafarhat22k4120') from DUAL ;
--
select sysdate from dual;
--
select add_months(sysdate, 4) from DUAL;
--
select MONTHS_BETWEEN(SYSDATE,hire_date) from EMPLOYEES;
--
select NEXT_DAY(sysdate,'friday') from DUAL;
--
--1) Display the employee name, job title, and the difference between the maximum and minimum salaries within their department.
-- GROUP BY
-- 2) Display the employee name, salary, and the number of years they have been with the company, rounded to the nearest year.
-- GROUP BY
--3) List the employee name and the length of their last name, ordered by the length in descending order.
select first_name||' '|| last_name as employee_name, length(last_name) as last_name_length from employees order by last_name_length DESC;
--4) List the employee names with any leading zeros removed from their employee ID
select first_name||' '||last_name as employee_name, to_number(employee_id) AS employee_id from employees;
--5) Find the names of employees who have been with the company for exactly 5 years and display their employee ID, name, and hire date.
select employee_id, first_name || ' ' || last_name as employee_name, hire_date from employees where round(months_between(sysdate, hire_date)/12) = 5;
--6) List the employee name and the current date formatted as 'DD-MON-YYYY
select first_name || ' ' || last_name as employee_name, to_char(sysdate, 'DD-MON-YYYY') AS current_date from employees;
--7) Display the employee name, department ID, and their job title for all employees whose job title contains the letter 'E'.
SELECT first_name, last_name, department_id, job_id FROM employees where job_id like '%E%';
-- 8) List the employee name, salary, and the number of employees in their department.
-- NOT DOING GROUP BY
-- 9) Display the employee name and the number of days between their hire date and the first day of the following month.
select first_name || ' '  || last_name as employee_name, next_day(trunc(hire_date, 'MM') + 1, 'Monday') - hire_date as days_difference from employees;
-- 10) Write a query to display the employee name and job title for all employees who have 'Manager' in their job title.
SELECT FIRST_NAME || ' ' || LAST_NAME AS EMPLOYEE_NAME, JOB_ID FROM EMPLOYEES WHERE JOB_ID LIKE '%Manager%' ;
-- 11) Display the employee names with any leading and trailing spaces removed
select TRIM(first_name || ' ' || last_name) as employee_name from employees;
-- 12) List the employee name, department name, and the difference in days between their hire date and the current date.
select first_name || ' ' || last_name as employee_name, department_id, sysdate - hire_date as days_difference from employees;
-- 13) Write a query to find the employees who were hired on the last day of the month, and display their employee ID, name, and hire date.
select employee_id, first_name || ' ' || last_name as employee_name, hire_date from employees where hire_date = last_day(hire_date); 
-- 14) Write a query to find employee whose ID are greater than 100 and less than 150 and their department_id is greater than 90 and less than 100 along with their first_name, Last_name & Job ID.
select first_name, last_name, job_id from employees where employee_id > 100 and employee_id <150 and department_id > 90 and employee_id <100;
--15) Display cities in title case (first letter capitalized) where the second character is an “a”
select initcap(city) as city_name from locations where city like '_a%';