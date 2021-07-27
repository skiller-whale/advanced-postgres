/* -----------------------------------------------------------------------------
|
|    * Uncomment the ANALYZE command below, save the file and read the query
|      plan output. (You'll need to compare the plan with another plan shortly)
|
|    * Rewrite the query so that it uses a subquery to perform the GROUP BY.
|
|    * Save the file and find the node that has reduced most in cost from the
|      initial query plan. (You should be able to scroll up in the output to
|      compare)
|
|    A third query is included at the end of this file. This is an alternative
|    that uses a CTE to retrieve the same results as the other two queries.
|
|    * Comment out the previous query (but NOT the ANALYZE command) and
|      uncomment the CTE query. Save the file then compare the output to the
|      previous two query plans.
|
*/ -----------------------------------------------------------------------------

-- TODO: Uncomment the command below first (and leave it uncommented for the
--       whole exercise)!
-- ANALYZE;

EXPLAIN ANALYZE
  SELECT
    categories.label,
    COUNT(*)
  FROM work_items
  JOIN categories ON categories.id = work_items.category_id
  GROUP BY
    categories.id;


-- TODO: Uncomment this query last!

-- EXPLAIN ANALYZE
--   WITH by_category AS (
--     SELECT
--       work_items.category_id,
--       COUNT(*)
--     FROM work_items
--     GROUP BY
--       category_id
--   )
--   SELECT
--     label,
--     count
--   FROM categories
--   JOIN by_category
--   ON categories.id =  by_category.category_id;
