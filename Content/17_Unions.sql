/*-----------------Unions----------------*\

A union is where you connect data from two
or more queries using the UNION keyword.

-- SYNTAX --

SELECT columns
FROM table1
UNION
SELECT columns
FROM table2

\*---------------------------------------*/

USE sql_store;

-- Simple Union
-- This will return all data from customers
-- and the orders tables
SELECT *
FROM customers
UNION
SELECT *
FROM orders;

-- This is a more complicated use of union
-- it will catagorise customers into gold,
-- silver and bronze based upon points
-- Gold 
SELECT
	c.customer_id,
    c.first_name,
    c.points,
    'Gold' AS type
FROM customers c
WHERE points >= 3000
UNION
-- Silver
SELECT
	c.customer_id,
    c.first_name,
    c.points,
    'Silver' AS type
FROM customers c
WHERE points >= 2000 AND points < 3000
UNION
-- Bronze
SELECT
	c.customer_id,
    c.first_name,
    c.points,
    'Bronze' AS type
FROM customers c
WHERE points < 2000
ORDER BY customer_id