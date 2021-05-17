/* -----------------------------------------------------------------------------
|
|    * Read the query below then uncomment the ANALYZE; command and save the file.
|
|    * Read the query plan output to understand the relative costs of the
|      different nodes for the query.
|
*/ -----------------------------------------------------------------------------
-- ANALYZE;

EXPLAIN
SELECT items.project_reference, categories.label
FROM work_items items
JOIN work_items subitems ON subitems.parent_work_item_id = items.id
JOIN categories ON categories.id = subitems.category_id
WHERE subitems.status = 'complete'
ORDER BY subitems.parent_work_item_id
