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

- 


\*==================================================*/