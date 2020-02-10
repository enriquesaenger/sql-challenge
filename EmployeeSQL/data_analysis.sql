-- List employee number, last name, first name, gender, and salary for each employee
select e.emp_no, e.last_name, e.first_name, e.gender, (
	select s.salary
	from salaries as s
	where e.emp_no = s.emp_no
)
from employees as e;

-- List employees hired in 1986
-- *good*
select *
from employees
where hire_date like '1986%';

-- *better*
-- drop view as needed
drop view employee_info
-- create view with hire date
create view employee_info as
select e.emp_no, e.last_name, e.first_name, e.gender, (
	select s.salary
	from salaries as s
	where e.emp_no = s.emp_no
), e.hire_date
from employees as e;
-- list the data
select *
from employee_info
where hire_date like '1986%';

-- List the manager of each department with the following information:
-- department number, department name, the manager's employee number, last name, first name
-- and start and end employment dates.

select m.dept_no as "Department Number", (
	select d.dept_name
	from departments as d
	where d.dept_no = m.dept_no
) as "Department Name", m.emp_no as "Employee Number", (
	select e.last_name
	from employees as e
	where e.emp_no = m.emp_no
) as "Last Name", (
	select e.first_name
	from employees as e
	where e.emp_no = m.emp_no
) as "First Name", m.from_date as "Employment Start Date", m.to_date as "Employment End Date"
from dept_manager as m;