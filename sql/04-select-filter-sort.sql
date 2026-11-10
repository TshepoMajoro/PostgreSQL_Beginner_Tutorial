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

SELECT * FROM customers;

SELECT first_name, last_name, email
FROM customers;

SELECT
    product_name AS product,
    price AS selling_price
FROM products;

SELECT product_name, price
FROM products
WHERE price > 200;

/*
1. Find products costing less than R300.
*/
select 
	product_id as id,
	product_name as name,
	price as cost,
	stock_quantity as quantity
from products
where price < 300;

/*
2. Find products with exactly 15 units in stock.
*/
select 
	product_id as id,
	product_name as name,
	price as cost,
	stock_quantity as quantity
from products
where stock_quantity = 15;

/*
3. Find orders whose status is `PENDING`.
*/
select * from orders
where status = 'PENDING';

SELECT product_name, price, stock_quantity
FROM products
WHERE price > 100
  AND stock_quantity >= 20;

/*
Try finding products that cost less than R150 or have fewer than 20 units in stock.
*/
select
	product_id as id,
	product_name as name,
	price as cost,
	stock_quantity as quantity
from products
where (price < 150 or stock_quantity < 20);

SELECT product_name
FROM products
WHERE product_name LIKE '%USB%';

SELECT product_name
FROM products
WHERE product_name ILIKE '%keyboard%';

SELECT order_id, status
FROM orders
WHERE status IN ('PAID', 'SHIPPED');

SELECT product_name, price
FROM products
WHERE price BETWEEN 100 AND 500;

SELECT product_name, price
FROM products
ORDER BY price DESC;

SELECT product_name, price
FROM products
ORDER BY product_name ASC;

SELECT product_name, stock_quantity, price
FROM products
ORDER BY stock_quantity ASC, price DESC;

/*
1. Display only customer names and emails.
*/
select
	first_name as name,
	last_name as surname,
	email
from customers;

/*
2. Find products costing more than R200.
*/
select
	product_name as name,
	price,
	stock_quantity as quantity
from products
where price > 200;

/*
3. Find orders with a status of `PAID` or `SHIPPED`.
*/
select
	order_id,
	customer_id,
	status
from orders
where status in ('PAID','SHIPPED');

/*
4. Search for product names containing `USB`, regardless of letter case.
*/
select
	product_name as name,
	price,
	stock_quantity as quantity
from products
where product_name ilike '%usb%';

/*
5. Display products from most expensive to least expensive.
*/
select
	product_name as name,
	price,
	stock_quantity as quantity
from products
order by price desc;