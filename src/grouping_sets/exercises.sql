/* -----------------------------------------------------------------------------
|
|    1. Grouping by more than one column
|
|    * Uncomment the query below, save this file, and have a look at the output.
|
|    * Use a UNION ALL to add the results from another SELECT ... GROUP BY
|      statement that returns the number of albums, and average minutes
|      grouped by n_tracks.
|      This SELECT must return the same set of columns for UNION to work.
|
|    * Use UNION ALL to add a third statement that returns the count and
|       average minutes across all albums in the table.
|
*/ -----------------------------------------------------------------------------

-- TODO uncomment the code below!

-- SELECT
--   genre,
--   NULL AS n_tracks,
--   COUNT(id),
--   AVG(minutes) AS avg_minutes
-- FROM albums
-- GROUP BY genre;



/* -----------------------------------------------------------------------------
|
|  2. Using GROUPING SETS to include several groupings in a result set
|
|  * Write a query that uses GROUPING SETS to include the same groupings as the
|    first two selects in the previous task, i.e. grouping by genre and by
|    n_tracks but without the overall totals.
|
|  * Check that the results look the same as for the UNION version of the query
|    (except without the row including aggregates across all rows).
|
*/ -----------------------------------------------------------------------------

-- TODO write your GROUPING SETS query here!

/* -----------------------------------------------------------------------------
|
|  3. The empty set
|
|  * Copy the GROUPING SETS query from the previous exercise, and paste it below.
|
|  * Add a third grouping set to calculate the total number of rows in the
|    albums table (i.e. without any groupings)
|
|  * Modify the query to include:
|
|       1. another grouping set that groups by record_label.
|       2. another aggregate in the SELECT list for the MAX of albums.minutes.
|
|    You should see the new grouping set included in the result set, and the
|    new aggregate should be present for all grouping sets.
|
*/ -----------------------------------------------------------------------------

-- TODO write your code here!


/* -----------------------------------------------------------------------------
|
|  4. Ordering results
|
|  * Modify the previous query to include a new grouping set:
|    (record_label, genre)
|
|  * Order the results by record_label.  (You might also want to add to the
|    SELECT columns so that record_label is the first column followed by genre.)
|
|  * Add to the ORDER BY so that each of the genre and n_tracks grouping sets
|    are sorted by avg_minutes descending. Also make sure that the empty
|    grouping set is in the last row.
|
*/ -----------------------------------------------------------------------------



/* -----------------------------------------------------------------------------
|
|  5. Joining tables for grouping sets
|
|  * Read the query below, uncomment it, and look at the output.
|
|    Make sure you understand how the artists and sales tables are joined to
|    albums. The selected columns will be used in the following tasks.
|
|  * Modify / replace this query, so your results include aggregate values for:
|        1. The number of sales (COUNT)
|        2. The total value of sales with SUM(amount)
|
|     grouped by:
|        1. record_label and artists.name
|        2. record_label and genre
|        3. the empty set
|
|  * Reorder the results so that it is easy to answer the following questions:
|    (use different orders for each as you see fit)
|
|        1. What is the most profitable genre for Island? Who produced albums of
|           this genre for Island (you can work this out from the query without
|           adding another grouping)?
|        2. Has Salmon and Garfunkel, or sole music sold more albums for Atlantic?
|        3. Has sole music has been more profitable for Island or Atlantic?
|
*/ -----------------------------------------------------------------------------

-- SELECT
--   record_label,
--   artists.name,
--   sales.id,
--   sales.amount
-- FROM albums
-- JOIN artists ON artists.id = albums.artist_id
-- LEFT JOIN sales ON sales.album_id = albums.id
-- LIMIT 15;



/* -----------------------------------------------------------------------------
|
|  6. Grouping with expressions
|
|  The query below uses CASE expressions to categorise sales price as cheap
|  or expensive based on sales.amount (the price_indicator), and albums as
|  short or long based on albums.n_tracks (the album_type).
|
|  * Use the query below as a starting point to write a new query that includes
|     these two grouping sets:
|       1. (record_label, album_type, price_indicator)
|       2. (genre, price_indicator)
|
|     and for each grouping calculates these aggregates:
|       1. The total number of sales in that category.
|       2. The total (SUM) of the sales value in that category.
|       3. The number of albums with sales in that category: COUNT(DISTINCT(albums.id))
|
|  * Use the results to answer the questions in the Skiller Whale app. You might
|    find it useful to reorder the result to find the answers, although this is
|    up to you.
|
*/ -----------------------------------------------------------------------------

-- SELECT
--   record_label,
--   genre,
--   CASE WHEN n_tracks < 9 THEN 'short' WHEN n_tracks >= 9 THEN 'long' ELSE NULL END AS album_type,
--   CASE WHEN sales.amount <= 13.0 THEN 'cheap' WHEN sales.amount > 13.0 THEN 'expensive' ELSE NULL END AS price_indicator
-- FROM albums
-- LEFT JOIN sales ON sales.album_id = albums.id
-- LIMIT 20;
