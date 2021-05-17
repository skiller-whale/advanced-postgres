/* -----------------------------------------------------------------------------
|
|    * Read the query below and try to predict what types of node might be used
|      in the query plan (e.g. how many scans, joins, sorts etc).
|
|    * Uncomment the ANALYZE command, save the file and see whether you were
|      correct about the structure of the plan.
|
|    * Try to predict how removing the ORDER BY clause will change the nodes.
|      Remove that clause then save the file to see whether you were correct.
|
|    * Additionally remove the WHERE clause, and save the file again.
|      Other than the Filter condition being removed, what changes do you see
|      in the query plan? Can you explain these changes?
|
*/ -----------------------------------------------------------------------------

-- ANALYZE;

EXPLAIN
SELECT items.project_reference, categories.label
FROM work_items items
JOIN work_items subitems ON subitems.parent_work_item_id = items.id
JOIN categories ON categories.id = subitems.category_id
WHERE subitems.created_on = '2022-01-08'
ORDER BY subitems.parent_work_item_id;
