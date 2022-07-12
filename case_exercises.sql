USE employees;

-- seperate them with 1 or 0
SELECT
    emp_no,from_date,to_date,
    CASE to_date
        WHEN '9999-01-01' THEN 1
        ELSE 0
    END AS is_current_employee
FROM dept_emp;

-- Seperate then by alphabetical order
SELECT first_name,last_name,
	CASE last_name 
    WHEN last_name >='H%'
    THEN "A-H"
    WHEN last_name >='Q%'
    THEN "I-Q"
    WHEN last_name >='Z%'
    THEN "R-Z"
    WHEN last_name="Z%"
    THEN "R-Z"
    END AS "alpha_group"
FROM employees;


-- Seperate them by decade
SELECT birth_date,
	CASE
		WHEN birth_date LIKE "195%" THEN "50S"
        WHEN birth_date LIKE "196%" THEN "60s"
	END AS "DECADE"
FROM employees
GROUP BY birth_date;

-- Seperate them by department group
SELECT
    AVG(salary) average_salary,
    CASE
       WHEN dept_name IN ('research', 'development') THEN 'R&D'
       WHEN dept_name IN ('sales', 'marketing') THEN 'Sales & Marketing'
       WHEN dept_name IN ('Production', 'Quality Management') THEN 'Prod & QM'
       WHEN dept_name IN ("Finance", "Human Resources") THEN "Finance&HR"
       ELSE dept_name
   END AS dept_group
FROM salaries
JOIN dept_emp
USING (emp_no)
JOIN departments
USING (dept_no)
WHERE dept_emp.to_date>now()
GROUP BY dept_group;


