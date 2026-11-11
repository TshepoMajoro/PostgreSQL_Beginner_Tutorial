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


-- # Tutorial 9 – LIMIT and DROP TABLE
/*
Explain why the following two operations are different:

- Removing one customer's row.

-> This operation is completed using the DELETE query. It only aims to remove a one or a 
few data records, not whipe entire tables.

- Removing the entire customers table.

-> This operation us completed using the DROP query. It aims to remove the existence of a
database table along with all of its data

*/