/* -----------------------------------------------------------------------------
|
|   This file has some example queries that you can uncomment to quickly
|   explore the database you'll be working with.
|
|   Each time you save this file, you will see the result of the LAST query
|   in this file in the terminal window where you ran docker-compose up.
|
|   When you have more than one uncommented query you'll need to add a
|   semicolon (;) after each one.
|
*/ -----------------------------------------------------------------------------

-- The queries below give a quick overview of the customers and sales table
--
-- SELECT * FROM customers LIMIT 10;
-- SELECT * FROM sales LIMIT 10;

-- The query below is a refresher for how to use GROUPING SETS
--
-- SELECT
--   nationality,
--   gender,
--   COUNT(customers.id) AS customer_count,
--   SUM(sales.value) AS total_sales_value
-- FROM customers
-- LEFT JOIN sales ON sales.customer_id=customers.id
-- GROUP BY
--   GROUPING SETS (
--     (gender, nationality),
--     (gender),
--     ()
--   )
-- ORDER BY nationality, gender, customer_count DESC;
