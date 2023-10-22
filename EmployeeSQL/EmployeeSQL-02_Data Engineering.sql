-- Drop table if exists
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS titles;

-- Create table and view column datatypes and key
CREATE TABLE titles (
	title_id varchar (5) NOT NULL PRIMARY KEY,
	title varchar (55)
);

-- Create table and view column datatypes
CREATE TABLE employees (
	emp_no int NOT NULL PRIMARY KEY,
	emp_title_id varchar (100) REFERENCES titles(title_id),
	birth_date date,
	first_name varchar (55),
	last_name varchar(55),
	sex varchar (10),
	hire_date date
);

-- Create table and view column datatypes
CREATE TABLE departments (
	dept_no varchar (4) NOT NULL PRIMARY KEY,
	dept_name varchar (100)
);

-- Create table and view column datatypes
CREATE TABLE dept_emp (
	emp_no int REFERENCES employees(emp_no),
	dept_no varchar (4) REFERENCES departments(dept_no)
);

-- Create table and view column datatypes
CREATE TABLE dept_manager (
	dept_no varchar (4) REFERENCES departments(dept_no),
	emp_no int REFERENCES employees(emp_no)
);

-- Create table and view column datatypes
CREATE TABLE salaries (
	emp_no int REFERENCES employees(emp_no),
	salary int
);
