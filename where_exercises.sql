/* Clauses: how we get specifically what we want

WHERE: Give me result specifically under x conditions
ORDER BY: sort by
LIMIT: Only give me some of the results back. A good way to get a preview on our table.
USE *** use the specific table in the databases 
DESCRIBE = what fields I have inside the orders table. */

-- SHOW the databases
SHOW DATABASES;
-- use the employees database
USE employees;
-- find the colums names
SELECT * FROM employees;
-- find the employee name "Irena", "Vidya" or "Maya"
SELECT first_name 
FROM employees
WHERE first_name IN ("Irena","Vidya","Maya");
-- The result returned with 709 rows

-- Finding out first names in Q2 use OR instead of insert

SELECT first_name,
hire_date
FROM employees
WHERE (first_name="Irena"OR first_name="Vidya"OR first_name="Maya") AND 
(hire_date LIKE "%-04-%"OR hire_date LIKE "%-05-%"OR hire_date LIKE "%-06-%");
-- There are 200 employees hired in Q2, which is about 509 hired outside Q2

-- finding out first names and male using OR
SELECT first_name,
gender
FROM employees
WHERE (first_name="Irena" OR first_name="Vidya" OR first_name="Maya") AND gender ="M";
-- 441 row returned

-- Find out employee last name start with "E"
SELECT last_name
FROM employees
WHERE last_name LIKE "E%";

-- We have 7330 rows returned

/* select last name start with "E" or ends with "E"
find out the difference */

SELECT last_name
FROM employees
WHERE last_name LIKE "E%" OR last_name LIKE "%E";
-- There are 30723 results returned, however, there are 23,393 employees don't start with "E"

-- Find employees' last name start and end with "E"
SELECT last_name
FROM employees
WHERE last_name LIKE "%E" AND last_name LIKE "E%";
-- There are 899 employees meet criteria


-- Find employees hired in 1990s and birth date is Christmas
SELECT hire_date,
birth_date
FROM employees
WHERE hire_date LIKE "199%-%" AND birth_date LIKE "%-12-25";
-- There are 362 employees hired in 1990s and born in Christmas

-- Find number employees last name with "q"
SELECT last_name
FROM employees
Where last_name LIKE "%q%";
-- There are 1873 employees' name has "q"

-- Select employees' name with "q" but not "qu"
SELECT last_name
FROM employees
WHERE last_name LIKE "%qu%" AND last_name NOT LIKE "%qu%";
-- There are 547 results
