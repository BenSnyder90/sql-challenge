--View tables to see if data imported correctly
select * from employees;
select * from departments;
select * from dept_emp;
select * from dept_manager;
select * from salaries;
select * from titles;

--List the following details of each employee: employee number, 
--last name, first name, gender, and salary.

--Use INNER JOIN to get a query of employee number, last name, first name,
-- and gender from 'employees' table, and salary from 'salaries' table,
--joining them by emp_no
SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM salaries AS s
INNER JOIN employees AS e ON
e.emp_no=s.emp_no;
--Returns 300024 lines


--List employees who were hired in 1986.

--Uses WHERE and AND functions to search employees table for employees
--in the date range of Jan 1, 1986 to Dec 31, 1986
select * from employees
WHERE hire_date < '1986-12-31' AND hire_date >= '1986-01-01';
--Returns 36062 lines


--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, 
--last name, first name, and start and end employment dates.

--INNER JOINs 3 tables: 'departments', 'dept_manager', and 'employees'
--to display information from each table
SELECT d.dept_no, d.dept_name, m.emp_no, e.first_name,
		e.last_name, m.from_date, m.to_date 
FROM dept_manager AS m
INNER JOIN departments as d
ON m.dept_no=d.dept_no
INNER JOIN employees as e
ON m.emp_no=e.emp_no;
--Returns 24 lines


--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.

--Creates this query as a VIEW to be used as a shortcut for the other
--questions that have use the same fields.
--INNER JOINs 3 tables: 'dept_emp', 'employees', and 'departments'
--to see the employee number, full names, and the departments the employee belongs to
CREATE VIEW emp_dep_list AS
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp AS de
INNER JOIN employees AS e
ON de.emp_no=e.emp_no
INNER JOIN departments as D
ON de.dept_no=d.dept_no;


SELECT * FROM emp_dep_list;
--Returns 331603 lines


--List all employees whose first name is "Hercules" and last names begin with "B."

--Utilizes WHERE and AND functions to narrow down employees to desired criteria.
--Uses % shortcut to search for any last names that begin with a 'B' and has any length of string after it
SELECT emp_no, first_name, last_name
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';
--Returns 20 lines


--List all employees in the Sales department, including their employee number,
--last name, first name, and department name.

--Uses created view from earlier
--and uses WHERE function to narrow query to one specific department.
SELECT * FROM emp_dep_list
WHERE dept_name = 'Sales';
--Returns 52245 lines


--List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.

--Uses WHERE and OR functions to query the two desired departments.
SELECT * FROM emp_dep_list
WHERE dept_name = 'Sales' OR dept_name = 'Development';
--Returns 137592 lines


--In descending order, list the frequency count of employee last names,
--i.e., how many employees share each last name.

--Uses aggregate COUNT function to get a total of last names
--storing them in a new column. Uses GROUP BY function to see the
--counts of each last name. Uses ORDER BY and DESC to see
--the highest count of last name that appears in the 'employee' table
SELECT last_name, COUNT(last_name) AS "Last Name Count"
FROM employees
GROUP BY last_name
ORDER BY "Last Name Count" DESC;
--Returns 1638 lines

--View no longer needed
DROP VIEW emp_dep_list;
