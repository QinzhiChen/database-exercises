USE employees;

SELECT
    emp_no,from_date,to_date,
    CASE to_date
        WHEN '9999-01-01' THEN 1
        ELSE 0
    END AS is_current_employee
FROM dept_emp;

SELECT first_name,last_name,
	CASE last_name 
    WHEN last_name BETWEEN 'A%' AND 'H%' 
    THEN "A-H"
    WHEN last_name BETWEEN 'I%' AND 'Q%'
    THEN "I-Q"
    WHEN last_name BETWEEN 'R%' AND 'Z%'
    THEN "R-Z"
    END AS "alpha_group"
FROM employees;
