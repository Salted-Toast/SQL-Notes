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
    ON c.customer_id = o.customer_id

-- Join Multiple Tables
SELECT *
FROM 