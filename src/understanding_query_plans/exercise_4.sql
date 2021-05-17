/* -----------------------------------------------------------------------------
|
|    * Read the two DELETE queries below. Predict whether they will produce the
|      same query plan, or if one will be less costly (and which one that is).
|
|    * Uncomment the ANALYZE command, save the file, and make a note of the cost
|      of the query plan in the output.
|
|    * Comment the first DELETE query and uncomment the second. Save the file and
|      see whether your prediction was correct.
|
*/ -----------------------------------------------------------------------------

-- ANALYZE;

EXPLAIN
DELETE
FROM work_items
USING work_items subitems
WHERE subitems.parent_work_item_id = work_items.id
  AND subitems.status = 'complete';


-- EXPLAIN
-- DELETE
-- FROM work_items
-- WHERE id IN (
--   SELECT work_items.id
--   FROM work_items subitems
--   WHERE subitems.parent_work_item_id = work_items.id
--   AND subitems.status = 'complete'
-- );
