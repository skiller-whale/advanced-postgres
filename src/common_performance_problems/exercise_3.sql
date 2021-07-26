/* -----------------------------------------------------------------------------
|
|    * Uncomment the ANALYZE command, save the file and look at the query
|      plan output.
|
|    * Make a note of the query plan cost and the execution time of the
|      query plan.
|
|    * Predict which of these ORDER BY clauses will result in a faster execution
|      time when added to the query:
|         * ORDER BY subitems.project_reference
|         * ORDER BY subitems.parent_work_item_id
|
|    * Try each of the two ORDER BY clauses to see if your prediction was
|      correct.
|
*/ -----------------------------------------------------------------------------

CREATE INDEX ON work_items (parent_work_item_id);
CREATE INDEX ON work_items (project_reference);

-- ANALYZE;

EXPLAIN ANALYZE
  SELECT items.created_on, subitems.id, subitems.project_reference
  FROM work_items items
  JOIN work_items subitems ON subitems.parent_work_item_id = items.id;
