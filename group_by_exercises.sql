/* DISTINCT: get every unique item name in the table of order*/
SHOW DATABASES;
USE employees;

-- distinct titles
SELECT DISTINCT title
FROM titles;
-- there are 7 distinct titles in title table

-- find a list unique last name that star and end with "E" and group by
SELECT last_name
FROM employees
WHERE last_name LIKE "%E" AND last_name LIKE "E%"
GROUP BY last_name;
-- The query identified 5 employees' last name start end end with E

-- a QUERY THAT COMBINATIONS OF FIR AND LAST NAMES OF ALL EMPLOYEES WHILE THEIR LAST NAMES STARTS AND ENDS WITH "E"
SELECT
CONCAT(last_name, " ", first_name) AS full_name
FROM employees
WHERE last_name LIKE "%E" AND last_name LIKE "E%"
GROUP BY full_name;

-- a query identify the uniue last name with q but not qu
SELECT last_name
FROM employees
WHERE last_name LIKE "%q%" AND last_name NOT LIKE "%qu%"
GROUP BY last_name;
/*'Chleq'
'Lindqvist'
'Qiwen'
*/

-- with the above condition, count the last name

SELECT last_name,
COUNT(last_name) AS number_with_same_last_name
FROM employees
WHERE last_name LIKE "%q%" AND last_name NOT LIKE "%qu%"
GROUP BY last_name;
/* 'Qiwen','168'
'Lindqvist','190'
'Chleq','189'
*/

-- find employees with specified first name and count/group them by gender
SELECT first_name,
gender,
COUNT(*) AS toal_number_employee_with_this_name
FROM employees
WHERE first_name IN ("Irena","Vidya","Maya")
GROUP BY first_name,gender;

-- identify how many duplicate usernames existed
/*-- USE SQL functions to generate username
/* where the username is:
all lower case
first character of the first name
first 4 characters of last name
underscore
the birth month of the employee
the last two digit of the birth year */

SELECT LOWER(CONCAT(
SUBSTR(first_name,1,1),
SUBSTR(last_name,1,4),
"_",
SUBSTR(birth_date,6,2),
SUBSTR(birth_date,3,2))) AS username
FROM employees
Group BY username
HAVING COUNT(username)>1; 
--  13251 usernames are duplicated duplicated.

-- BONUS QUESTIONS
SELECT emp_no,avg(salary) AS avg_salary
FROM salaries
GROUP BY emp_no;

SELECT count(emp_no) AS emp_in_dep,
dept_no
FROM dept_emp
GROUP BY dept_no;

SELECT emp_no,
COUNT(salary) AS diff_salary
FROM salaries
GROUP BY emp_no;

SELECT emp_no,
MAX(salary) AS max_salary
FROM salaries
GROUP BY emp_no;

SELECT emp_no,
MIN(salary) AS min_salary
FROM salaries
GROUP BY emp_no;

SELECT emp_no,
STD(salary) as standard_deviation_salary
FROM salaries
GROUP BY emp_no;

SELECT emp_no,
MAX(salary) AS max_salary
FROM salaries
GROUP BY emp_no
HAVING max_salary > 150000;

SELECT emp_no,
avg(salary) AS avg_salary
FROM salaries
GROUP BY emp_no
HAVING avg_salary BETWEEN 80000 AND 90000;