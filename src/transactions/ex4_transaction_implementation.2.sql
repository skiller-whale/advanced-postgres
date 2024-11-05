/* -----------------------------------------------------------------------------
|
|    4. Transaction Implementation
|
|    * Read and uncomment the queries below, one at a time.
|
|    * Add a line of code *after* the INSERT in the *other* file which wouldn't
|      change the number of rows returned by SELECT * FROM categories; but would
|      change the number of rows returned by get_raw_page.
|
*/ -----------------------------------------------------------------------------

create extension pageinspect;

SELECT pg_sleep(1);

-- -- TODO: your new code goes here

-- SELECT * FROM categories;

-- -- This shows all versions of each row stored on disk.
-- -- It includes the xmin, xmax, the stored values in each row.
-- -- It only displays xmax when it corresponds to a committed deletion transaction.

-- -- How many rows do you expect to see here? Why?

-- SELECT t_xmin,
--        CASE
--          WHEN t_infomask & 1024 = 1024
--            -- t_xmax is an xid, which can't be converted directly to an integer
--            THEN t_xmax::varchar::int
--          ELSE
--            0
--        END AS t_xmax,
--        get_byte(t_attrs[1], 0) AS id,
--        convert_from(t_attrs[2], 'unicode') AS label
-- FROM heap_page_item_attrs(get_raw_page('categories', 0), 'categories'::regclass, true);
