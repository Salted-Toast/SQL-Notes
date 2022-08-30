/*----------------Between----------------*\

This allows you to quereie between two set
numerical values, you may do this with an
AND statement like below but BETWEEN is the
propper way to go about it

-- SYNTAX --

SELECT columns
FROM table
WHERE column 

\*---------------------------------------*/

USE sql_store;

-- This is the longwinded way of doing this through AND
SELECT *
FROM customers
WHERE points >= 1000 AND points <= 3000;

-- This is the shortened/cleaner way to do with BETWEEN
-- Note that between is inclusive so it also accounts for
-- The values set so 1000 and 3000
SELECT*
FROM customers
WHERE points BETWEEN 1000 AND 3000
