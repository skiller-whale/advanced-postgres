/* -----------------------------------------------------------------------------
|
|    3. Deadlocks
|
|    Follow the instructions in ex3_deadlocks.1.sql if you have not already done
|    so.
|
|    * Look at the code in this file. What do you expect to happen when this
|      code and the code in ex3_deadlocks.1.sql run at the same time?
|    * Uncomment the lines below and see what happens when you try it.
|    * Fix the deadlock by adjusting the pg_advisory_lock statements only, based
|      on what you've just learnt about how to avoid deadlocks. The UPDATE and
|      pg_sleep(3) must remain between the two pg_advisory_lock statements.
|    * How many seconds does it take for both files to finish running now,
|      and why?
|    * Introduce a pg_advisory_unlock statement that uses ID 200 to make both
|      of the files finish running at roughly the same time.
|
*/ -----------------------------------------------------------------------------


-- SELECT pg_advisory_lock(201);
-- UPDATE employees SET name='Eelton John' WHERE id=2;
-- SELECT pg_sleep(3);
-- SELECT pg_advisory_lock(200);
--
-- SELECT id, name, clock_timestamp() FROM employees WHERE id=2;
