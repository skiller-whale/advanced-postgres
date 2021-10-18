/* -----------------------------------------------------------------------------
|
|    * Uncomment the EXPLAIN ANALYZE command and save the file. Make a note of
|      the total cost and execution time from the query plan.
|
|    * Create an index that will reduce the execution speed of the query.
|
|    * The query plan will (probably) not use an index scan if you only added
|      a CREATE INDEX statement. Think about why this is and add a command that
|      ensures Postgres will have up-to-date information about the index.
|
|    * Change the filter to the following and save the file:
|       * identifier || '-' || version || '.txt' = '12536-2.txt'
|
|    * Adjust the index so that the query can use it.
|
*/ -----------------------------------------------------------------------------

-- EXPLAIN ANALYZE
  SELECT project_reference
  FROM documents
  WHERE date_part('month', created_on) = 5;
