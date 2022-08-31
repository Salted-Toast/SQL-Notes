/*----------------OrderBy----------------*\

This allows you to visualise your data by
ordering a column that has only numerical
values. I like to do this with the tables
primary KEY

NOTE -  ORDER BY allways goes at the 
        bottom of the query. Also DESC
        is descending order and it is
        optional 

-- SYNTAX --

SELECT columns
FROM table
ORDER BY column DESC

\*---------------------------------------*/

USE sql_store;

-- Returns data from customers in 
-- reverse order from customer_id
SELECT *
FROM customers
ORDER BY customer_id DESC