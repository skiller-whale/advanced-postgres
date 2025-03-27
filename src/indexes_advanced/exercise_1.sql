/* -----------------------------------------------------------------------------
|
|    Bitmap Scans
|
|    The exercise includes a WHERE clause with multiple conditions.
|
|    * Uncomment the ANALYZE command below and save the file. Read the output and
|      think about what indexes might improve the query.
|
|    * Add indexes to three different columns on the `work_items` table and see how the query plan changes.
|
|    * Make a note (1) of the type of scan being used on the `work_items` table.
|
|    * Change the `AND` in the `WHERE` clause to an `OR` (on the line before the `created_on BETWEEN...` condition)
|
|    * What kind of scan is being used on `work_items` now (2)?
|
|    * Change the condition `projects.reference = '1128'` to instead refer to `work_items.project_reference`.
|
|    * What kind of scan is being used now (3)?
|
|    * Answer the question in the Skiller Whale page.
|
*/ -----------------------------------------------------------------------------

CREATE INDEX ON projects (reference);

-- Add indexes here!

-- Uncomment me!
-- ANALYZE;

EXPLAIN ANALYZE
  SELECT *
  FROM work_items items
  INNER JOIN projects ON projects.reference = items.project_reference
  WHERE
  (
    projects.reference = '1128'
    OR
    items.parent_work_item_id BETWEEN 5000 AND 5500
  )
  AND
  created_on BETWEEN '2019-02-21' AND '2019-06-30';
