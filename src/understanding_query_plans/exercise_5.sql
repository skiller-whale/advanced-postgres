/* -----------------------------------------------------------------------------
|
|    * Read the query below then uncomment the ANALYZE; command and save the file.
|
|    * Read through the query plan to understand the nodes chosen for the
query.
|
|    * Add the following filter to the query, then save the file and compare the
|      new query plan to the previous query plan.
|       * items.created_on > '2019-06-01'
|
|    * Change the date filter to the following (inverting the operator), save the
|      file and compare the output to the previous query plans.
|       * items.created_on < '2019-06-01'
|
*/ -----------------------------------------------------------------------------

-- ANALYZE;

EXPLAIN
SELECT items.id, items.project_reference, categories.label
FROM work_items items
JOIN work_items subitems ON subitems.parent_work_item_id = items.id
JOIN categories ON categories.id = subitems.category_id
ORDER BY subitems.parent_work_item_id
