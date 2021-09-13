/* -----------------------------------------------------------------------------
|
|    1. Identifying indexes in a query plan
|
|    * Add EXPLAIN to the query below so that the query plan is output for the
|      query.
|
|    * Read the query plan to identify the scans in the plan.
|
|    * There is a second query underneath the first. Uncomment it to output its
|      query plan.
|
|    * Read this second query plan to identify the scans.
|
*/ -----------------------------------------------------------------------------

SELECT *
FROM work_items
JOIN projects ON projects.reference = work_items.project_reference
WHERE projects.id = 12;

-- EXPLAIN
--   SELECT *
--   FROM work_items items
--   JOIN work_items subitems on items.id = subitems.parent_work_item_id
--   WHERE items.id = 1211;

/* -----------------------------------------------------------------------------
|
|    2. Listing indexes
|
|    * First, open exercises.2.sql and follow the instructions there.
|
|    * Change EXPLAIN to EXPLAIN ANALYZE in the second query above and save this
|      file. The output will now include the query plan along with
|      pg_stat_user_indexes (from the other file).
|
|    * Read the output of pg_stat_user_indexes to see what indexes exist and
|      confirm that they were used by the query.
|
|    * Uncomment the query below and adjust the filter so that only those
|      indexes included in the previous task are output from pg_indexes.
|
*/ -----------------------------------------------------------------------------

-- SELECT * FROM pg_indexes WHERE schemaname <> '';

/* -----------------------------------------------------------------------------
|
|    3. Creating an index
|
|    * Comment out the pg_indexes query above and save the file, then read
|      through the query plan for the previous query and decide which column in
|      work_items will most likely benefit from an index.
|
|    * Add a command to create the index you decide on before the queries in
|      this file.
|
|    * Save the file and check the query plan to see if the query is executed
|      faster. Also check the output from pg_stat_user_indexes to verify that
|      the index has been created and used.
|
*/ -----------------------------------------------------------------------------


/* -----------------------------------------------------------------------------
|
|    4. Examining index usage
|
|    * Add an ANALYZE command to the start of this file (before any other SQL
|      command).
|
|    * Comment out the second query so that the file outputs the query plan for
|      the first SELECT. Make a note of the scans chosen by the query planner.
|
|    * Remove ANALYZE and save the file. Compare the query plan with the one
|      output in the previous step.
|
*/ -----------------------------------------------------------------------------


/* -----------------------------------------------------------------------------
|
|    5. Index-only scans
|
|    * Make sure that ANALYZE is run at the start of this file.
|
|    * Read the query below, uncomment it and save the file.
|
|    * Create an index that results in the query planner choosing an index-only
|      scan for the query.
|
*/ -----------------------------------------------------------------------------

-- EXPLAIN ANALYZE
--   SELECT work_items.created_on, work_items.status
--   FROM work_items
--   JOIN projects ON projects.reference = work_items.project_reference
--   WHERE projects.id IN (9,10,11,12);


/* -----------------------------------------------------------------------------
|
|    6. Uniqueness
|
|    * Read and uncomment the query below. Save the file and read the query plan
|      output.
|
|    * Create a unique index that will also allow Postgres to use an index-only scan to
|      execute the query.
|
|    * Uncomment the UPDATE statement below the query to verify that the
|      index is enforcing uniqueness on the uuid column. (You should see an
|      error output by the UPDATE statement.)
|
*/ -----------------------------------------------------------------------------

-- Uncomment this query first

-- EXPLAIN ANALYZE
--   SELECT identifier, version
--   FROM documents
--   WHERE uuid = '97fcf62e-2c51-4c54-bde2-668d65eeebb7';

-- Uncomment this UPDATE to verify the unique index you have created

-- UPDATE documents
-- SET uuid = '97fcf62e-2c51-4c54-bde2-668d65eeebb7'
-- WHERE id = 1 ;
