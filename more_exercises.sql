-- SHOW DATABASES AND THEN USE SAKILA DATABASE
SHOW DATABASES;
USE sakila;

-- SELECT ALL COLUMNS FROM THE ACTOR TABLE
SELECT * FROM actor;

--  SELECT last_name FROM actor table
SELECT last_name FROM actor;

-- SELECT only the film_id, title, and release_year from film table
SELECT film_id,
title,
release_year
FROM film;

-- SELECT distinct last names from actor
SELECT DISTINCT last_name
FROM actor;

-- SELECT distinct postal codes from address
SELECT DISTINCT postal_code
FROM address;

-- SELECT distinct ratings from film
SELECT DISTINCT rating
FROM film;

-- select the title, description, rating, movie length from film that last 3 hours
SELECT title,
description,
rating,
length
FROM film
WHERE length >="180";

-- SELECT THE PAYMENT ID, AMOUNT, PAYMENT DATE COLUMNS FROM PAYMENT WHERE MADE AFTER 5-27-05
SELECT
payment_id,
amount,
payment_date
FROM payment
WHERE payment_date >= "2005-05-27 00:00:00";

-- SELECT primary key, amount, payment date from payment that made on 05/27
SELECT payment_id
amount, 
payment_date
FROM payment
WHERE payment_date BETWEEN "2005-05-27 00:00:00" AND "2005-05-27 23:59:59";

-- SELECT ALL COLUMNS FROM CUSTOMER TABLE WHERE LAST NAME BEGGIN WITH S AND FIR NAME END WITH N
SELECT *
FROM customer
WHERE Last_name LIKE "S%" AND first_name LIKE "%N";

-- SELECT ALL COLUMS WHERE CUSTOMER IS INACTIVE OR LAST NAME BEGIN WITH "M"
SELECT *
FROM customer
WHERE last_name LIKE "M%" AND active != 1;

-- select all columns from category table and where primary key is greater than 4 and the name begins with C,S OR T.
DESCRIBE category;
SELECT *
FROM category
WHERE category_id> 4 AND (name LIKE "C%" OR name LIKE "S%" OR name LIKE "T%");

-- select all columns minus the password
SELECT password
FROM staff;