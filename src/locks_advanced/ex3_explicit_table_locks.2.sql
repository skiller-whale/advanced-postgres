/* -----------------------------------------------------------------------------
|
|    Follow the instructions in ex3_explicit_table_locks.1.sql if you have not
|    already done so.
|
|    The statements in this file represent a database migration that adds
|    a non-null constraint to the name column of the employees table.
|
|    * Read the statements below to see how this migration works.
|
|    * Uncomment the line with SELECT pg_sleep(1) and save this file.
|      When the code runs you should see that a deadlock occurs, preventing
|      one of two migrations from completing successfully.
|
|    * Add a statement to one or both transactions that will prevent a deadlock
|      from occurring. For this exercise:
|        * DO NOT change any existing statments.
|        * DO NOT change the order of any existing statements.
|        * DO NOT add any new pg_sleep commands.
|
*/ -----------------------------------------------------------------------------

BEGIN;

UPDATE employees SET name = 'UNKNOWN' WHERE name IS NULL;

-- SELECT pg_sleep(1);

ALTER TABLE employees ALTER COLUMN name SET NOT NULL;

COMMIT;


-- This SELECT is only here to let you know when the transaction has completed.
SELECT 'Success' AS name_migration_completed;
