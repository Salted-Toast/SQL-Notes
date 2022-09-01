/*------------Updating-Data--------------*\

How to update tables data using UPDATE

-- SYNTAX --

UPDATE table
SET column1 = change1, column2 = change2
WHERE select row based upon cell value 
    (Usually primary key)

\*---------------------------------------*/

USE sql_store;
-- How to update data using UPDATE (Single Rows)
UPDATE invoices
SET payment_total = 10, payment_date = '2019-03-01'
WHERE invoice_id = 1;

-- If you got it wrong change by doing this below 
-- (change contents of previous query)
UPDATE invoices
SET payment_total = DEFAULT, payment_date = NULL
WHERE invoice_id = 1;

-- How to update multiple rows in a table
-- (Still using UPDATE but making search term more general)
UPDATE invoices
SET 
	payment_total = invoice_total * 0.5,
    payment_date = due_date
WHERE client_id IN (3, 4);
-- Leave WHERE blank to update all records

-- How to use subquerys in an UPDATE Statement
USE sql_invoicing;
-- Use a SELECT statemetn to verify your ammendments
UPDATE invoices
SET
	payment_total = invoice_total * 0.5,
    payment_date = due_date
    WHERE client_id IN 
				(SELECT client_id
				FROM clients
				WHERE state IN ('CA', 'NY'));  

                -- The shiz above is now dynamic

-- How to delete data using DELETE
DELETE FROM invoices
WHERE client_id = (
		SELECT client_id
		FROM clients
		WHERE name = 'Myworks'
);