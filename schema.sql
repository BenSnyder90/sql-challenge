
drop table if exists dept_emp CASCADE;
drop table if exists dept_manager; 
DROP TABLE if exists salaries;
DROP TABLE if exists titles;
drop table if exists departments;
DROP TABLE if exists employees;


CREATE TABLE departments (
    dept_no varchar   NOT NULL PRIMARY KEY,
    dept_name varchar   NOT NULL
);

CREATE TABLE employees (
    emp_no int   NOT NULL PRIMARY KEY,
    birth_date date   NOT NULL,
    first_name varchar   NOT NULL,
    last_name varchar   NOT NULL,
    gender varchar(1)   NOT NULL,
    hire_date date   NOT NULL
);
CREATE TABLE dept_emp (
    emp_no int   NOT NULL,
    dept_no varchar   NOT NULL,
    from_date date   NOT NULL,
    to_date date   NOT NULL,
	PRIMARY KEY (emp_no, dept_no),
   	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE dept_manager (
    dept_no varchar   NOT NULL,
    emp_no int   NOT NULL,
    from_date date   NOT NULL,
    to_date date   NOT NULL,
	PRIMARY KEY (dept_no, emp_no),
   	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);



CREATE TABLE salaries (
    emp_no int   NOT NULL,
    salary money   NOT NULL,
    from_date date   NOT NULL,
    to_date date   NOT NULL,
	PRIMARY KEY (emp_no, salary),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE titles (
    emp_no int   NOT NULL,
    title varchar   NOT NULL,
    from_date date   NOT NULL,
    to_date date   NOT NULL,
	PRIMARY KEY (emp_no, title, from_date, to_date),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);


