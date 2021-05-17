/* -----------------------------------------------------------------------------
|
|    * Add the ANALYZE parameter to EXPLAIN in the query below, then save the
|      file.
|
|    * Read through the expanded query plan. In particular, notice the
|      difference between the estimated and actual number of rows returned.
|
|    * Uncomment the ANALYZE; command at the top, and save the file again.
|      What is the difference between estimated and actual rows now?
|
*/ -----------------------------------------------------------------------------

-- ANALYZE;

EXPLAIN
SELECT items.id, items.project_reference, categories.label
FROM work_items items
JOIN work_items subitems ON subitems.parent_work_item_id = items.id
JOIN categories ON categories.id = subitems.category_id
WHERE items.created_on > '2021-06-01'
ORDER BY subitems.parent_work_item_id
