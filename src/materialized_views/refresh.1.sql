/* -----------------------------------------------------------------------------
|
|  1. Drawbacks of refreshing
|
|  This exercise involves two files; this one and refresh.2.sql. You
|  need to follow the instructions in both files. When you save either file,
|  both are executed and you will see their output. Start with the instructions
|  in this file first.
|
|  This file contains a SELECT statement that uses a materialized view created
|  in refresh.2.sql (called top_three_companies).
|  The sleep command is included to make sure that view has been created before
|  the SELECT is run.
|
|  The query output also includes a column that displays how long this script
|  took to complete. Don't worry if you don't understand how this works.
|
|    * Uncomment the SELECT pg_sleep statement, and save the file.
|    * Note the total_time it takes for the SELECT statement to complete.
|    * Open refresh.2.sql and follow the instructions in that file.
|
*/ -----------------------------------------------------------------------------

-- SELECT pg_sleep(3.5);  -- Ensure that the view has been created in refresh.2.sql

SELECT clock_timestamp() AS t INTO start_time;

SELECT
  name,
  id,
  (SELECT clock_timestamp() - start_time.t AS total_time FROM start_time)
FROM top_three_companies
WHERE id = 2;


/* -----------------------------------------------------------------------------
|
|    3. Multiple Concurrent Refreshes
|
|    * Between the second and third SELECT statements in this file (line 26),
|      add the following update statement:
|          UPDATE companies SET name = 'Twitturbot' WHERE id = 2;
|
|    * Copy the REFRESH CONCURRENTLY command from refresh.2.sql to immediately
|      after the UPDATE statement you just added in this file.
|
|    * Answer the question in the Skiller Whale app.
|
*/ -----------------------------------------------------------------------------
