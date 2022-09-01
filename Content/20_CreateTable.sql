/*------------Creating-Tables------------*\

This is how to create a table and how to 
create a table from a query.

-- SYNTAX --

CREATE TABLE tableName

\*---------------------------------------*/

-- How to create a simple table
CREATE TABLE new_table;

-- How to create a table from a query
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
WHERE i.payment_date IS NOT NULL;

