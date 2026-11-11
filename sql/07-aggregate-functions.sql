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
    SUM(quantity * unit_price) AS total_order_value
FROM order_items;

SELECT
    AVG(price) AS average_product_price
FROM products;

SELECT
    ROUND(AVG(price), 2) AS average_product_price
FROM products;

SELECT COUNT(*) AS total_customers
FROM customers;

SELECT COUNT(*) AS total_products
FROM products;

SELECT
    MIN(price) AS cheapest_price,
    MAX(price) AS most_expensive_price
FROM products;

SELECT
    order_id,
    SUM(quantity * unit_price) AS order_total
FROM order_items
GROUP BY order_id
ORDER BY order_id;

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(oi.quantity * oi.unit_price) AS total_spent
FROM customers AS c
INNER JOIN orders AS o
    ON c.customer_id = o.customer_id
INNER JOIN order_items AS oi
    ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_spent DESC;

SELECT
    order_id,
    SUM(quantity * unit_price) AS order_total
FROM order_items
GROUP BY order_id
HAVING SUM(quantity * unit_price) > 500;

/*
1. Calculate the total value of all order items.
*/
select 
	SUM(quantity * unit_price) as total_value
from order_items;

/*
2. Calculate the average product price.
*/
select
	ROUND(AVG(price),3) as average_product_price
from products;

/*
3. Count all products.
*/
select COUNT(*) from products;

/*
4. Find the cheapest and most expensive product.
*/
select
	product_name,
	price
from products
group by product_name, price
having 
	MIN(price) = price 
	or
	MAX(price) = price
limit 2;

/*
5. Calculate the total value of each order.
*/
select
	order_id,
	SUM(quantity * unit_price) as total_order_value
from order_items
group by order_id;

/*
6. Find orders with a total value greater than R500.
*/
select
	order_id,
	SUM(quantity * unit_price) as total_order_value
from order_items
group by order_id
having SUM(quantity * unit_price) > 500;

