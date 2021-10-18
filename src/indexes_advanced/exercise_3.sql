/* -----------------------------------------------------------------------------
|
|    * Read the query and uncomment the ANALYZE command.
|
|    * Read the query plan and add a single-column index to improve the speed of
|      the query.
|
|    * Add `AND active = true` to the `WHERE` clause of the query. Save the file
|      and check the query plan.
|
|    * Retrieving the active version of a document is likely to be a common operation,
|      so adjust the index so that it is better suited to the new query using
|      a partial index. Check the query plan to make sure the index is being used.
|
|    * Make the index enforce uniqueness so that there can only be one "active" row
|      for each value of `identifier`.
|      Provide a name for the index so that it can be easily referenced.
|
|    * Write an update statement to verify the unique index is working. (E.g.
|      you could update all documents with identifier = '17709' to be active)
|
*/ -----------------------------------------------------------------------------

-- ANALYZE;

EXPLAIN ANALYZE
  SELECT *
  FROM documents
  WHERE identifier = '17709';
