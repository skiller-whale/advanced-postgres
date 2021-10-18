/* -----------------------------------------------------------------------------
|
|    * Uncomment the ANALYZE command and save the file. Make a note of the
|      total estimated cost and the execution time of the query plan.
|
|    * Create an index on documents.identifier then save the file and note what
|      difference this makes to the query plan.
|
|    * Adjust the index by incorporating documents.version so that the index is
|      used to produce a much faster query plan.
|
*/ -----------------------------------------------------------------------------

-- ANALYZE;

EXPLAIN ANALYZE
  SELECT *
  FROM documents
  ORDER BY documents.identifier, version DESC
  LIMIT 3;
