/*--------------Copy-Tables--------------*\

This is simply how you can copy a table
and how can use this as a template for
another table that contains similar data

-- SYNTAX --

CREATE TABLE tableName AS
SELECT columns
FROM table

\*---------------------------------------*/

-- How to copy a table
CREATE TABLE orders_archived AS 
SELECT * 
FROM orders

