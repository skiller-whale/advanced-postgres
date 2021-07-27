/* -----------------------------------------------------------------------------
|
|    * Uncomment the ANALYZE command, save the file and look at the output.
|
|    * Make a note of the total cost of the plan that is output. What do you
|      expect to happen to the query plan when an index is created on the
|      project_reference column?
|
|    * Uncomment the CREATE INDEX command, save the file and look at the output.
|      Did the query plan match your expectations?
|
|    * Adjust the casting in the `WHERE` clause so that the query planner can
|      use the index.
|
*/ -----------------------------------------------------------------------------

-- Uncomment this second!
-- CREATE INDEX work_items_project_reference_idx ON work_items (project_reference);

-- Uncomment this first!
-- ANALYZE;

EXPLAIN
  SELECT
    work_items.id,
    categories.label
  FROM work_items
  JOIN work_items subitems ON work_items.id = subitems.parent_work_item_id
  JOIN categories ON subitems.category_id = categories.id
  WHERE
    -- project_reference is a VARCHAR, being cast to an INT for this
    -- filter
    work_items.project_reference::INT = 1859

