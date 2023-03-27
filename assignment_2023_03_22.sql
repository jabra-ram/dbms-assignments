-- PostgreSQL

-- Assignment on JOINS, UNION & Intersection
-- For the given schema, write SQL queries to perform the following:

-- 1. From the following tables write a SQL query to find the details of an employee. 
-- Return full name, email, salary, Department Name, postal code, and City.
select e.first_name || ' ' || e.last_name as "full name", e.email, e.salary, d.department_name, l.pincode as "postal_code", l.city 
from employees e inner join departments d on e.department_id = d.department_id
inner join locations l on d.location_id = l.location_id;

-- 2. From the following tables write a SQL query to find the departments whose location 
-- is in "Jammu Kashmir" or "Jharkhand". Return Department Name, state_province, street_address.
select d.department_name, l.state_province, l.street_address
from departments d inner join locations l on d.location_id = l.location_id
where l.state_province in ('Jammu Kashmir', 'Jharkhand');

-- 3. From the following tables write a SQL query to find the count of employees present 
-- in different jobs whose average salary is greater than 10,000. Return all the jobs with
-- employee count, Job Name, and average salary.
select count(e.employee_id) as "employee count", j.job_title, avg(e.salary) as "average salary"
from employees e inner join jobs j on e.job_id=j.job_id
group by j.job_title 
having avg(e.salary)>10000;

-- 4. From the following table write a SQL query to find all the first_names and last_names in both dependents 
-- and employees tables. Return the duplicate records as well and order the records in descending order of the last_name column.
select first_name, last_name
from employees
union all
select first_name, last_name
from dependents
order by last_name desc;

-- 5. From the following table write a SQL query to list every employee that has a manager with the name of his or her manager.
select e.first_name || ' ' || e.last_name as "employee name", m.first_name || ' ' || m.last_name as "manager name"
from employees e inner join employees m on e.manager_id = m.employee_id;

-- 6. Find the departments that have more than 5 employees earning a salary greater than 50,000 and are located in either 
-- New York or California. Include the department name, location, and the number of employees meeting the criteria.
select d.department_name, l.city as "location", count(e.employee_id) as "employee count"
from departments d inner join employees e on d.department_id=e.department_id inner join locations l on d.location_id=l.location_id
where e.salary>50000
group by d.department_name, l.city
having count(e.employee_id)>5;

-- 7. List any employees who have dependents and have a job title that includes the word 'manager', and sort the 
-- results by department name in ascending order.
select e.first_name, e.last_name
from employees e inner join dependents d on e.employee_id=d.employee_id inner join departments dpt on dpt.department_id=e.department_id inner join jobs j on j.job_id = e.job_id
where j.job_title like '%manager%'
order by dpt.department_name;

-- 8. Add a column in the dependent table called “city” depicting their current location of stay.
-- Find all employees who have been hired in the past 3 years and have dependents living in a city that is different from the city they work in (if I work in Kolkata, 
-- then my dependent should not be in Kolkata). Additionally, only include employees whose salary is greater than the average salary of
-- their job title(suppose, my job_title is ”developer” and the salary is 80k, and the average salary under the same job_title “developer” is 70k), and whose manager's job title
-- includes the word 'director'. Finally, include the department name and location of each employee, and sort the results by department name in ascending order.

-- inserting city values into dependents table
alter table dependents add column "city" varchar(255);
update dependents set city='mumbai' where dependent_id=6; 
update dependents set city='kolkata' where dependent_id=7; 
update dependents set city='delhi' where dependent_id=8; 
update dependents set city='bangalore' where dependent_id=9; 
update dependents set city='pune' where dependent_id=10; 


select e.first_name || ' ' || e.last_name as "employee name", dpt.department_name, l.city from employees e 
inner join dependents d on d.employee_id = e.employee_id 
inner join jobs j on e.job_id = j.job_id 
inner join (select m.employee_id,j.job_title as "manager_job_title" from employees m inner join jobs j on m.job_id = j.job_id) manager on manager.employee_id = e.employee_id
inner join departments dpt ON dpt.department_id = e.department_id 
inner join locations l ON l.location_id = dpt.location_id 
inner join (select j.job_title,avg(e.salary) as "avg_salary" from jobs j inner join employees e
on j.job_id = e.job_id group by j.job_title) job_avg on j.job_title = job_avg.job_title
where d.city <> l.city AND e.hire_date >= current_date - interval '3 years' and e.salary > job_avg.avg_salary and manager.manager_job_title like '%director%' order by dpt.department_name;