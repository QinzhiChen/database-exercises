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
AS SELECT AVG(employees.salaries.salary) average, employees.departments.dept_name
FROM employees.salaries
JOIN employees.dept_emp
USING (emp_no)
JOIN employees.departments
USING (dept_no)
WHERE employees.salaries.to_date>curdate() AND employees.dept_emp.to_date>now()
GROUP BY employees.departments.dept_name;
select*from average_pay;

ALTER TABLE average_pay
ADD avg_ float(50,2),
ADD std float(50,2),
ADD z_score float(50,0);
select * from avg_std;

CREATE TEMPORARY TABLE avg_std AS 
SELECT AVG(employees.salaries.salary) avg_1,STD(employees.salaries.salary) std_1 FROM employees.salaries WHERE employees.salaries.to_date>now();

UPDATE average_pay 
SET avg_=(SELECT avg_1 FROM avg_std);
UPDATE average_pay
SET std= (SELECT std_1 FROM avg_std);

UPDATE average_pay SET z_score= (average-avg_)/std;

SELECT * FROM average_pay;
