-- This is hwo to single line comment

/*
This is how to multi line comment
*/

/*==================File=Structure==================*\

- Comments
- Simple Querie Statements Using SELECT & FROM
- Arithmatic to Simple Statements
- How to Set Aliases
- How to remove duplicated results via DISTINCT
- Use WHERE
- Go over comparitive operator and normal arythmatic ones
- AND & OR (AND being eval First)
- IN operator
- BETWEEN operator
- Search for coloumns using strings
- LIKE operator
- REGEXP ^,$, | and []
- ORDER BY and DESC etc
- LIMIT operator
- INNER JOIN
- Join more than two tables
- self join

- Composit Primary keys joining with compound join conditions
SELECT *
FROM order_items oi
JOIN order_item_notes oin
	ON oi.order_id = oin.order_id
    AND oi.product_id = oin.product_id

- IMPLICIT join syntax & risks of cross joins
SELECT *
FROM orders o, customers c
WHERE o.customer_id = c.customer_id

- EXPLICIT join syntax
SELECT *
FROM orders o
JOIN customers c
	ON o.customer_id = c.customer_id

- Outer Joins (LEFT and RIGHT)
-- INNER JOIN (Show present records of orders)
-- SELECT 
-- 	c.customer_id,
--     c.first_name,
--     o.order_id
-- FROM customers c
-- JOIN orders o
-- 	ON c.customer_id = o.customer_id
-- ORDER BY c.customer_id

-- OUTER JOIN (Shows all people order or not)
SELECT 
	c.customer_id,
    c.first_name,
    o.order_id
FROM orders o 
RIGHT OUTER JOIN customers c -- (RIGHT join uses right table so customers) (OUTER & INNER are optional)
	ON c.customer_id = o.customer_id
ORDER BY c.customer_id

- Outer joins with multiple tables (Use LEFT JOIN rather than RIGHT, ez to understand)
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
ORDER BY c.customer_id

- How to simplify join statement utilising USING (MySQL only)
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

- Natural Joins (dont use just for ref bc it lets the database engine do it for u so could emd up with unexpected errors)
SELECT
	o.order_id,
    c.first_name
FROM orders o
NATURAL JOIN customers c

- Cross Joins (you would only use this say if you had a database of shirts and you wanted to see every size in every colour to figure out if you had a blue shirt in a XL)
-- Explicit Syntax
SELECT *
FROM shippers s, products p
ORDER BY shipper_id
-- Implicit Syntax
SELECT *
FROM shippers s
CROSS JOIN products p
ORDER BY shipper_id

- Unions and how you can group data from two queries (data can be from multiple tables)
SELECT
	order_id,
    order_date,
    'Active' AS status
FROM orders
WHERE order_date >= '2019-01-01'
UNION
SELECT
	order_id,
    order_date,
    'Archived' AS status
FROM orders
WHERE order_date < '2019-01-01'
-- This will error bc MySQL dk how to do more than one select thing
SELECT first_name, last_name
FROM customers
UNION
SELECT name 
FROM shippers
-- Also coloumn will be based from first querie
-- EXAMPLE of how UNION works
-- Gold 
SELECT
	c.customer_id,
    c.first_name,
    c.points,
    'Gold' AS type
FROM customers c
WHERE points >= 3000
UNION
-- Silver
SELECT
	c.customer_id,
    c.first_name,
    c.points,
    'Silver' AS type
FROM customers c
WHERE points >= 2000 AND points < 3000
UNION
-- Bronze
SELECT
	c.customer_id,
    c.first_name,
    c.points,
    'Bronze' AS type
FROM customers c
WHERE points < 2000
ORDER BY customer_id

- Setting datatypes
VARCHAR(50) - variable character 50 max variable means it will be whatever
CHAR(50) - will be whatever u put in + whatever to make it 50
INT(11) - integer, whole num 
DATE - this is date, its Year-Month-Day or YYYY-MM-DD e.g. 2022-01-25

- Settings under table config
PK is primary key
NN is Not Null means that values cannot be null so reqired feilds like customer name

B tells MySQL if its a binary column 
UN is unsigned datatype
ZF fills all columns with 0 if its numeric data
AI is auto incrimental meaning that MySQL will incriment the previous value by one when another entrie is made
G is Generated column
Default expression is just whatever it will be set if nothing is put in its place, usually used for NULL/0

- Inserting data using INSER INTO
-- Without specifying what columns to use
INSERT INTO customers
VALUES (
	DEFAULT,
    'Salted',
    'Toast',
    NULL,
    DEFAULT,
    'address',
    'city',
    'CA'
    DEFAULT)
-- With specifyign what columns to use (order of columns dosent matter just remember to keep the values in the same order as columns)
INSERT INTO customers (
	first_name,
    last_name,
    address,
    city,
    state)
VALUES (
    'Salted',
    'Toast',
    'address',
    'city',
    'CA'
    )

- How to insert multiple rows into a table
INSERT INTO shippers (name)
VALUES 
	('Shipper1'),
	('Shipper2'),
	('Shipper3')

- 

\*==================================================*/