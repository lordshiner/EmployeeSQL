--1. List the following details of each employee: 
--employee number, last name, first name, gender, and salary

SELECT e.emp_no as "'Employee Number'", 
	e.last_name as "'Last Name'",
	e.first_name as "'First Name'",
	e.gender,
	cast(s.salary as money) as Salary
FROM employees as e
JOIN salaries as s ON e.emp_no = s.emp_no;

--2. List employees who were hired in 1986 
SELECT CONCAT(first_name,' ',last_name) AS Employees_Hired_in_1986
FROM employees as e
WHERE date_part('year', hire_date) IN ('1986');

--3. List the manager of each department with the following information: 
--department number, department name, the manager's employee number, 
--last name, first name, and start and end employment dates.
SELECT mgr.dept_no,d.dept_name,mgr.emp_no,e.last_name,e.first_name,mgr.from_date,mgr.to_date
FROM dept_manager as mgr
JOIN departments as d ON d.dept_no = mgr.dept_no
JOIN employees as e ON e.emp_no = mgr.emp_no;

--4. List the department of each employee with the following information: 
--employee number, last name, first name, and department name
SELECT emp.emp_no,e.last_name,e.first_name,d.dept_name
FROM dept_emp as emp
JOIN departments as d ON d.dept_no = emp.dept_no
JOIN employees as e ON e.emp_no = emp.emp_no;

--5. List all employees whose first name is "Hercules" 
--and last names begin with "B."

SELECT DISTINCT CONCAT(first_name,' ',last_name) AS Employee 
FROM employees as e
WHERE e.first_name = 'Hercules' AND LEFT(e.last_name,1) = 'B';

--6. List all employees in the Sales department, including their 
--employee number, last name, first name, and department name.

SELECT e.emp_no,e.last_name,e.first_name,d.dept_name
FROM departments AS d
JOIN dept_emp as de ON de.dept_no = d.dept_no
JOIN employees as e ON e.emp_no = de.emp_no
WHERE dept_name IN ('Sales');

--7.List all employees in the Sales and Development departments, including their 
--employee number, last name, first name, and department name.

SELECT e.emp_no,e.last_name,e.first_name,d.dept_name
FROM departments AS d
JOIN dept_emp as de ON de.dept_no = d.dept_no
JOIN employees as e ON e.emp_no = de.emp_no
WHERE dept_name IN ('Sales','Development');

--8. In descending order, list the frequency count of 
--employee last names, i.e., how many employees share each last name.
SELECT *
FROM(
	SELECT e.last_name,count(*) as frequency
	FROM employees as e
	GROUP BY e.last_name ) as f
ORDER BY f.frequency desc;