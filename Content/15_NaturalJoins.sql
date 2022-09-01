/*-------------Natural-Joins-------------*\

A natural join is where you let the database
engine do the thinking and let it complete the
join based upon info that could give you an
incorrect output.

NOTE -  Do not use this at all, it is just for
        reference and can lead to unexpected 
        errors and possible incorrect data 
        creation etc

-- SYNTAX --

SELECT 
    table1.column1
    table2.column2
FROM table1
NATURAL JOIN table2

\*---------------------------------------*/

USE sql_store;

-- Natural Joins 
SELECT
	o.order_id,
    c.first_name
FROM orders o
NATURAL JOIN customers c