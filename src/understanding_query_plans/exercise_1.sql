/* -----------------------------------------------------------------------------
|
|    * Read each of the commented queries below. They all start with EXPLAIN
|      so that the query plan is output rather than the query results.
|
|    * Predict which will be the most costly and which will be the least costly
|      of the three queries.
|
|    * Uncomment each query (including the EXPLAIN clause) one at a time and
|      save the file. Make a note of the overall cost of each query, and compare
|      the relative costs with your prediction.
|
*/ -----------------------------------------------------------------------------


-- EXPLAIN
-- UPDATE work_items SET status = 'completed'
-- FROM categories
-- WHERE categories.label = 'finance'
-- AND categories.id = work_items.category_id;


-- EXPLAIN
-- DELETE
-- FROM work_items
-- WHERE id IN (
--   SELECT work_items.id
--   FROM work_items subitems
--   WHERE subitems.parent_work_item_id = work_items.id
--   AND subitems.status = 'completed'
-- );


-- EXPLAIN
-- SELECT subitems.id
-- FROM work_items items
-- JOIN work_items subitems ON subitems.parent_work_item_id = items.id
-- ORDER BY subitems.parent_work_item_id;
