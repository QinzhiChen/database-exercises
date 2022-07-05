-- Start with show databases
SHOW DATABASES;
-- Use the employees table for this exercise, find the table contents
USE employees;
SELECT * FROM employees LIMIT 10;
-- SELECT Irena, Vidya and Maya in the table and sort them by first name
SELECT first_name,
last_name
FROM employees
WHERE first_name IN ('Irena', 'Vidya','Maya')
ORDER BY first_name DESC;
-- The first row is Irena Reutenauer and last row is Vidya Awdeh

-- SELECT Irena, Vidya, and Maya, sort them with first name and last name
SELECT first_name,
last_name
FROM employees
WHERE first_name IN ('Irena', 'Vidya','Maya')
ORDER BY first_name DESC, last_name DESC;
-- The first row is Irena Acton, and last person is Vidya Zweizig

-- find Irena, Vidya, and Maya, sort them with last name and then first name
SELECT first_name,
last_name
FROM employees
WHERE first_name IN ('Irena', 'Vidya','Maya')
ORDER BY last_name, first_name;
-- The first row is Irena Action, and last row is Maya Zyda

-- Find employees' last name starts and ends with "E". sort them by employee number
SELECT emp_no,
last_name,
first_name
FROM employees
WHERE last_name LIKE "E%" AND last_name LIKE "%E"
ORDER BY emp_no DESC;
-- 899 employees returned, the first emoloyee is 10021, Erde Ramzi, and last is 499648 Erde Tadahiro

-- find employees' last name starts and ends with "E", sort by hire date
SELECT last_name,
first_name,
hire_date
FROM employees
WHERE last_name LIKE "E%"AND last_name LIKE "%E"
ORDER BY hire_date;
-- newest is Eldridge Teiji hired on 1999-11-27 and oldest is Erde Sergi hired on 1985-02-02

-- Find employees hired in the 90s and born on Christmas, sort them with oldest employee hire lastest
SELECT last_name,
first_name,
hire_date,
birth_date
FROM employees
WHERE hire_date LIKE "199%-%" AND birth_date LIKE "%-12-25"
ORDER BY birth_date,hire_date;
-- The oldest employee who was hired last is Eugenio Tremaine, and the youngest emoloyee hired first is Vakili Gudjon