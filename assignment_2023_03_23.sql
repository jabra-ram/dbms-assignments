-- PostgresSQL

-- 1) Find all the departments where the minimum salary is less than 2000.
select department_name from departments
where department_id in (select distinct department_id from employees where salary<2000);

-- 2) Find all the countries where no employees exist.
select country_name from countries 
where country_id not in (
    select distinct country_id from locations where location_id in(
        select distinct location_id from departments where department_id in(
            select distinct department_id from employees
        )
    )
);

-- 3) From the following tables write a query to find all the jobs, having at least 2 employees in a single department.(don’t use joins)
select job_title from jobs 
where job_id in(
   select distinct e1.job_id from employees e1 where e1.department_id in(
    select e2.department_id from employees e2 where (select count(e3.employee_id) from employees e3 where e3.department_id = e2.department_id)>=2
   )
);

-- 4)From the following tables write a query to find all the countries, having cities with all the city names starting with 'a'.(don’t use joins)
select c.country_name from countries c
where (select count(l1.city) from locations l1 where l1.country_id=c.country_id) =
(select count(l2.city) from locations l2 where l2.country_id=c.country_id and l2.city like 'a%');

-- 5)From the following tables write a query to find all the departments, having no cities.
select department_name from departments 
where location_id is null or location_id in(
    select location_id from locations where city is null
);