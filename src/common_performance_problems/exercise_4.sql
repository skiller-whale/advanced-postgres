/* -----------------------------------------------------------------------------
|
|   * Uncomment the ANALYZE command, save the file and read the query plan
|     output.
|
|   * Make a note of the query cost and the expected number of rows returned.
|
|   * Remove the DISTINCT keyword and save the file.
|
|   * Make a note of query cost and total rows returned
|
|   * Add the DISTINCT keyword back to the query, then replace EXPLAIN with
|     EXPLAIN ANALYZE and repeat the steps above.
|
*/ -----------------------------------------------------------------------------

-- ANALYZE;

EXPLAIN
  SELECT DISTINCT items.id, subitems.id
  FROM work_items items
  JOIN work_items subitems ON subitems.parent_work_item_id = items.id;
