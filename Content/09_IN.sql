/*------------------IN-------------------*\

You use this if you wanted to do multiple or
statements, you do this because in SQL you
cannot combine a STR with a boolean expression
that outputs a boolean value (True/False)

-- SYNTAX --

SELECT columns
FROM table
WHERE column IN (contents to search for)

\*---------------------------------------*/

USE sql_store;

SELECT *
FROM customers
WHERE state IN ('VA', 'FL', 'GA');