-- USE EMPLOYEES DATABASE FOR THIS EXERCISE

SHOW DATABASES;
USE employees;


-- Current employee who has same hire date as emp_no 101010
/* SELECT hire_date
FROM employees
WHERE emp_no = "101010" */


SELECT emp_no, CONCAT(first_name," ", last_name) Employee_Name, hire_date
FROM employees
JOIN salaries
USING (emp_no)
WHERE hire_date= (SELECT hire_date
FROM employees
WHERE emp_no = "101010" ) AND to_date>curdate();


-- FIND ALL TITLES HELD BY current employees with first name Aamod
/*SELECT first_name
FROM employees
WHERE first_name="Aamod";*/

SELECT first_name,title
FROM titles
JOIN (SELECT *
FROM employees
WHERE first_name="Aamod") emp
ON titles.emp_no=emp.emp_no
WHERE to_date>curdate();

-- employees no longer working for the company

/*SELECT COUNT(emp_no)
FROM dept_emp
WHERE to_date>curdate();*/

SELECT COUNT(*)
FROM employees
WHERE emp_no NOT IN (
SELECT emp_no
FROM dept_emp
WHERE to_date>now());
-- 59900

-- Find current department managers who are female, list their name
/* SELECT emp_no
FROM dept_manager
WHERE to_date>curdate();

SELECT dept_name
FROM dept_emp
JOIN departments
USING (dept_no);*/

SELECT CONCAT(first_name," ",last_name) Manager_Name, gender,dept_name
FROM employees
JOIN (
SELECT emp_no
FROM dept_manager
WHERE to_date>curdate())current_manager
ON current_manager.emp_no=employees.emp_no
JOIN (SELECT dept_name,emp_no
FROM dept_emp
JOIN departments
USING (dept_no)) dept
ON dept.emp_no=employees.emp_no
WHERE gender ="F";
/* 'Isamu Legleitner','F','Finance'
'Karsten Sigstam','F','Human Resources'
'Leon DasSarma','F','Development'
'Hilary Kambil','F','Research'
*/

-- Employees currently have higher salary than the companies overall historical average salary
/*SELECT AVG(salary)
FROM salaries;*/

SELECT emp_no, CONCAT(first_name, " ", last_name) Employee_Name, salary
FROM employees
JOIN salaries
USING(emp_no)
WHERE salary>(SELECT AVG(salary)
FROM salaries) AND to_date>CURDATE();


-- standard deviation of the current highest salary
SELECT salary
FROM salaries
WHERE salary>=((SELECT MAX(salary) FROM salaries WHERE to_date LIKE "9999%")-
(SELECT STD(salary)
FROM salaries)
)AND to_date>curdate();

-- WHAT Pencentage
SELECT(
(SELECT COUNT(salary)
FROM salaries
WHERE salary>=((SELECT MAX(salary) FROM salaries WHERE to_date LIKE "9999%")-
(SELECT STD(salary)
FROM salaries)
)AND to_date>curdate())
/
(SELECT COUNT(*) 
FROM salaries WHERE to_date>now())*100) PERCENTAGE;



