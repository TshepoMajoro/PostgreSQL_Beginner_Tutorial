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

SELECT product_id, product_name, price
FROM products
WHERE product_name = 'USB-C Cable';

UPDATE products
SET price = 109.50
WHERE product_name = 'USB-C Cable';

SELECT product_name, price
FROM products
WHERE product_name = 'USB-C Cable';

UPDATE products
SET
    stock_quantity = 45,
    description = 'One metre USB-C charging and data cable'
WHERE product_name = 'USB-C Cable';

ALTER TABLE customers
ADD COLUMN city VARCHAR(80);

ALTER TABLE customers
RENAME COLUMN phone TO phone_number;

ALTER TABLE customers
ALTER COLUMN city TYPE VARCHAR(100);

ALTER TABLE customers
DROP COLUMN city;

SELECT customer_id, first_name, last_name, email
FROM customers
WHERE email = 'test@example.com';

DELETE FROM customers
WHERE email = 'test@example.com';

UPDATE products
SET price = 119.50
WHERE product_name = 'USB-C Cable';

SELECT product_name, price
FROM products
WHERE product_name = 'USB-C Cable';

COMMIT;

/*
1. Increase the price of one product.
*/
update products
set price = 200
where product_id = 1;
select * from products;

/*
2. Add a `city` column to customers.
*/
alter table customers
add column city varchar;
select * from customers;

/*
3. Set a city for one customer.
*/
update customers
set city = 'Kroonstad'
where customer_id = 3;
select * from customers;

/*
4. Find that customer using a `WHERE` condition.
*/
select * from customers where city = 'Kroonstad';

/*
5. Practise a transaction and decide whether to commit or roll it back.
*/
update customers
set city = 'Kroonstad'
where customer_id = 4;

select * from customers where customer_id = 4;

commit;