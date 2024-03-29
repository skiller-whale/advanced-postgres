/* -----------------------------------------------------------------------------
|
|    Follow the instructions in ex6_nowait.1.sql if you have not
|    already done so.
|
|    * Read the statements below to remind yourself how this migration works.
|
|    * Add or remove a blank line from this file and save it. Do this several
|      times, looking at the query output. Each time, only one of the
|      transactions will succeed because of a deadlock, but it is not always
|      the same one.
|
|    * Add a statement that acquires a lock with NOWAIT, so that the migration in
|      this file will always complete successfully, and consistently takes around 2
|      seconds.
|
|      You will need to think about which file the `NOWAIT` statement must be
|      added to, as well as where in the file it belongs.
|
|      Save the file and check this works.
|
|
|    * Add a NOWAIT statement in the same position in the migration you didn't
|      just change. After this neither transaction should wait for a lock.
|
|    * Run the transactions a few times to see what the behaviour is. Can you
|      explain what is happening?
|
*/ -----------------------------------------------------------------------------

SELECT clock_timestamp() AS t INTO start_time_2;

BEGIN;

UPDATE employees SET name = 'UNKNOWN' WHERE name IS NULL;
SELECT pg_sleep(2);
ALTER TABLE employees ALTER COLUMN name SET NOT NULL;

COMMIT;

-- This SELECT is only here to let you know when the transaction has completed.
SELECT clock_timestamp() - t AS duration,
       'Success' AS name_migration_completed
FROM start_time_2;
