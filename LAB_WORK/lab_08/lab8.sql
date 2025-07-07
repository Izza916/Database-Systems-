--create funcion wall (a integer, b integer)
--return integer
--is
--sum integer;
--begin 
--sum := a+b;
--return(sum);
--end;
--select  wall(8,9) from dual;


CREATE FUNCTION wall(a NUMBER, b NUMBER) RETURN NUMBER IS
    sum NUMBER;
BEGIN
    sum := a + b;
    RETURN sum;
END;
SELECT wall(8, 9) FROM dual;

--===============================================

-- question 4 (lab task)
SET SERVEROUTPUT ON;
DECLARE
   job_type employees.job_id%TYPE;
BEGIN
   SELECT job_id INTO job_type
   FROM employees
   WHERE department_id = 20;
   
   DBMS_OUTPUT.PUT_LINE('Job Nature in Dept 20: ' || job_type);
END;
--==================================================== q5
SET SERVEROUTPUT ON;
DECLARE
   emp_sal employees.salary%TYPE;
BEGIN
   SELECT salary INTO emp_sal
   FROM employees
   WHERE department_id = 20;
   
   DBMS_OUTPUT.PUT_LINE('Salary in Dept 20: ' || emp_sal);
END;
--==================================================================q8
CREATE VIEW emp_designation_count AS
SELECT job_id, COUNT(employee_id) AS employee_count
FROM employees
GROUP BY job_id;


