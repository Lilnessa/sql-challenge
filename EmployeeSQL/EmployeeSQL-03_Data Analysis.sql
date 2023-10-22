Select * From employees;
Select * From salaries;
Select * From dept_manager;
Select * From departments;

--1. List the employee number, last name, first name, sex, and salary of each employee.
Select employees.emp_no, last_name, first_name, sex, salary
FROM employees 
JOIN salaries
ON employees.emp_no = salaries.emp_no;

--2. List the first name, last name, and hire date for the employees who were hired in 1986.
Select last_name, first_name, hire_date
FROM employees 
WHERE extract (year from hire_date) = 1986;

--3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
Select dept_manager.dept_no, dept_name, dept_manager.emp_no, last_name, first_name
FROM departments
JOIN dept_manager
ON dept_manager.dept_no = departments.dept_no
JOIN employees
on employees.emp_no = dept_manager.emp_no;

--4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
Select dept_emp.dept_no, dept_emp.emp_no, last_name, first_name, dept_name
FROM departments
JOIN dept_emp
ON dept_emp.dept_no = departments.dept_no
JOIN employees
on employees.emp_no = dept_emp.emp_no;

--5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--6.List each employee in the Sales department, including their employee number, last name, and first name.
Select dept_name, dept_emp.emp_no, last_name, first_name
FROM departments
JOIN dept_emp
ON dept_emp.dept_no = departments.dept_no
JOIN employees
on employees.emp_no = dept_emp.emp_no
WHERE dept_name = 'Sales';

--7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
Select dept_emp.emp_no, last_name, first_name, dept_name
FROM departments
JOIN dept_emp
ON dept_emp.dept_no = departments.dept_no
JOIN employees
on employees.emp_no = dept_emp.emp_no
WHERE dept_name = 'Sales' OR dept_name = 'Development';

--8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
Select last_name,
COUNT(last_name) as last_name_frequency_count
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;