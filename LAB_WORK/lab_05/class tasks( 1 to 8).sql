-- select * from employees,departments;
-- select * from employees,departments where first_name='Susan';
--useful for finding all possible combinations of data(cartesian)


--select table1_column,table2_column from table1 T1,table2 T2 where T1.table1_column=T2.table2_column
--these t1 and t2 are called aliasing


--inner join
--new syntax
--select e.first_name,e.job_id,d.department_name from eployees e,departments d where e.department_id=d.department_id;

--old syntax
--select e.first_name,e.job_id,d.department_name from eployees e join departments d on e.department_id=d.department_id;

--naturla join
--select first_name,job_id,department_name from eployees joins departments  where e.department_id=d.department_id;

--using join
--select table1_column,table2_column from table1 join table2 using(table2_column,table2_column);
--select employee_id,first_name,manager_id,department_name from employuees join department using (department_id,manager_id);

--if steve or usky manager ka pta krna ho
--select T1.table1_column,T2.table2_column from table T1, table T2 where T1.column=T2.column;
--select emp.first_name,mgr.first_name from employees emp,employees mgr
--where emp.manager_id=mgr.employee_id


--outer join 1 syntax
--select e.first_name,e.job_id,d.department_id,d.department_name from eployees e,departments d where e.department_id=d.department_id;
--2nd syntax
 --select e.first_name,e.job_id,d.department_id,d.department_name from eployees e left join departments d on e.department_id=d.department_id;


--union combines all and eliminates duplictaes
--2 queries k darmiyan common resluts ko fetch krke dega
--minus second queries ko minus krke result deta from first quries

--select employee_id,job_id from employees
--unionintersect/minus
--select employee_id,job_id from job_history;


--multiple joins  eg
--select e.first_name,e.last_name,j.job_title,d.department_name,m.first_name_name
--from employees e join jobs j on e.job_id=j.job_id, join departments d on e.department_id=d.department_id,
--left join employees m on e.manager_id=m.employee_id;




select * from employees;
select * from jobs;



--task1
select e.first_name,j.job_title,d.department_name,e.salary from employees e join jobs j on e.job_id=j.job_id,join departments d on e.department_id=d.department_id
order by d.department_name asc;

--task2
select e.first_name,e.last_name,j.job_title from employees e join jobs j on e.job_id=j.job_id where e.hire_date<'01-JAN-10';

--task3
select e.first_name,e.last_name,d.department_name from employees e join departments d on e.department_id=d.department_id 
where d.department_name <> 'IT';

--task4
select j.job_title,e.first_name from employees e join jobs j on e.job_id=j.job_id where e.employee_id in (select manager_id from employees); 


--task5
select d.department_name,e.first_name,e.last_name,e.salary from employees e department d join where e.salary>(select avg(salary) from employees e where e.department_id=d.department_id));

--task6
select j.job_title from jobs j left join employees e on j.job_id=e.job_id where e.employee_id is null; 
--task7

select d.department_name from departments d left join employees e on d.manager_id=e.employee_id where d.manager_id is null;

--task8
select d.department_name, count(e.employee_id) from employees e join departments d on e.department_id=d.department_id group by department_name having count(e.employee_id)>5;