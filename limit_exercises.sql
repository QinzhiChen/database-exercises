-- show databases and identify i am going to use the employees table
SHOW DATABASES;
USE employees;
SELECT DISTINCT title FROM titles;

-- find employees who are hired in the 90s and born on Christmas, and sort them by hire date and limit our result to 5
SELECT first_name,
last_name,
hire_date,
birth_date
FROM employees
WHERE hire_date LIKE "199%-%" AND birth_date LIKE "%-12-25"
ORDER BY hire_date
LIMIT 5;
/* 'Alselm','Cappello','1990-01-01','1962-12-25'
'Utz','Mandell','1990-01-03','1960-12-25'
'Bouchung','Schreiter','1990-01-04','1963-12-25'
'Baocai','Kushner','1990-01-05','1959-12-25'
'Petter','Stroustrup','1990-01-10','1959-12-25'
*/

-- find the 10th page result with same condition as above
SELECT first_name,
last_name,
hire_date,
birth_date
FROM employees
WHERE hire_date LIKE "199%-%" AND birth_date LIKE "%-12-25"
ORDER BY hire_date
LIMIT 45,5;

/*'Pranay','Narwekar','1990-07-18','1963-12-25'
'Marjo','Farrow','1990-07-18','1963-12-25'
'Ennio','Karcich','1990-08-05','1962-12-25'
'Dines','Lubachevsky','1990-08-06','1954-12-25'
'Ipke','Fontan','1990-08-06','1952-12-25'
*/
