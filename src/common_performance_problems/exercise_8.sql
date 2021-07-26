/* -----------------------------------------------------------------------------
|
|    * Uncomment the ANALYZE command and save the file (it might take several
|      seconds to complete).
|
|    * Make a note of the total cost of the query plan and the execution
|      time. Also, look at the loops that are output in the query plan.
|
|    * Try replacing the WHERE clause with the following, one at a time. Before
|      each one, try to predict roughly how long the query will take and how
|      many loops will be used in the query plan.
|
|       * BETWEEN 4000 AND 4500
|       * BETWEEN 4000 AND 5000
|
|    * Rewrite the query as a nested query that is not a correlated subquery.
|      (There are hints at the bottom of this file but try to write the query
|      without using them)
|
|    * Try to predict what the difference in timing will be before you run the
|      query.
|
*/ -----------------------------------------------------------------------------

-- ANALYZE;

EXPLAIN ANALYZE
  SELECT
    items.id,
    (SELECT COUNT(subitems.id)
      FROM work_items AS subitems
      WHERE subitems.parent_work_item_id = items.id
    ) AS num_subitems
  FROM work_items items
  WHERE id BETWEEN 4000 AND 4250;

-- TODO: Write your nested query here!






/* -----------------------------------------------------------------------------
|
|   You can use the following hints to help you rewrite the query if you need
|   them.
|
|      The nested query will:
|        * SELECT FROM work_items AS subitems
|        * GROUP BY subitems.parent_work_item_id
|        * Return subitems.parent_work_item_id and COUNT(*)
|
|      The outer query will:
|        * SELECT FROM work_items.
|        * LEFT JOIN to the nested query on work_items.id =
|            nested_query.parent_work_item_id
|        * Filter on work_items.id BETWEEN 4000 AND 5000
|        * Return work_items.id and the nested_query.count
|
*/ -----------------------------------------------------------------------------
