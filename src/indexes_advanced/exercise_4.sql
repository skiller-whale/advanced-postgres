/* -----------------------------------------------------------------------------
|
|    * Uncomment the ANALYZE command to see the plan for the query below.
|
|    * There are four commented indexes above the query. Read through them and
|      try to predict which one will speed up the query the most.
|
|    * Uncomment all of them and save the file to see which the query planner
|      picks.
|
|    * Now predict which will be the second choice index. Comment out the
|      fastest and save the file to see which is the planner's second choice.
|
|    * (Optional) A different multicolumn index can be added that will
|      dramatically reduce the execution time of the query. Try to find this
|      additional index.
|
*/ -----------------------------------------------------------------------------

-- CREATE INDEX index1 ON work_items (created_on, project_reference);
-- CREATE INDEX index2 ON work_items (created_on) INCLUDE (project_reference);
-- CREATE INDEX index3 ON work_items (project_reference, created_on);
-- CREATE INDEX index4 ON work_items (project_reference) INCLUDE (created_on);

-- ANALYZE;

EXPLAIN ANALYZE
  SELECT subitems.created_on, subitems.project_reference
  FROM work_items items
  JOIN work_items subitems ON subitems.parent_work_item_id = items.id
  WHERE items.created_on BETWEEN '2020-01-04' AND '2020-09-20'
  AND items.project_reference IN ('1128', '1434', '1690');
