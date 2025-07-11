------------Task 4---------------------
--SELECT 
--    e.FIRST_NAME ||' '|| e.LAST_NAME as NAME, 
--    j.job_title, 
--    e.SALARY*12 AS annualSALARY, 
--    d.department_name, 
--    l.city
--FROM 
--    employees e
--JOIN 
--    jobs j ON e.job_id = j.job_id
--JOIN 
--    departments d ON e.department_id = d.department_id
--JOIN 
--    locations l ON d.location_id = l.location_id
--WHERE 
--    e.SALARY*12 >= 60000
--    AND j.job_title != 'ANALYST';

---------Task 5--------------

--SELECT 
--    e.employee_id,
--    e.first_name || ' ' || e.last_name AS name,
--    e.job_id,
--    e.salary,
--    e.department_id
--FROM 
--    employees e
--JOIN 
--    departments d ON e.employee_id = d.manager_id;

----------Task 6--------------
--SELECT 
--    d.department_id, 
--    d.department_name
--FROM 
--    departments d
--LEFT JOIN 
--    employees e ON d.department_id = e.department_id
--WHERE 
--    e.employee_id IS NULL;
--
--
------------Task 7--------------
--SELECT 
--    e.first_name || ' ' || e.last_name AS employee_name,
--    e.salary,
--    d.department_name
--FROM 
--    employees e
--LEFT JOIN 
--    departments d ON e.department_id = d.department_id;
--
------------Task 8--------------
--SELECT 
--    e.first_name || ' ' || e.last_name AS employee_name,
--    j.job_title,
--    d.department_name,
--    l.city
--FROM 
--    employees e
--JOIN 
--    jobs j ON e.job_id = j.job_id
--JOIN 
--    departments d ON e.department_id = d.department_id
--JOIN 
--    locations l ON d.location_id = l.location_id
--WHERE 
--    l.state_province IS NULL;
--
------------Task 9--------------
--SELECT 
--    e.employee_id, 
--    e.first_name || ' ' || e.last_name AS employee_name
--FROM 
--    employees e
--LEFT JOIN 
--    departments d ON e.department_id = d.department_id
--WHERE 
--    d.department_id IS NULL;
--
------------Task 10--------------
--SELECT 
--    e.first_name || ' ' || e.last_name AS employee_name,
--    l.country_id,
--    l.state_province
--FROM 
--    employees e
--JOIN 
--    departments d ON e.department_id = d.department_id
--JOIN 
--    locations l ON d.location_id = l.location_id
--WHERE 
--    l.country_id = 'US'
--    AND l.state_province != 'Washington';
--
------------Task 11--------------
--SELECT 
--    e.first_name || ' ' || e.last_name AS employee_name,
--    j.job_title,
--    d.department_name,
--    l.city
--FROM 
--    employees e
--JOIN 
--    jobs j ON e.job_id = j.job_id
--JOIN 
--    departments d ON e.department_id = d.department_id
--JOIN 
--    locations l ON d.location_id = l.location_id
--WHERE 
--    e.salary > (SELECT AVG(salary) FROM employees WHERE department_id = e.department_id);
--
------------Task 12--------------
--SELECT DISTINCT
--    e.first_name || ' ' || e.last_name AS employee_name
--FROM 
--    employees e
--JOIN 
--    job_history jh ON e.employee_id = jh.employee_id;
--
------------Task 13--------------
--SELECT 
--    e.first_name || ' ' || e.last_name AS employee_name,
--    d.department_name
--FROM 
--    employees e
--JOIN 
--    departments d ON e.department_id = d.department_id
--WHERE 
--    e.department_id = d.manager_id;
--
------------Task 14--------------
--SELECT 
--    e.first_name || ' ' || e.last_name AS employee_name,
--    d.department_name,
--    l.country_id
--FROM 
--    employees e
--JOIN 
--    departments d ON e.department_id = d.department_id
--JOIN 
--    locations l ON d.location_id = l.location_id;
--
--
------------Task 15--------------
--SELECT 
--    d.department_name
--FROM 
--    employees e
--JOIN 
--    departments d ON e.department_id = d.department_id
--GROUP BY 
--    d.department_name
--HAVING 
--    COUNT(e.employee_id) > 5;
--
--
------------Task 16--------------
--SELECT 
--    e.first_name || ' ' || e.last_name AS employee_name,
--    m.first_name || ' ' || m.last_name AS manager_name
--FROM 
--    employees e
--LEFT JOIN 
--    employees m ON e.manager_id = m.employee_id;
--
------------Task 17--------------
--SELECT 
--    e.first_name || ' ' || e.last_name AS employee_name,
--    d.department_name
--FROM 
--    employees e
--JOIN 
--    departments d ON e.department_id = d.department_id
--JOIN 
--    locations l ON d.location_id = l.location_id
--WHERE 
--    e.country_id != l.country_id;
--
------------Task 18--------------
--SELECT 
--    e.first_name || ' ' || e.last_name AS employee_name,
--    e.salary
--FROM 
--    employees e
--JOIN 
--    departments d ON e.department_id = d.department_id
--WHERE 
--    e.salary > (SELECT AVG(salary) FROM employees WHERE department_id = e.department_id)
--    AND e.salary < (SELECT MAX(salary) FROM employees);
--
------------Task 19--------------
--SELECT 
--    e.first_name || ' ' || e.last_name AS employee_name,
--    jh.department_id,
--    d.department_name
--FROM 
--    employees e
--JOIN 
--    job_history jh ON e.employee_id = jh.employee_id
--JOIN 
--    departments d ON jh.department_id = d.department_id
--GROUP BY 
--    e.employee_id, e.first_name, e.last_name, jh.department_id, d.department_name
--HAVING 
--    COUNT(DISTINCT jh.department_id) > 1;
--
--
------------Task 20--------------
--SELECT e.FIRST_NAME || e.LAST_NAME as Name
-- FROM employees e
-- JOIN 
-- job_history jh ON e.employee_id = jh.employee_id
-- JOIN 
-- departments d ON jh.department_id = d.department_id
-- JOIN 
-- regions r ON d.LOCATION_ID = r.region_id
-- GROUP BY 
-- e.FIRST_NAME || e.LAST_NAME
-- HAVING COUNT(DISTINCT r.region_id) > 1;
--
------------Task 21--------------
--
--SELECT e.FIRST_NAME || e.LAST_NAME as Name, r.region_name
-- FROM employees e
-- JOIN departments d ON e.department_id = d.department_id
-- JOIN regions r ON d.DEPARTMENT_ID = r.region_id;
--
--
------------Task 22--------------
--SELECT 
--    e.first_name || ' ' || e.last_name AS employee_name,
--    d.department_name
--FROM 
--    employees e
--JOIN 
--    departments d ON e.department_id = d.department_id
--WHERE 
--    e.last_name IN (
--        SELECT last_name 
--        FROM employees 
--        GROUP BY last_name 
--        HAVING COUNT(DISTINCT department_id) > 1
--    );
--
------------Task 23--------------
--SELECT 
--    e.first_name || ' ' || e.last_name AS employee_name
--FROM 
--    employees e
--JOIN 
--    job_history jh ON e.employee_id = jh.employee_id
--GROUP BY 
--    e.employee_id, e.first_name, e.last_name
--HAVING 
--    COUNT(DISTINCT jh.job_id) > 2;
--
--
------------Task 24--------------
--SELECT 
--    j.job_title
--FROM 
--    jobs j
--LEFT JOIN 
--    employees e ON j.job_id = e.job_id
--WHERE 
--    e.employee_id IS NULL;
--
--
------------Task 25-----------
--SELECT 
--    e.first_name || ' ' || e.last_name AS employee_name,
--    e.salary,
--    d.department_name
--FROM 
--    employees e
--JOIN 
--    departments d ON e.department_id = d.department_id
--WHERE 
--    e.salary IN (
--        SELECT e2.salary
--        FROM employees e2
--        WHERE e2.department_id = e.department_id
--        GROUP BY e2.salary
--        HAVING COUNT(*) > 1
--    );
--
--
--
--
--
