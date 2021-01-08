/* -----------------------------------------------------------------------------
|
|    2. Advisory locks
|
|    Follow the instructions in ex2_advisory_locks.1.sql if you have not already
|    done so.
|
|    * Read the three queries below and uncomment them.
|    * Save this file and see what timing is diplayed for the two queries (as
|      the clock_timestamp column)
|    * In this file only, change the ID of the advisory lock to 101 and make a
|      note of the difference in relative time between the two result sets.
|    * In this file, add pg_try_advisory_lock(101) as a column to the final
|      SELECT statement. Save the file and see what results are output.
|    * Change the ID in pg_try_advisory_lock() in the final statement to 100.
|      See what changes in the result set because of altering this value.
|    * Add another pg_sleep between the second and third queries here, so that
|      the result of pg_try_advisory_lock changes to True. What's the smallest
|      whole number value that will consistently make pg_try_advisory_lock
|      return True?
|
*/ -----------------------------------------------------------------------------

-- SELECT pg_sleep(1);
-- SELECT pg_advisory_lock(100);
-- SELECT id, name, clock_timestamp() FROM employees WHERE id=1;


