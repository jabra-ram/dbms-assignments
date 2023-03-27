-- PostgreSQL

-- For the given schema, write SQL queries to perform the following:

-- 1.Select all records in table “Employees” whose last name starts with ‘Sah’
select * from employees where last_name like 'Sah%';

-- 2.Select 10 employees who were hired between 1st June,2021 to 15th February, 2022. Start retrieving from the 4th record in the table.
select * from employees where hire_date between '01-06-2021' and '15-02-2022' limit 10 offset 3;

-- 3.Find distinct top 5 salary values (only salary column),using alias for column as “Top5salaries”
select distinct salary as "TOP 5 salaries" from employees order by salary desc limit 5;

-- 4.Find first_name, last_name and email of employees from the employees table where salary lies between 25000 to 45000
select first_name, last_name, email from employees where salary between 25000 and 45000;

-- 5.Write a query to find first_name, manager_id and salary where the department_id is 101 and sort the result in ascending order of salary.
select first_name, manager_id, salary from employees where department_id=101 order by salary;

-- 6.Find all the first_name that start with the letter “A”, and find all the last_name that have “TH” in the 2nd and 3rd positions.
select first_name from employees where first_name like 'A%';
select last_name from employees where last_name like '_TH%';