--1. Write a SQL statement to display all the information of table Location.
SELECT * FROM LOCATIONS;

--2. Write a query to find City whose CountryID is “US”.
SELECT city from locations where COUNTRY_ID = 'US';

--3. Write a SQL statement to display all the information of table Jobs where Max salary is greater than 30,000.
SELECT * from jobs where MAX_SALARY = 30000;

--4. Write a SQL query to find the Jobs whose Max salary is lesser than or equal to $40000 and Min Salary is Greater than 15000 from Jobs table.
SELECT * from jobs where MAX_SALARY < = 40000 and MIN_SALARY > 1500;

--5. Write a SQL query to find min and max salary of the Job table with Job title ‘Accountant’ from Jobs table.
select min(min_salary) AS min_salary, MAX(max_salary) as max_salary FROM jobs where job_title = 'Accountant';

--6. Write a SQL query to find the Jobs whose salary are higher than or equal to $15000 from Employees table.
select * from jobs where min_salary >= 15000;

--7. Write a SQL query to find the details of employees whose last name is Austin. Return employee ID, employee first name, employee last name and employee dept ID.
select employee_id, first_name, last_name, department_id from employees where last_name='Austin';

--8. Write a SQL query to find the details of the employees who work in the department 57. Return employee ID, employee first name, employee last name and employee dept ID.
select employee_id, first_name, last_name, department_id from employees where department_id=90;

--9. Write a query to find the PHONE_NUMBER of the DEPARTMENT_ID=100 and MANAGER_ID=108 of Employees table.
select phone_number from EMPLOYEES where DEPARTMENT_ID=100 and MANAGER_ID= 108;

--10. write a SQL query to find the Employees with the First name “John” “Valli” and “Bruce”
select * from EMPLOYEES where FIRST_NAME = 'John' or FIRST_NAME = 'Valli' or first_name = 'Bruce';

--11. Write a query to find the list of cities with country ID ‘IT’ from locations table.
select city from locations where country_id = 'IT';

--12. Write a query to find the list of city except country ID ‘IN’ and ‘CH’ from locations table.
select city from locations where COUNTRY_ID not = 'IN' AND COUNTRY_ID NOT = 'CH' ;

--13. Write a query to find the list of jobs whose min salary is greater than 8000 and less than 15,000 from job table.
select * from JOBS where min_salary > 8000 and min_salary < 15000;

--14. Write a query to find list of phone with DEPARTMENT_ID ‘90’ but not with job_id ‘IT_PROG’ from Employees table.
select PHONE_NUMBER from EMPLOYEES where dapartment_id = 90 and job_id  != 'IT_PROG';

--15. Write a query to find the list of employees who are hired after '12-Dec-07' from employee table.
select * from employees where hire_date > '12-dec-07';

--16. Write a query to find the list of employees who are hired after '12-Dec-07' in Department with DEPARTMENT_ID=100 from employee table.
select * from employees where hire_date> '12-dec-07' and department_id = 100 ;

--17. Write a query to find the list of employees who are hired after '12-Dec-07' but not in Department with DEPARTMENT_ID=100 from employee table.
select * from employees where hire_date > '12-dec-07' AND department_id != 100;

--18. Write a query to find the list of employees whose COMMISSION_PCT=0 and they do not belong to DEPARTMENT_ID 90 or 100 from Employees table
select * from employees where COMMISSION_PCT =0 and department_id != 90 or department_id !=100

--19. Write a query to find the employees who are hired in year 2010 from Employees table.
select * from employees where hire_date = '01-jan-10';

--20. Write a query to find the list of jobs whose min salary is greater than 8000 and less than 15,000 from job table.
select * from jobs where min_salary > 8000 and min_salary < 15000;

--21. Write a query to find employee whose ID are greater than 100 and less than 150 and their department_id is greater than 90 and less than 100 along with their F_name, Last_name & Job ID.
select employee_id, first_name, last_name, job_id from employees where employee_id > 100 and employee_id < 150 and department_id> 90 and department_id<100

--22. Write a query to find total salary along with salary & commission_pct Total salary formula = commission_pct, salary+(commission_pct*salary)
select department_id, salary, ( department_id + salary ) + (department_id*salary) as total_salary from employees;


