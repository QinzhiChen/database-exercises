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
