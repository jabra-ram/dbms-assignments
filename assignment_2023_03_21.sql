-- PostgreSQL

-- RDBMS assignment on GROUP BY, Having, Aggregate Functions, case operator, Null Operator

-- 1. Write the query to get the department and department wise total(sum) salary, display it in ascending order according to salary.
select d.department_name, sum(e.salary) as "salary_sum"
from employees e, departments d
where e.department_id = d.department_id
group by d.department_name 
order by sum(e.salary);

-- 2. Write the query to get the department, total no. employee of each department, total(sum) salary with respect to department from "Employee" table.
select d.department_name, count(*) as "Total employees", sum(e.salary) as "salary_sum"
from employees e, departments d
where e.department_id = d.department_id
group by d.department_name;

-- 3. Get department wise maximum salary from "Employee" table order by salary ascending
select d.department_name, max(e.salary) as "max_salary" 
from employees e, departments d
where e.department_id = d.department_id
group by d.department_name
order by max(e.salary);

-- 4. Write a query to get the departments where average salary is more than 60k
select d.department_name as "departments_with_avg_salary_greater_than_60k"
from employees e, departments d
where e.department_id = d.department_id
group by d.department_name
having avg(e.salary)>60000;

-- 5. Write down the query to fetch department name assign to more than one Employee
select d.department_name
from employees e, departments d
where e.department_id = d.department_id
group by d.department_name
having count(e.employee_id)>1;

-- 6. Write a query to show department_name and assignedTo where assignedTo will be “One candidate” if its assigned to only one employee otherwise “Multiple candidates”
select d.department_name, 
case
when count(e.employee_id)=1 then 'One candidate'
else 'Multiple candidates'
end as "assignedTo"
from employees e, departments d
where e.department_id = d.department_id
group by d.department_name;
