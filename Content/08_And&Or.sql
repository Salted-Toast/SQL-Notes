/*---------------AND-&-OR----------------*\

This is to add multiple statements to the
WHERE clause, AND making it so both have to
be true for a result to be returned and OR
being one or the other to be met so a result
can be returned.

-- SYNTAX --

SELECT columns
FROM table
WHERE statement1 AND/OR statement2

\*---------------------------------------*/

USE sql_invoing;

SELECT *
FROM clients
WHERE 