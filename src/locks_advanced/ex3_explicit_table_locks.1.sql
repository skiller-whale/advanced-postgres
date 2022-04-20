/* -----------------------------------------------------------------------------
|
|    The statements in this file represent a database migration that adds
|    a non-null constraint to the salary column of the employees table.
|
|    * Read the statements below to see how this migration works.
|    * Follow the instructions for in ex3_explicit_table_locks.2.sql
|
*/ -----------------------------------------------------------------------------

BEGIN;

UPDATE employees SET salary = 20000 WHERE salary IS NULL;

SELECT pg_sleep(1);

ALTER TABLE employees ALTER COLUMN salary SET NOT NULL;

COMMIT;


-- This SELECT is only here to let you know when the transaction has completed.
SELECT 'Success' AS salary_migration_completed;
