/* -----------------------------------------------------------------------------
|
|    Follow the instructions in ex2_table_lock_levels.1.sql if you have not
|    already done so.
|
|    * Try to predict which steps in the other file will be blocked by the
|      transaction in this file when the SELECT statement below is uncommented.
|    * Uncomment the SELECT statement and check if your prediction was right.
|      (any blocked operations will complete after 2 seconds instead of 1).
|
|    * On the line below the SELECT from employees statement, add a new SQL
|      statement that will also block the index creation in the other
|      transaction (but not the UPDATE).
|
|    * On the line below that, add another SQL statement that will also block
|      the update in the other transaction. Think about which table lock modes
|      would block the update, and choose a statement based on this.
|
*/ -----------------------------------------------------------------------------

BEGIN;

-- SELECT * FROM employees WHERE id = 10;

SELECT pg_sleep(2);  -- Prevent this transaction from completing for 2 seconds

COMMIT;
