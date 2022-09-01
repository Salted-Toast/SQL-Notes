/*----------------OrderBy----------------*\

This allows you to visualise your data by
ordering a column. I like to do this with
the tables primary KEY.

You can also order something by multiple
columns, these columns can be strings,
integers or floats.

NOTE -  ORDER BY allways goes at the 
        bottom of the query. Also DESC
        is descending order and it is
        optional 

NOTE -  MySQL allows you to order by 
        any column regardless if its in
        the select clause. (It has to be
        in the table)

-- SYNTAX --

SELECT columns
FROM table
ORDER BY column1, column2 DESC

\*---------------------------------------*/

USE sql_store;

-- Returns data from customers in 
-- reverse order from customer_id
SELECT *
FROM customers
ORDER BY customer_id DESC;

-- Returns data from customers based
-- upon what state they live in. If
-- They live in the same state they
-- Will be ordered by whos name comes
-- first in alphabetical order
SELECT *
FROM customer
ORDER BY state, first_name;
