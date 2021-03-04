/* -----------------------------------------------------------------------------

    This file has a few example queries that you can uncomment to
    quickly explore the database you'll be working with.

    Each time you save this file, you will see the result of the LAST query
    in this file in the terminal window where you ran docker-compose up.

    When you have more than one uncommented query you'll need to add a
    semicolon (;) after each one.

*/ -----------------------------------------------------------------------------

-- Uncomment this query to get an overview of the albums and artists tables.

-- SELECT *
-- FROM albums
-- JOIN artists ON artists.id = albums.artist_id
-- LIMIT 15;

-- Uncomment this query to get an overview of the sales table.

-- SELECT *
-- FROM sales
-- LIMIT 15;

-- Uncomment this query for a grouping sets refresher

-- SELECT
--   record_label,
--   artists.name,
--   COUNT(sales.id) AS sales_count,
--   SUM(sales.amount) AS total_value
-- FROM albums
-- JOIN artists ON artists.id = albums.artist_id
-- LEFT JOIN sales ON sales.album_id = albums.id
-- GROUP BY
--   GROUPING SETS (
--     (record_label, artists.name),
--     (record_label),
--     ()
--   )
-- ORDER BY
--   record_label,
--   artists.name IS NULL,
--   sales_count DESC;
