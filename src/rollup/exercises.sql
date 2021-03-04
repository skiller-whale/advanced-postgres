/* -----------------------------------------------------------------------------
|
|    1. Hierarchical data in grouping sets
|
|    * Read and uncomment the query below, then save the file and look at the
|      output.
|
|    * Extend the query to output each level of the following groupings
|      hierarchy, including the empty set:
|
|          (artists.name, record_label, title)
|
*/ -----------------------------------------------------------------------------

-- SELECT
--   COUNT(sales.id),
--   SUM(sales.amount)
-- FROM albums
-- JOIN artists ON artists.id = albums.artist_id
-- LEFT JOIN sales ON albums.id = sales.album_id
-- GROUP BY
--   GROUPING SETS (
--     ()
--   );


/* -----------------------------------------------------------------------------
|
|    2. Rollup
|
|    * Modify the query in the previous exercise to use the ROLLUP clause
|      instead of explicit grouping sets.
|
*/ -----------------------------------------------------------------------------


/* -----------------------------------------------------------------------------
|
|    3. Reporting time periods using ROLLUP
|
|    The EXTRACT function is a Postgres function used to extract a specific part
|    of a TIMESTAMP value or field. The syntax is:
|
|        EXTRACT(date_part FROM timestamp_field)
|
|    You can use year, quarter and month as date_part parameters to extract the
|    fields you need for this exercise.
|
|    * Modify the query below to ROLLUP year, quarter and month from the
|      sales.date field. Keep the two aggregates in the SELECT (for number of
|      sales and total revenue)
|
|    * Make sure that the query displays the three date_part columns. Add
|      aliases to each expression in the SELECT, so that the report has distinct
|      column names.
|
|    * Add ORDER BY clauses to match the date hierarchy.
|
*/ -----------------------------------------------------------------------------

-- SELECT
--   sales.date,
--   COUNT(sales.id),
--   SUM(sales.amount)
-- FROM sales
-- GROUP BY sales.date;

/* -----------------------------------------------------------------------------
|
|    4. Sub-lists in a rollup
|
|    * Write a rollup query that includes
|        1. (albums.genre, albums.record_label) as a sub-list
|        2. albums.title
|
|      and aggregates for:
|        1. COUNT(sales.id)
|        2. SUM(sales.amount)
|
|      (you can copy the query you wrote for exercise 2. as a starting point)
|
|    * Add ORDER BY clauses that order by the following, making sure the SELECT
|      fields also follow this order too:
|        1. genre
|        2. record_label
|        3. title IS NULL
|        4. SUM(sales.amount) DESC NULLS LAST
|
|    * Try swapping genre and record_label in the ORDER BY and SELECT. Do you
|      think the output still makes sense as a hierarchical report?
|
|    * Now try swapping record_label and title in the ORDER BY and SELECT. Do
|      you think this output makes sense as a hierarchical report? Why or why
|      not?
|
*/ -----------------------------------------------------------------------------

-- TODO: Write your ROLLUP query here!

/* -----------------------------------------------------------------------------
|
|    5. Partial rollup
|
|    * Read and uncomment the query below, then save the file and look at the
|      output.
|
|    * Include the following two fields in the SELECT list, using the EXTRACT
|      function.
|        1. Year from albums.release_date.
|        2. Quarter from albums.release_date.
|
|    * Use the two expressions to create a partial ROLLUP. 
|
|    * Order by these two expressions at the end of the ORDER BY clause.
|
|    * Add the following JOIN:
|        JOIN artists ON artists.id = albums.artist_id
|
|      and replace the genre grouping with grouping sets of
|        1. (genre, record_label)
|        2. artists.name
|
|      Update the SELECT and ORDER BY so that the artists.name grouping is
|      also displayed hierarchically by year and quarter.
|
*/ -----------------------------------------------------------------------------

-- SELECT
--   genre,
--   COUNT(sales.id) AS sales_to_date
-- FROM albums
-- LEFT JOIN sales ON albums.id = sales.album_id
-- GROUP BY genre
-- ORDER BY genre;
