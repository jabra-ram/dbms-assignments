-- PostgreSQL

-- Question 1: Create Schema 

create table jobs(
    job_id int primary key,
    job_title varchar(255) not null,
    min_salary int,
    max_salary int,
    check (min_salary>1000 && max_salary>=min_salary)
);
create table regions(
    region_id int primary key,
    region_name varchar(255) not null
);
create table countries(
    country_id serial primary key,
    country_name varchar(255) not null unique,
    region_id int,
    foreign key (region_id) references regions(region_id)
);
create table locations(
    location_id serial primary key,
    street_address varchar(255) not null,
    postal_code int not null,
    city varchar(255) not null,
    state_province varchar(255) not null,
    country_id int,
    check(postal_code<1000000000),
    foreign key(country_id) references countries(country_id)
);
create table departments(
    department_id serial primary key,
    department_name varchar(255) not null,
    location_id int,
    foreign key(location_id) references locations(location_id)
);
create table employees(
    employee_id serial primary key,
    first_name varchar(255) not null,
    last_name varchar(255) not null,
    email varchar(255),
    phone_number numeric,
    hire_date date not null,
    job_id int,
    salary int,
    manager_id int,
    department_id int,
    foreign key(job_id) references jobs(job_id),
    foreign key(manager_id) references employees(employee_id),
    foreign key(department_id) references departments(department_id)
);
create table dependents(
    dependent_id serial primary key,
    first_name varchar(255) not null,
    last_name varchar(255) not null,z
    relationship varchar(255) not null,
    employee_id int,
    foreign key(employee_id) references employees(employee_id)
);

-- Question 2 : Insert 10 rows in Employee table and 5 rows in all other tables. 

insert into jobs(job_id, job_title, min_salary, max_salary) values
(1, 'Software Engineer', 600000, 1000000),
(2, 'Senior Software Engineer', 1000000, 1500000),
(3, 'Database Admin', 500000, 800000),
(4, 'Manager', 1200000, 2000000),
(5, 'HR Executive', 600000, 1200000);

insert into regions(region_id, region_name) values
(1, 'Western Europe'), 
(2, 'Central and Eastern Europe'), 
(3, 'Asia'), 
(4, 'Africa'),
(5, 'Mediterranean & Middle East'),
(6, 'Americas');

insert into countries(country_name, region_id) values
('India', 3),
('China', 3),
('France', 1),
('Germany', 1),
('Kenya', 4);

insert into locations(street_address, postal_code, city, state_province, country_id) values
('Raheja Mind Space', 500081, 'Hyderabad', 'Telangana', 1),
('Ambience Island, Sector 24', 122002, 'Gurugram', 'Delhi', 1),
('Outer Ring Rd, Mahadevapura', 560048, 'Bengaluru', 'Karnataka', 1),
('31 Pl. des Corolles', 92400, 'Courbevoie', 'Courbevoie', 3),
('Domagkstraße 28,', 80807, 'München', 'München', 4);

insert into departments(department_name, location_id) values
('Software Development',3),
('Customer Service', 2),
('AWS', 3),
('Logistics', 2),
('Sales', 1);

insert into employees(first_name, last_name, email, phone_number, hire_date, job_id, salary, department_id) values ('Aman Kumar', 'Singh', 'aman.kumar@kreeti.com', 123456789, '01-01-2016', 2, 1500000, 1);

insert into employees(first_name, last_name, email, phone_number, hire_date, job_id, salary,manager_id, department_id) values
('Jabra','Ram', 'jrc123@kreeti.com','8302672922','15-02-2023',1,720000,1, 1),
('Gaurav','Pareek', 'gaurav@kreeti.com','8320985343','15-02-2023',1,720000,1, 1),
('Lokesh Kumar','Chaman', 'lokesh@kreeti.com','7837492923','15-02-2023',1,720000,1, 4),
('Mahfuz','Alam', 'mahfuz@kreeti.com','9743189334','15-02-2023',3,720000,1, 3),
('Sayantan','Sinharay', 'sayantan@kreeti.com','8234544922','15-02-2023',5,600000,1, 2),
('Rahul','Verma', 'rahul@kreeti.com','9327492402','01-01-2022',1,900000,1, 2),
('Manish','Sharma', 'manish@kreeti.com','7837434923','15-02-2023',1,720000,1, 4),
('Pooja','Gupta', 'pooja@kreeti.com','9734389334','10-06-2021',5,800000,1, 4);
('Divya','Sharma', 'divya@kreeti.com','8053189323','07-09-2020',3,850000,1, 3);

insert into dependents(first_name, last_name, relationship, employee_id) values
('Prakash', 'Pareek', 'father', 4),
('Rohit', 'Verma', 'father', 8),
('Jay', 'Sharma', 'brother', 9),
('Menka', 'Gupta', 'mother', 10),
('Kushal', 'Sharma', 'father', 11);

-- Question 3: 
-- a: In Departments table, add a new field 'manager_name' of type VARCHAR
alter table departments add column manager_name varchar(255);
-- b: REMOVE field max_salary from jobs
alter table jobs drop column max_salary;
-- c: In the locations table, rename postal_code column to pincode
alter table locations rename column postal_code to pincode;
