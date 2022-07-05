-- SHOW DATABASES, AND IDENTIFY THE TABLE WE ARE GOING TO USE

SHOW DATABASES;
USE employees;

-- Combined the employees' first name and last name together and name it as full_name.
-- use funct CONCAT
SELECT CONCAT(first_name, " ",last_name) AS full_name
FROM employees;

-- convert above function to all uppcase
SELECT UPPER(CONCAT(first_name," ", last_name)) AS full_name
FROM employees;

-- find how many days employees has been working at the company with whose birthday is Christmas
SELECT DATEDIFF(CURDATE(), hire_date) AS "Days Working at the Company",
first_name,
last_name,
birth_date
FROM employees
WHERE birth_date LIKE "%-12-25" AND hire_date LIKE "199%-%";

-- find the smallest and largest current salary
SELECT MIN(salary) AS smallest_current_salary,
MAX(salary) AS largest_current_salary
FROM salaries;

-- USE SQL functions to generate username
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
SUBSTR(birth_date,3,2))) AS username,
first_name,
last_name,
birth_date
FROM employees
LIMIT 10;