/*-------------Miscellaneous--------------*\

-- LIMIT --

The limit keyword allows you to limit the
amount of returned results.

NOTE -  If the int specifyed is larger than
        the entire amt of recods in query
        it will just return the entire query

-- SYNTAX --

SELECT columns
FROM table
LIMIT integer to limmit values

-- IS NULL --

This is where you can grab columns that have
Null valued cells 

\*---------------------------------------*/

        -- LIMIT --

-- This will return the first three rows
-- from the customers table
SELECT *
FROM customers
LIMIT 3

        -- IS NULL --

-- This will return