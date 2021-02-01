/* -----------------------------------------------------------------------------
|
|    Follow the instructions in ex5_explicit_row_level_locks.1.sql if you have
|    not already done so.
|
|    * Read the two UPDATE statements below, and note which ids are being
|      affected.
|
|    * Uncomment the SELECT pg_sleep(2) statement, and save this file. One of
|      the two transactions will fail because of a deadlock. Think about why
|      this has happened.
|
|    * Add an explicit row lock to this transaction to prevent the deadlock
|      from occurring. Do not change any of the existing code.
|
|    * Try this with each of the 4 kinds of row-level locks, one at a time.
|      Which is the least restrictive row lock that still prevents the deadlock?
|
*/ -----------------------------------------------------------------------------


SELECT clock_timestamp() AS t INTO start_time_2;


UPDATE employees SET manager_id = 1 WHERE id = 50;
-- SELECT pg_sleep(2);
UPDATE projects SET parent_project_id = 3 WHERE id = 25;


-- This SELECT is only here to let you know when the transaction has completed.
SELECT 'Success' AS transaction_2_completed,
       clock_timestamp() - start_time_2.t AS duration
FROM start_time_2;
