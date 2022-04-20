/* -----------------------------------------------------------------------------
|
|    Follow the instructions in ex4_row_level_locks.1.sql if you have not
|    already done so.
|
|    * Before you make each of the following changes, try to predict what will
|      happen when both transactions run, and how long each will take.
|
|      1. Uncomment the line with DELETE FROM employees.
|      2. Change that line, so employee 90 is deleted instead of 80.
|      3. Change that line so that employee 100 is deleted instead of 90.
|
|    * How long does this transaction take to complete after the final step?
|      can you explain why?
|
*/ -----------------------------------------------------------------------------

SELECT clock_timestamp() AS t INTO start_time_2;
SELECT pg_sleep(1);  -- Allow the other transaction to acquire some locks

BEGIN;

-- DELETE FROM employees WHERE id = 80;

COMMIT;

-- This SELECT is only here to let you know when the transaction has completed.
SELECT clock_timestamp() - start_time_2.t AS transaction_2_duration
FROM start_time_2;
