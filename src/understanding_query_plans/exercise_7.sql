/* -----------------------------------------------------------------------------
|
|    * Uncomment the ANALYZE; command then save the file and note down the count
|      of work_items returned by the final SELECT query.
|
|    * What do you expect to happen if you add the ANALYZE parameter to the main
|      query?
|
|    * Add the parameter then save the file to see if you are correct.
|
|    * Add a ROLLBACK to this file so that the EXPLAIN command does not produce
|      any side effects.
|
*/ -----------------------------------------------------------------------------

-- ANALYZE;

EXPLAIN
DELETE FROM work_items
USING categories
WHERE categories.id = work_items.category_id
AND work_items.parent_work_item_id is not null
AND categories.label = 'development'
AND work_items.id < 3000;

SELECT COUNT(*) FROM work_items;
