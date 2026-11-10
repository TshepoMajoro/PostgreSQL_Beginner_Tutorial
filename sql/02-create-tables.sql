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

-- # Tutorial 2 – Plan the database and create tables
CREATE TABLE customers (
    customer_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    phone VARCHAR(20),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE products (
    product_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    description TEXT,
    price NUMERIC(10, 2) NOT NULL CHECK (price >= 0),
    stock_quantity INTEGER NOT NULL DEFAULT 0 CHECK (stock_quantity >= 0),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE orders (
    order_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    order_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20) NOT NULL DEFAULT 'PENDING',
    CONSTRAINT fk_orders_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id),
    CONSTRAINT chk_orders_status
        CHECK (status IN ('PENDING', 'PAID', 'SHIPPED', 'CANCELLED'))
);

CREATE TABLE order_items (
    order_item_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    order_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL CHECK (quantity > 0),
    unit_price NUMERIC(10, 2) NOT NULL CHECK (unit_price >= 0),

    CONSTRAINT fk_order_items_order
        FOREIGN KEY (order_id)
        REFERENCES orders(order_id),

    CONSTRAINT fk_order_items_product
        FOREIGN KEY (product_id)
        REFERENCES products(product_id),

    CONSTRAINT uq_order_product
        UNIQUE (order_id, product_id)
);

SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public'
  AND table_type = 'BASE TABLE'
ORDER BY table_name;

/*
1. Why do we keep customers and orders in separate tables?
- It follows convension to separate the two. In the statement 'customers make orders',
we have got the subject (i.e. customers), object (i.e. orders), and action (i.e. make).
Convension states that the subject and object become database tables, linked to one
another through the action.

2. Why does `orders` contain `customer_id`?
- The customers and orders tables have a one-to-many relationship with one another.
The orders table being the 'many' side, is obligated to contain the foreign key, which
would be the primary key of the customers table (a.k.a the 'one' side).

3. What could go wrong if `price` were stored as text?
- the CHECK operation would fail.

4. What does the `CHECK (quantity > 0)` rule protect against?
- Ensures that the table does not accept zero nor negative values.

5. Why does `order_items` store `unit_price`?
- The value of unit_price is item specific, and meaning it is a variable component
that is consistently changing values.

*/
