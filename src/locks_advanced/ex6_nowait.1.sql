/* -----------------------------------------------------------------------------
|
|    This exercise involves the same 2 migrations as ex3_explicit_table_locks.
|
|    * Read the statements below to remind yourself how this migration works.
|    * Follow the instructions for in ex6_nowait.2.sql
|
*/ -----------------------------------------------------------------------------

SELECT clock_timestamp() AS t INTO start_time_1;


UPDATE employees SET salary = 20000 WHERE salary IS NULL;
SELECT pg_sleep(2);
ALTER TABLE employees ALTER COLUMN salary SET NOT NULL;


-- This SELECT is only here to let you know when the transaction has completed.
SELECT clock_timestamp() - t AS duration,
       'Success' AS salary_migration_completed
FROM start_time_1;
