/*--------------Outer-Joins--------------*\

An outer join differs from an inner join by
the outer joins capability to display Null
values in querys.

-- SYNTAX --

SELECT columns
FROM table2
LEFT/RIGH OUTER JOIN table2

NOTE - 'OUTER' is optional, if not specifyed
        MySQL will asume its an OUTER join
        if you have put either RIGHT/LEFT.

\*---------------------------------------*/
USE sql_store;

-- Simple Outer join
SELECT 
	c.customer_id,
    c.first_name,
    o.order_id
FROM orders o 
-- (RIGHT join uses right table so customers, LEFT would create a self join)
RIGHT OUTER JOIN customers c 
	ON c.customer_id = o.customer_id
ORDER BY c.customer_id;

-- Outer Join with multiple tables
SELECT
	c.customer_id,
    c.first_name,
    o.order_id,
    sh.name AS shipper
FROM customers c 
LEFT OUTER JOIN orders o
	ON c.customer_id = o.customer_id
LEFT OUTER JOIN shippers sh
	ON o.shipper_id = sh.shipper_id
ORDER BY c.customer_id;

-- How to simplify join statement utilising 
-- USING (MySQL only)
-- See how the USING keyword is more simple 
-- than the commented out line
SELECT
	o.order_id,
	c.first_name,
    s.name AS shipper
FROM orders o
LEFT OUTER JOIN customers c
	-- ON o.customer_id = c.customer_id
    USING (customer_id)
LEFT OUTER JOIN shippers s
	USING (shipper_id)
ORDER BY o.order_id

