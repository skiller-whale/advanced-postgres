/* -----------------------------------------------------------------------------
|
|    * Uncomment the ANALYZE command then save the file and wait for the query
|      to run.
|
|    * Note the overall query plan cost, the _actual_ number of rows returned,
|      and the overall execution time for the query.
|
|    * By looking at the query plan, try to guess what the overall cost would
|      be if the query used a UNION ALL instead of a UNION.
|
|    * Replace the UNION clause with UNION ALL then save the file and wait for
|      the query to run.
|
|    * Look at the overall cost of the query. Did it match your guess?
|
*/ -----------------------------------------------------------------------------

-- ANALYZE;

EXPLAIN ANALYZE
  SELECT projects.budget,
    work_items.id,
    categories.label
  FROM work_items
  JOIN projects ON projects.reference = work_items.project_reference
  JOIN categories ON work_items.category_id = categories.id

  UNION

  SELECT projects.budget,
    subitems.id,
    categories.label
  FROM work_items
  JOIN projects ON projects.reference = work_items.project_reference
  JOIN work_items subitems ON work_items.id = subitems.parent_work_item_id
  JOIN categories ON subitems.category_id = categories.id;
