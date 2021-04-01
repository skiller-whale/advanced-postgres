--
-- This function is used in the exercise to force the query within the
-- materialized view to run slowly. You do not need to modify this function
-- nor understand how it works.
--
CREATE FUNCTION go_slow(sleep_for int)
RETURNS INT AS $$ BEGIN PERFORM pg_sleep(sleep_for); RETURN sleep_for; END $$
LANGUAGE plpgsql;

/* -----------------------------------------------------------------------------
|
|  1. Drawbacks of refreshing
|
|  The script below creates a materialized view that is slow to create (~3s), and
|  then performs a few other actions.
|
|  * Read the statements below. Uncomment the SELECT query at the end and save
|    the file.
|
|  * Add a REFRESH statement so that the output from this file shows the updated
|    data. Take a look at the query output from both files and note what has
|    changed after adding the REFRESH.
|
*/ -----------------------------------------------------------------------------

SELECT clock_timestamp() AS t INTO mv_start_time;

-- The query wrapped by this materialized view takes roughly 3 seconds to
-- complete (the go_slow function takes 1 second to run and is called once for
-- each of the three rows returned by the query)
CREATE MATERIALIZED VIEW top_three_companies as
  SELECT
    id,
    companies.name,
    go_slow(1)
  FROM companies
  ORDER BY companies.id
  LIMIT 3;
COMMIT;

UPDATE companies SET name = 'Plaicebook' WHERE id = 2;

-- SELECT
--   name,
--   id,
--   (SELECT clock_timestamp() - mv_start_time.t AS mv_time FROM mv_start_time)
-- FROM top_three_companies;


/* -----------------------------------------------------------------------------
|
|  2. Refreshing without blocking using CONCURRENTLY
|
|  * Modify the REFRESH statement from the previous exercise so that the SELECT
|    in the other script completes in well under 1 second.
|
|  * Check that the output includes the updated data and answer the question in
|    the Skiller Whale app.
|
*/ -----------------------------------------------------------------------------
