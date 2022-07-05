SHOW DATABASES;

-- Use Sakila Databases
USE sakila;
-- select all columns from the actor table
SELECT * FROM actor;

-- select only the last name column
SELECT last_name FROM actor;

-- select only the film id, title, and release year
SELECT 
film_id,
title,
release_year
FROM film;

-- distinct all last names from actor
SELECT DISTINCT last_name
FROM actor;

-- select all distince postal codes from address table
SELECT DISTINCT postal_code
FROM address;

-- select distinct rating 
SELECT DISTINCT rating
FROM film;