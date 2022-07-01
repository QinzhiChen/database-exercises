-- show databases
SHOW DATABASES;
-- show the employees database
USE employees;
-- List all tables in the database
SHOW TABLES;
-- the employee number, birth_date, name, gender, and hire date are showing in this data
SELECT * FROM employees;
-- Which table(s) do you think contain a numeric type column? (employee ID)
-- Which table(s) do you think contain a string type column? (names and gender)
-- Which table(s) do you think contain a date type column? (birthdate and hire date)

SELECT * FROM departments, employees;
-- What is the relationship between the employees and the departments tables
-- Each department has employees assigned to it

SHOW CREATE TABLE dept_manager;

