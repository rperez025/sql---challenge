-- DATA ENGINEERING --

DROP TABLE IF EXISTS titles CASCADE;
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS dept_manager CASCADE;
DROP TABLE IF EXISTS dept_emp CASCADE;
DROP TABLE IF EXISTS departments CASCADE;
DROP TABLE IF EXISTS salaries CASCADE;

-- Create titles table: title_id, title
CREATE TABLE titles (
	title_id VARCHAR NOT NULL PRIMARY KEY,
	title VARCHAR
);

SELECT * FROM titles;

-- Create employees table: emp_no, emp_title_id, birth_date, first_name, last_name, sex, hire_date
CREATE TABLE employees (
	emp_no INT NOT NULL PRIMARY KEY,
	emp_title VARCHAR,
	birth_date VARCHAR,
	first_name VARCHAR,
	last_name VARCHAR,
	sex VARCHAR,
	hire_date DATE,
	FOREIGN KEY (emp_title) REFERENCES titles(title_id)
);

SELECT * FROM employees;

-- Create departments table: dept_no, dept_name
CREATE TABLE departments (
	dep_no VARCHAR NOT NULL PRIMARY KEY,
	dept_name VARCHAR
);

SELECT * FROM departments;

-- Create dept_manager table: dept_no, emp_no
CREATE TABLE dept_manager (
	dep_no VARCHAR,
	emp_no INT,
	FOREIGN KEY (dep_no) REFERENCES departments(dep_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	PRIMARY KEY (dep_no, emp_no)
);

SELECT * FROM dept_manager;

-- Create dept_emp table: emp_no, dept_no
CREATE TABLE dept_emp (
	emp_no INT,
	dep_no VARCHAR,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dep_no) REFERENCES departments(dep_no),
	PRIMARY KEY (emp_no, dep_no)
);

SELECT * FROM dept_emp;

-- Create salaries table: emp_no, salary
CREATE TABLE salaries (
	emp_no INT NOT NULL PRIMARY KEY,
	salary INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT * FROM salaries;

-- DATA ANALYSIS --

-- 1. List the employee number, last name, first name, sex, and salary of each employee.
SELECT
	e.emp_no,
	e.last_name,
	e.first_name,
	e.sex,
	s.salary
FROM employees AS e
JOIN salaries AS s 
ON e.emp_no = s.emp_no;

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';
	
-- 3. List the manager of each department along with their department number, department name, 
-- employee number, last name, and first name.
SELECT
	d.dep_no,
	d.dept_name,
	e.emp_no,
	e.last_name,
	e.first_name
FROM departments AS d
JOIN dept_manager AS dm ON d.dep_no = dm.dep_no
JOIN employees AS e ON dm.emp_no = e.emp_no;

-- 4. List the department number for each employee along with that employee’s employee number, 
-- last name, first name, and department name.
SELECT
	d.dep_no,
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM departments AS d
JOIN dept_emp AS de ON d.dep_no = de.dep_no
JOIN employees AS e ON de.emp_no = e.emp_no;

-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose
-- last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- 6. List each employee in the Sales department, including their employee number, last name, and
-- first name.
SELECT
	d.dept_name,
	e.emp_no,
	e.last_name,
	e.first_name
FROM departments AS d
JOIN dept_emp AS de ON d.dep_no = de.dep_no
JOIN employees AS e ON de.emp_no = e.emp_no
WHERE d.dept_name = 'Sales';

-- 7. List each employee in the Sales and Development departments, including their employee number, 
-- last name, first name, and department name.
SELECT
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM employees AS e
JOIN dept_emp AS de ON e.emp_no = de.emp_no
JOIN departments AS d ON de.dep_no = d.dep_no
WHERE d.dept_name IN ('Sales', 'Development');

-- 8. List the frequency counts, in descending order, of all the employee last names (that is, how 
-- many employees share each last name).
SELECT last_name, COUNT(last_name) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;
