/* -----------------------------------------------------------------------------
|
|    1. Parallel Queries
|
|    Follow the instructions in ex1_parallel_queries.1.sql if you have not
|    already done so.
|
|    * Read the queries below, uncomment them and save this file.
|
|      You should see two output tables, one corresponding to query <1> (the
|      other file), and one corresponding to query <2> (this file). Are the
|      query results what you expected?
|
|    * Add a clock_timestamp column to the final SELECT in this file so you can
|      see when it finishes running, relative to the other file.
|
|    * Add a pg_sleep query so that the transaction in this file sleeps for 3
|      seconds before updating the value of `name`.
|
|      Why have the query results for <1> changed because of this?
|
*/ -----------------------------------------------------------------------------

-- UPDATE employees set name = 'Marlin Scorsese' WHERE id = 1;
-- COMMIT;

-- SELECT id, name, salary FROM employees WHERE id = 1;
