/* -----------------------------------------------------------------------------
|
|    The transaction below will sleep for 1 second, and then perform 4
|    operations on the employees table:
|
|    1. Selecting values from a row
|    2. Updating a new row
|    3. Adding a new index
|    4. Dropping the table
|
|    After each operation, a timestamp is recorded. These are used in the final
|    SELECT query to display when each of the 4 operations is completed.
|
|    * Uncomment the SELECT pg_sleep(1) statement and look at the results.
|
|      You should see that all four operations are completed after ~1 second.
|
*/ -----------------------------------------------------------------------------

SELECT clock_timestamp() AS t INTO start_time;
-- SELECT pg_sleep(1);  -- Allow the other transaction to acquire some locks

-- Select a row from employees
SELECT * FROM employees WHERE id = 1;
SELECT clock_timestamp() AS t INTO select_time;

-- Update a row in employees
UPDATE employees SET name = 'Johannes Kelpler' WHERE id = 4;
SELECT clock_timestamp() AS t INTO update_time;

-- Create a new index on employees
CREATE INDEX ON employees ((lower(name)));
SELECT clock_timestamp() AS t INTO index_time;

-- Drop the employees table
DROP TABLE employees CASCADE;
SELECT clock_timestamp() AS t INTO drop_time;


SELECT (SELECT select_time.t - start_time.t AS select_time FROM start_time, select_time),
       (SELECT update_time.t - start_time.t AS update_time FROM start_time, update_time),
       (SELECT index_time.t - start_time.t AS index_time FROM start_time, index_time),
       (SELECT drop_time.t - start_time.t AS drop_time FROM start_time, drop_time);
