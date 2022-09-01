/*--------------Inner-Joins--------------*\

Inner joins, allow you to join tables up
to get a larger amount of columns of data
for you to work with.

(DONT USE IMPLICIT, JUST FOR REFERENCE)

-- IMPLICIT SYNTAX --

SELECT columns
FROM table1, table2
WHERE column1 = column2

(ALLWAYS USE EXPLICIT SYNTAX)

-- EXPLICIT SYNTAX --

SELECT columns
FROM table1
INNER JOIN table2
    ON column1 = column2

NOTE - 'INNER' is optional, if not specifyed
        MySQL will asume its an inner join.

\*---------------------------------------*/

-- Simple Inner Join
-- With Explicit Syntax (The best way)
SELECT *
FROM customers c
INNER JOIN orders o 
    ON c.customer_id = o.customer_id;

-- Join tables across databases
-- You only need to prefix the 
-- table that isnt in use currently
FROM order_items oi
JOIN sql_inventory.products p 
    ON oi.product_id = p.product;

-- Self joins
USE sql_hr;

-- This will show all rows twice
SELECT *
FROM employees e
JOIN employees m
    ON e.reports_to = m.employee_id;

-- Join More than two tables
USE sql_store;
-- This will contain the contents
-- From all three tables
SELECT *
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
JOIN order_statuses os
    ON o.status = os.order_status_id;

-- Composit Primary keys joining with
-- a compound join conditions
-- Use this when there are no single
-- joinable columns
SELECT *
FROM order_items oi
JOIN order_item_notes oin
	ON oi.order_id = oin.order_id
    AND oi.product_id = oin.product_id;