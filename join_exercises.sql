SHOW DATABASES;

USE join_example_db;
DESCRIBE users;
DESCRIBE roles;
/* USERS TABLE
'id','int unsigned','NO','PRI',NULL,'auto_increment'
'name','varchar(100)','NO','',NULL,''
'email','varchar(100)','NO','',NULL,''
'role_id','int unsigned','YES','MUL',NULL,''
ROLES TABLE
'id','int unsigned','NO','PRI',NULL,'auto_increment'
'name','varchar(100)','NO','',NULL,''
*/

-- USE JOIN, LEFT JOIN, AND RIGHT JOIN TO COMBINE THOSE TWO TABLES.

SELECT *
FROM users
JOIN roles
ON users.role_id=roles.id;

SELECT *
FROM users
lEFT JOIN roles
ON users.role_id=roles.id;

SELECT *
FROM roles
RIGHT JOIN users
ON users.role_id=roles.id;

-- USE GROUP BY, count list of roles and number of users
SELECT *, COUNT(users.role_id)
FROM roles
JOIN users
ON roles.id=users.role_id
GROUP BY users.id;

-- FIND current department manager
USE employees;
SELECT dept_name "DEPARTMENT NAME",CONCAT(first_name, " ",last_name) "Department Manager"
FROM employees
JOIN dept_manager
USING (emp_no)
JOIN departments
USING (dept_no)
WHERE dept_manager.to_date="9999-01-01"
ORDER BY dept_name;

-- Find department manager who is female
SELECT dept_name "DEPARTMENT NAME", CONCAT(first_name, " ", last_name) "MANAGER NAME"
FROM employees
JOIN dept_manager
USING (emp_no)
JOIN departments
USING (dept_no)
WHERE gender = "F" AND to_date= "9999-01-01"
ORDER BY "DEPARTMENT NAME";

-- Find current title of employees working in customer service department
SELECT title "Title", COUNT(dept_no) "Count"
FROM titles
JOIN dept_emp
USING (emp_no)
JOIN departments
USING (dept_no)
WHERE titles.to_date = "9999-01-01" AND dept_name = "Customer Service"
GROUP BY title
ORDER BY title;

-- find current salary of all current managers
SELECT dept_name "Department Name",CONCAT(first_name," ",last_name) "Name", salary "Salary"
FROM salaries
JOIN dept_manager
USING (emp_no)
JOIN employees
USING (emp_no)
JOIN departments
USING (dept_no)
WHERE salaries.to_date = "9999-01-01" AND dept_manager.to_date="9999-01-01"
ORDER BY dept_name;

-- Find number of current employees for each department
SELECT dept_no, dept_name, COUNT(emp_no) "num_employees"
FROM departments
JOIN dept_emp
USING(dept_no)
WHERE to_date = "9999-01-01"
GROUP BY "num_employees",dept_no
ORDER BY dept_no;

-- Department that has highest average salary
SELECT dept_name, AVG(salary) average_salary
FROM dept_emp
JOIN departments
USING(dept_no)
JOIN salaries
USING(emp_no)
WHERE salaries.to_date = "9999-01-01"
GROUP BY dept_name
ORDER BY average_salary DESC
LIMIT 1;

-- Who is the highest paid employee in marketing department
SELECT first_name,last_name
FROM employees
JOIN salaries
USING(emp_no)
JOIN dept_emp
USING(emp_no)
JOIN departments
USING(dept_no)
WHERE dept_name ="Marketing"
ORDER BY salary DESC
LIMIT 1;

-- Which current department manager has highest salary
SELECT first_name, last_name, salary
FROM employees
JOIN salaries
USING (emp_no)
JOIN dept_manager
USING (emp_no)
JOIN departments
USING (dept_no)
WHERE salaries.to_date>curdate() AND dept_manager.to_date>curdate()
ORDER BY salary DESC
LIMIT 1;

-- historically all average salary in all departments
SELECT dept_name, 
ROUND(AVG(salary),0) average_salary
FROM salaries
JOIN dept_emp
USING (emp_no)
JOIN departments
USING (dept_no)
GROUP BY dept_name
ORDER BY average_salary DESC;


-- Bonus
SELECT CONCAT(first_name," ", last_name) "Employee Name",
dept_name "Department Name",
sql1.Department_Manager "Manager Name"
FROM (
SELECT dept_name AS DEPARTMENT_NAME,CONCAT(first_name, " ",last_name) Department_Manager
FROM employees
JOIN dept_manager
USING (emp_no)
JOIN departments
USING (dept_no)
WHERE dept_manager.to_date="9999-01-01"
ORDER BY dept_name
) AS sql1
JOIN departments
ON sql1.DEPARTMENT_NAME = departments.dept_name
JOIN dept_emp
ON departments.dept_no=dept_emp.dept_no
JOIN employees
ON dept_emp.emp_no = employees.emp_no
WHERE dept_emp.to_date > curdate()
ORDER BY dept_name;

-- who is the highest paid employeee in each department
SELECT CONCAT(first_name," ", last_name) "Employee Name",
dept_name "Department Name",
"Manager Name",
sql3.salary "Highest"
FROM (
SELECT CONCAT(first_name," ", last_name) "Employee Name",
dept_name Department_Name,
sql1.Department_Manager "Manager Name"
FROM (
SELECT dept_name AS DEPARTMENT_NAME,CONCAT(first_name, " ",last_name) Department_Manager
FROM employees
JOIN dept_manager
USING (emp_no)
JOIN departments
USING (dept_no)
WHERE dept_manager.to_date="9999-01-01"
ORDER BY dept_name
) AS sql1
JOIN departments
ON sql1.DEPARTMENT_NAME = departments.dept_name
JOIN dept_emp
ON departments.dept_no=dept_emp.dept_no
JOIN employees
ON dept_emp.emp_no = employees.emp_no
WHERE dept_emp.to_date > curdate()
ORDER BY dept_name) AS sql2
JOIN departments
ON sql2.Department_Name=departments.dept_name
JOIN dept_emp
ON departments.dept_no=dept_emp.emp_no
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN (SELECT salary, salaries.emp_no AS sal
FROM salaries
JOIN employees
USING(emp_no)
JOIN dept_emp
USING(emp_no)
JOIN departments
USING(dept_no)) as sql3
ON sql3.sal=employees.emp_no
WHERE dept_emp.to_date > curdate();

SELECT salary, salaries.emp_no AS sal
FROM salaries
JOIN employees
USING(emp_no)
JOIN dept_emp
USING(emp_no)
JOIN departments
USING(dept_no);