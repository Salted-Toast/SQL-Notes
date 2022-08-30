/*---------------Aliases---------------*\

Aliases are set after a table is mentioned
in a SQL querey and make code look nicer 
and easier for people to read and you to
write.

You can use this before and after this
alias has been set like in the SELECT
part of a querey

-- SYNTAX --

SELECT columns
FROM table alias

\*---------------------------------------*/

USE sql_store;

-- This will allow you to grab selected columns
-- First one will work without alias
-- Second one is how u use alias
-- Third one will set an alias for the new column that I set
SELECT
    products.name,
    p.quantity_in_stock,
    p.unit_price = unit_price * 1.5 AS new_unit_price
FROM products p
WHERE quantity_in_stock > 10;