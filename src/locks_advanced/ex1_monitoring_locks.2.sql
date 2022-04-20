/* -----------------------------------------------------------------------------
|
|    Follow the instructions in ex1_monitoring_locks.1.sql first.
|
|    * Follow each of the four steps below. After each step, save this file and
|      take a look at the table of currently held locks, which is selected in
|      the other transaction.
|
|      In particular, look at the row count for that query. You should see that
|      each change results in more locks being held.
|
|        1. Uncomment the line with pg_sleep(2) at the bottom of this file.
|        2. Uncomment the line with SELECT * FROM employees ...
|        3. Uncomment the line with SELECT pg_advisory_lock(100)
|        4. Uncomment the line with UPDATE employees SET ...
|        5. Uncomment the line with UPDATE projects SET ...
|
|      Which statement adds the most new locks?
|
*/ -----------------------------------------------------------------------------

BEGIN;

-- SELECT * FROM employees WHERE id = 1;
-- SELECT pg_advisory_lock(100);
-- UPDATE employees SET name = 'George Orwhale' WHERE id = 1;
-- UPDATE projects SET owner_id = 60 where id = 1;
-- SELECT pg_sleep(2);  -- Ensure this transaction completes after the other one

COMMIT;
