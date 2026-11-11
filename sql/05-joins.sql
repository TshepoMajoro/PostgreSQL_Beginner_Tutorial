-- Database: brightmart

-- DROP DATABASE IF EXISTS brightmart;

CREATE DATABASE brightmart
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_South Africa.1252'
    LC_CTYPE = 'English_South Africa.1252'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;


SELECT
    orders.order_id,
    customers.first_name,
    customers.last_name,
    orders.status
FROM orders
INNER JOIN customers
    ON orders.customer_id = customers.customer_id;


SELECT
    o.order_id,
    c.first_name,
    c.last_name,
    o.status
FROM orders AS o
INNER JOIN customers AS c
    ON o.customer_id = c.customer_id;


SELECT
    o.order_id,
    c.first_name,
    p.product_name,
    oi.quantity,
    oi.unit_price
FROM orders AS o
INNER JOIN customers AS c
    ON o.customer_id = c.customer_id
INNER JOIN order_items AS oi
    ON o.order_id = oi.order_id
INNER JOIN products AS p
    ON oi.product_id = p.product_id;


SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    o.order_id
FROM customers AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id
ORDER BY c.customer_id;

/*
1. Show each order with the customer's full name.
*/
select 
	o.order_id,
	o.status,
	c.first_name,
	c.last_name
from orders as o
inner join customers as c
on o.customer_id = c.customer_id;

/*
2. Show each product included in each order.
*/
select 
	o.order_id,
	o.status,
	p.product_name,
	p.description,
	oi.unit_price
from Orders as o
inner join order_items as oi
on o.order_id = oi.order_id
inner join products as p
on p.product_id = oi.product_id;

/*
3. Show all customers, even those without orders.
*/
select 
	o.order_id,
	o.status,
	c.first_name,
	c.last_name
from orders as o
right join customers as c
on o.customer_id = c.customer_id;

/*
4. Show order ID, customer email, product name and quantity.
*/
SELECT o.order_id,c.email,p.product_name,oi.quantity
FROM orders AS o
INNER JOIN customers AS c
ON o.customer_id = c.customer_id
INNER JOIN order_items AS oi
ON o.order_id = oi.order_id
INNER JOIN products AS p
ON oi.product_id = p.product_id;
