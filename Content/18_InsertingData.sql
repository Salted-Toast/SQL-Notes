/*------------Inserting-Data-------------*\

This is how to insert data into tables

-- SYNTAX --

- Without specfying columns -

INSERT INTO table
VALUES (
    value1,
    DEFAULT,
    value3,
    NULL
)

NOTE -  When you insert values without
        specifying what column you must
        have a data entry for every column
        otherwise you get an error.

NOTE -  DEFAULT only works if you hve set
        a default value in the table config

-- SYNTAX --

- With specifying columns -

INSERT INTO

\*---------------------------------------*/

USE sql_store;

-- Simple insert WITHOUT column specification
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
    DEFAULT);

-- Simple insert WITH column specification
-- Note that the column entries dont have to
-- be listed in order however values do
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
    );

-- How to insert multiple rows into a table
INSERT INTO shippers (name)
VALUES 
	('Shipper1'),
	('Shipper2'),
	('Shipper3');

-- How to do multiple cells in the rows
INSERT INTO products
VALUES 
	(DEFAULT, 'live Chicken', 89, 15.2),
    (DEFAULT, 'thin baloons', 295, 0.12),
    (DEFAULT, 'thick baloons', 846, 1.23);

-- Inserting data into multiple tables using MySQL func 'LAST_INSERT()'
-- WITHOUT 
INSERT INTO orders (customer_id, order_date, status)
VALUES ('1', '2019-01-02', 1);
-- WITH
INSERT INTO order_items
VALUES
	(LAST_INSERT_ID(), 1, 1, 2.95),
	(LAST_INSERT_ID(), 12, 1, 3.95);