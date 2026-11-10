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

select current_database();

/*
1. What is the difference between a database and a table?
- A database houses tables, which are used to store the actual data values. 

2. Why did we create a separate `brightmart` database?
- It helps with separating concerns. It enables us to know intuitively that data data relating
to brightmart is stored in there.

3. Which command did you use to connect to it?
- With pgAdmin, there's not an explicit command to connect to a database. We just need
to reload the application, navigate to the 'brightmart' database, and open the query tool
associated with it.
*/