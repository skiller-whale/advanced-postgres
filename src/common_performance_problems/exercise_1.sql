/* -----------------------------------------------------------------------------
|
|    * Uncomment the ANALYZE; command and save the file. Make a note of the
|      overall cost and execution time for reference in the following tasks.
|
|    * Add LIMIT 1500 to the query. Have a guess at what the effect on the
|      overall cost and execution time will be, then save the file.
|
|    * Try to predict how the cost and the execution timing will change by
|      changing the LIMIT to each of the following values. Change the value to
|      each then save the file and see if the output matches your expectations.
|       * LIMIT 2500
|       * LIMIT 10
|
|    * Try to predict how ordering by created_on will change the query plan for
|      LIMIT 10. Add ORDER BY created_on DESC to the query, save the file and
|      see whether the output matches your prediction.
|
*/ -----------------------------------------------------------------------------

-- ANALYZE;

EXPLAIN ANALYZE
  SELECT *
  FROM work_items
  WHERE created_on BETWEEN '2019-08-01' AND '2019-09-01';
