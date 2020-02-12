-- statements to drop tables as needed
drop table departments;
drop table dept_emp;
drop table dept_manager;
drop table employees;
drop table salaries;
drop table titles;

-- create tables
-- departments table
create table departments(
	dept_no VARCHAR(4) PRIMARY KEY,
	dept_name VARCHAR(20)
);
-- dept_emp table
create table dept_emp(
	emp_no INT,
	dept_no VARCHAR(4),
	from_date VARCHAR(10),
	to_date VARCHAR(10),
	PRIMARY KEY (emp_no, dept_no, from_date)
);
-- dept_manager table
create table dept_manager(
	dept_no VARCHAR(4),
	emp_no INT,
	from_date VARCHAR(10),
	to_date VARCHAR(10),
	PRIMARY KEY (dept_no, emp_no, from_date)
);
-- employees table
create table employees(
	emp_no INT,
	birth_date VARCHAR(10),
	first_name VARCHAR(30),
	last_name VARCHAR(30),
	gender VARCHAR(1),
	hire_date VARCHAR(10),
	PRIMARY KEY (emp_no, hire_date)
);
-- salaries table
create table salaries(
	emp_no INT,
	salary INT,
	from_date VARCHAR(10),
	to_date VARCHAR(10),
	PRIMARY KEY (emp_no, from_date)
);
-- titles table
create table titles(
	emp_no INT,
	title VARCHAR(30),
	from_date VARCHAR(10),
	to_date VARCHAR(10),
	PRIMARY KEY (emp_no)
);

-- import CSVs
-- import departments CSV
copy departments from '/Users/enriquesaenger/Bootcamp/sql-challenge/data/departments.csv'
delimiter ',' csv header;
-- import dept_emp CSV
copy dept_emp from '/Users/enriquesaenger/Bootcamp/sql-challenge/data/dept_emp.csv'
delimiter ',' csv header;
-- import dept_manager CSV
copy dept_manager from '/Users/enriquesaenger/Bootcamp/sql-challenge/data/dept_manager.csv'
delimiter ',' csv header;
-- import employees CSV
copy employees from '/Users/enriquesaenger/Bootcamp/sql-challenge/data/employees.csv'
delimiter ',' csv header;
-- import salaries CSV
copy salaries from '/Users/enriquesaenger/Bootcamp/sql-challenge/data/salaries.csv'
delimiter ',' csv header;
-- import titles CSV
copy titles from '/Users/enriquesaenger/Bootcamp/sql-challenge/data/titles.csv'
delimiter ',' csv header;

-- view entire tables
select * from departments;
select * from dept_emp;
select * from dept_manager;
select * from employees;
select * from salaries;
select * from titles;