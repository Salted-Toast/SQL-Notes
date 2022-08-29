

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
-- Multiple cells in rows
INSERT INTO products
VALUES 
	(DEFAULT, 'live Chicken', 89, 15.2),
    (DEFAULT, 'thin baloons', 295, 0.12),
    (DEFAULT, 'thick baloons', 846, 1.23)

- How to insert data into multiple tables using MySQL func 'LAST_INSERT()' 
INSERT INTO orders (customer_id, order_date, status)
VALUES ('1', '2019-01-02', 1);

INSERT INTO order_items
VALUES
	(LAST_INSERT_ID(), 1, 1, 2.95),
	(LAST_INSERT_ID(), 12, 1, 3.95)

- How to copy a table (Note that atributes are not carried over in MySQL)
CREATE TABLE orders_archived AS 
SELECT * FROM orders (This select statement being a subquery)
-- subquery is a statement that is part of another statement

- How to create a table with a query
-- Archive invoices 
-- INNER JOIN with client table 
-- Only copy invoices that have a payment
-- Client name, instead of client id
USE sql_invoicing;

CREATE TABLE invoices_archived AS
SELECT
	i.invoice_id,
    i.number,
    c.name AS client,
    i.invoice_total,
    i.payment_total,
    i.invoice_date,
    i.payment_date,
    i.due_date
FROM invoices i
JOIN clients c ON
	c.client_id = i.client_id
WHERE i.payment_date IS NOT NULL

- How to update data using UPDATE (Single Rows)
UPDATE invoices
SET payment_total = 10, payment_date = '2019-03-01'
WHERE invoice_id = 1
-- iF you got it wrong change by doing this below (change contents of prev query)
UPDATE invoices
SET payment_total = DEFAULT, payment_date = NULL
WHERE invoice_id = 1

- How to update multiple rows in a table (Still using UPDATE but making searchterm more general)
UPDATE invoices
SET 
	payment_total = invoice_total * 0.5,
    payment_date = due_date
WHERE client_id IN (3, 4)
-- Leave WHERE blank if you want to update all records

- How to use subquerys in an UPDATE Statement
USE sql_invoicing;
-- Use a SELECT statemetn to verify your ammendments
UPDATE invoices
SET
	payment_total = invoice_total * 0.5,
    payment_date = due_date
    WHERE client_id IN 
				(SELECT client_id
				FROM clients
				WHERE state IN ('CA', 'NY'))    

                -- The shiz above is now dynamic

- How to delete data using DELETE
DELETE FROM invoices
WHERE client_id = (
		SELECT client_id
		FROM clients
		WHERE name = 'Myworks'
)
-- Still using dynamic statements via the use of subquerys

\*==================================================*/