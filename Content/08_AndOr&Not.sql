/*-------------AND-OR-&-NOT--------------*\

This is to add multiple statements to the
WHERE clause, AND making it so both have to
be true for a result to be returned and OR
being one or the other to be met so a result
can be returned.

NOT is to return the antithesis of the query

-- SYNTAX --

SELECT columns
FROM table
WHERE statement1 AND/OR/NOT statement2

\*---------------------------------------*/

USE sql_invoing;

-- This will return all the values where
-- customer_id is bigger than 1 AND their
-- Birth date is after 1990-01-01
SELECT *
FROM customers
WHERE customer_id > 2 AND birth_date > '1990-01-01';

-- This will select customers that have an id
-- bigger than 2 OR are born after 1990-01-01
-- This will return columns that have either of
-- these
SELECT *
FROM customers
WHERE customer_id > 2 OR birth_date > '1990-01-01';

-- This will return all rows that have the
-- feild of phone number filed out
SELECT *
FROM customers
WHERE phone NOT NULL;