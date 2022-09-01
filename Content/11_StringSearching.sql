/*-----------String-Searching------------*\

You can do this by utilising the keywords
LIKE and REGEXP, these both have their own
symbols that allow you to refine/open up
your query

-- LIKE --

You can use the % symbol to say any
characters before or after these letters,
dependent on where you place it. And, it
has the _ symbol which represents a singular
char.

-- REGEXP --

You can use the ^ symbol to show
the start of a string, the $ represents the
end of a string, the | acts as an OR and the
[] allow you to put in vairable letters

-- SYNTAX --

SELECT columns
FROM table
WHERE column LIKE 'content for search'

-- SYNTAX --

SELECT columns
FROM table
WHERE column REGEXP 'content for search'

\*---------------------------------------*/

USE sql_store;

        ---- LIKE ----

-- Returns names that are just 'a'
SELECT *
FROM customers
WHERE name LIKE 'a';
-- Returns names beggining with a
SELECT *
FROM customers
WHERE name LIKE 'a%';
-- Returns names with an a in it
SELECT *
FROM customers
WHERE name LIKE '%a%';
-- Returns names where the third letter is = a
SELECT *
FROM customers
WHERE name LIKE '__a%';

        ---- REGEXP ----

-- Returns last names that have Twiddell in it
SELECT *
FROM customers
WHERE last_name REGEXP 'Twiddell';
-- Returns last names that = Twiddell
SELECT *
FROM customers
WHERE last_name REGEXP '^Twiddell$';
-- Returns last names that have Twiddell mac rose in it
SELECT *
FROM customers
WHERE last_name REGEXP 'Twiddell|mac|rose';
-- Returns last names that have ge/ie/me in it
SELECT *
FROM customers
WHERE last_name REGEXP '[gim]e';


