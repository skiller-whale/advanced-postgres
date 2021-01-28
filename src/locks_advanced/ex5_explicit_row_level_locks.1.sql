/* -----------------------------------------------------------------------------
|
|    * Without editing any code, read the query below, and make sure you
|      understand what is happening in the two UPDATE steps. Note which ids are
|      being affected.
|
|    * Follow the instructions in ex5_explicit_row_level_locks.2.sql.
|
*/ -----------------------------------------------------------------------------


SELECT clock_timestamp() AS t INTO start_time_1;
SELECT pg_sleep(1);  -- Allow the other transaction to acquire some locks


UPDATE projects SET budget = 25000 WHERE id = 25;
UPDATE employees SET name = 'Jeff Goldfishblum' WHERE id = 50;


-- This SELECT is only here to let you know when the transaction has completed.
SELECT 'Success' AS transaction_1_completed,
       clock_timestamp() - start_time_1.t AS duration
FROM start_time_1;
