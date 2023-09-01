-- Query tables
SELECT * FROM titles;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM departments;
SELECT * FROM dept_manager;
SELECT * FROM dept_emp

-- 1. List the employee number, last name, first name, sex, and salary of each employee.
SELECT employees.emp_no,employees.last_name,employees.first_name,employees.sex FROM employees
INNER JOIN salaries ON employees.emp_no=salaries.emp_no;

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name,last_name,hire_date FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'; 

-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT titles.title,departments.dept_no,departments.dept_names,dept_manager.emp_no,employees.last_name,employees.first_name
FROM departments 
INNER JOIN dept_manager ON departments.dept_no=dept_manager.dept_no
INNER JOIN employees ON dept_manager.emp_no=employees.emp_no
INNER JOIN titles ON employees.emp_title_id=titles.title_id
WHERE title='Manager';

-- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT departments.dept_no,departments.dept_names,employees.emp_no,employees.last_name,employees.first_name
FROM departments
INNER JOIN dept_emp ON departments.dept_no=dept_emp.dept_no
INNER JOIN employees ON dept_emp.emp_no=employees.emp_no;

-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name,last_name,sex FROM employees
WHERE first_name='Hercules' AND last_name LIKE 'B%';

-- 6. List each employee in the Sales department, including their employee number, last name, and first name.
SELECT departments.dept_names,employees.emp_no,employees.last_name,employees.first_name
FROM departments
INNER JOIN dept_emp ON departments.dept_no=dept_emp.dept_no
INNER JOIN employees ON dept_emp.emp_no=employees.emp_no
WHERE dept_names='Sales';

-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT departments.dept_names,employees.emp_no,employees.last_name,employees.first_name
FROM departments
INNER JOIN dept_emp ON departments.dept_no=dept_emp.dept_no
INNER JOIN employees ON dept_emp.emp_no=employees.emp_no
WHERE dept_names='Sales' OR dept_names='Development';

-- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name,COUNT(last_name) AS name_number
FROM employees
GROUP BY last_name
ORDER BY name_number DESC;
