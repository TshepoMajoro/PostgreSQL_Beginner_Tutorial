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

-- Tutorial 04 - Insert data into tables
INSERT INTO customers (first_name, last_name, email, phone)
VALUES
    ('Aisha', 'Khumalo', 'aisha@example.com', '0710000001'),
    ('Daniel', 'Mokoena', 'daniel@example.com', '0720000002');
SELECT * FROM customers;

INSERT INTO products (product_name, description, price, stock_quantity)
VALUES
    ('Wireless Mouse', 'Wireless computer mouse', 249.99, 30),
    ('Mechanical Keyboard', 'USB mechanical keyboard', 899.00, 15),
    ('USB-C Cable', 'One metre USB-C cable', 99.50, 50);
SELECT * FROM products;

SELECT customer_id, first_name, last_name
FROM customers
ORDER BY customer_id;

INSERT INTO orders (customer_id, status)
VALUES
    (1, 'PAID'),
    (2, 'PENDING');

SELECT order_id, customer_id, status FROM orders;
SELECT product_id, product_name, price FROM products;

INSERT INTO order_items (order_id, product_id, quantity, unit_price)
VALUES
    (1, 1, 2, 249.99),
    (1, 3, 1, 99.50),
    (2, 2, 1, 899.00);

SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM order_items;

INSERT INTO customers (first_name, last_name, email, phone)
VALUES ('Karabo', 'Mahola', 'karabo@example.com', '0720000003'),
	('Teboho', 'Mahola', 'tebza@example.com', '0720000004'),
	('Teboho', 'Rankati', 'dom@example.com', '0720000005'),
	('Ntu', 'Maluleke', 'malooks@example.com', '0720000006');
SELECT * FROM customers;

INSERT INTO products (product_name, description, price, stock_quantity)
VALUES
    ('Wireless Earbuds', 'Wireless Samsung earbuds', 849.99, 10),
	('Curved Monitor', 'Curved Sony monitor', 5449.99, 5),
	('Gaming Chair', 'Legion Of Gamers Gaming Chair', 2999.99, 30);
SELECT * FROM products;

INSERT INTO orders (customer_id, status)
VALUES 
	(3, 'PAID'),
    (4, 'SHIPPED'),
	(5, 'SHIPPED'),
	(6, 'CANCELLED');
SELECT * FROM orders;

INSERT INTO order_items (order_id, product_id, quantity, unit_price)
VALUES
    (3, 4, 3, 849.99),
	(4, 5, 1, 5449.99),
	(5, 6, 2, 2999.99);
SELECT * FROM order_items;