/*--------------Corss-Joins--------------*\

A cross join is where you join every possible
record with every record, which returns a 
massive jumble like mess of data.

The use case for this is if you say had a
database of shirts, containg their colours
and size and you wanted to see if you had
a blue shirt in an XXL

-- EXPLICIT SYNTAX --

SELECT columns
FROM table1, table2

-- IMPLICIT SYNTAX --

SELECT columns
FROM table1
CROSS JOIN table2

NOTE -  Do not use implicit syntax as it is
        unclear and make a mess as when 
        complex the database engine may get
        it wrong

\*---------------------------------------*/

USE sql_store;

-- Simple Cross Join
SELECT *
FROM shippers s, products p
ORDER BY shipper_id;