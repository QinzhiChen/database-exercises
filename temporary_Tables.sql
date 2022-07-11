SHOW DATABASES;
USE employees;


-- SELECT FIRST NAME AND LAST NAME FROM EMPLOYEE 
-- AND DEPT_NAME FROM DEPARTMENTS TO CREATE A 
-- TEMPORARY TABLE IN MY FOLDER
CREATE TEMPORARY TABLE leavitt_1864.employees_with_departments AS
SELECT first_name, last_name, dept_name
FROM employees
JOIN dept_emp
USING (emp_no)
JOIN departments 
USING(dept_no);

USE leavitt_1864;
-- CREATE A COLUMN CALLED FULL NAME AND THE VARCHAR = SUM OF FIRST AND LAST NAME
ALTER TABLE leavitt_1864.employees_with_departments ADD COLUMN full_name VARCHAR(30);

UPDATE employees_with_departments
SET full_name = CONCAT(first_name," ",last_name);



-- REMOVE FIRST NAME AND LAST NAME
ALTER TABLE employees_with_departments DROP COLUMN first_name;
ALTER TABLE employees_with_departments DROP COLUMN last_name;
SELECT * FROM employees_with_departments;

-- copy payment from sakila.payment
CREATE TEMPORARY TABLE payment AS SELECT * FROM sakila.payment;
-- CHANGE AMOUNT FROM DOLLAR TO CENT
DESCRIBE payment; 
ALTER TABLE payment ADD COLUMN new_amount DECIMAL(50,0);
UPDATE payment
SET new_amount = amount*100;
SELECT * FROM payment; 

-- compare average department pay to overall pay
CREATE TEMPORARY TABLE average_pay
AS SELECT AVG(employees.salaries.salary),
(employees.salaries.salary - (SELECT AVG(employees.salaries.salary) FROM employees.salaries))
    /
    (SELECT stddev(employees.salaries.salary) FROM employees.salaries) AS zscore
FROM employees.salaries
WHERE employees.salaries.to_date>curdate()
GROUP BY ;


