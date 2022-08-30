/*----------Removing-Duplicates----------*\

This is where say you are looking at customer
location from their state that they live in
and multiple people live in the same state
and you only want one record to show per state
to see what states you have customers in.

You will use the DISTINCT keyword

-- SYNTAX --

SELECT DISTINCT column
FROM table

\*---------------------------------------*/

USE sql_store;

-- This will gather all state column
SELECT state
FROM customers;

-- This will get each unique state
SELECT DISTINCT state
FROM customers;