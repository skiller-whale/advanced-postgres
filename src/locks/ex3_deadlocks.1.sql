/* -----------------------------------------------------------------------------
|
|    3. Deadlocks
|
|    * Read the six lines of SQL below and understand what they are doing, then
|    uncomment them.
|    * Switch to ex3_deadlocks.2.sql and follow the instructions there.
|
*/ -----------------------------------------------------------------------------

-- SELECT pg_sleep(1);
-- SELECT pg_advisory_lock(200);
-- UPDATE employees SET name='George Orwhale' WHERE id=1;
-- SELECT pg_sleep(2);
-- SELECT pg_advisory_lock(201);
-- 
-- SELECT id, name, clock_timestamp() FROM employees WHERE id=1;
