/*-----------------WHERE-----------------*\

Used to narrow down queries to get more
specific results, like everything in a
table that had an id of 2

-- SYNATX --

SELECT columns
FROM table
WHERE statement

\*---------------------------------------*/

USE sql_store;

SELECT *
FROM customers
WHERE customer_id = 2