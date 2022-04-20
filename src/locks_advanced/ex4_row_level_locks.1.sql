/* -----------------------------------------------------------------------------
|
|    * Without editing any code, read the query below, and make sure you
|      understand what is happening in the two UPDATE steps.
|
|    * Follow the instructions in ex4_row_level_locks.2.sql.
|
*/ -----------------------------------------------------------------------------

SELECT clock_timestamp() AS t INTO start_time_1;

BEGIN;

UPDATE projects SET owner_id = 100 WHERE id = 4;
UPDATE projects SET owner_id = 90 WHERE id = 4;

SELECT pg_sleep(3);

COMMIT;

-- This SELECT is only here to let you know when the transaction has completed.
SELECT clock_timestamp() - start_time_1.t AS transaction_1_duration
FROM start_time_1;
