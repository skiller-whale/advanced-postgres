/* -----------------------------------------------------------------------------
|
|    1. Grouping with all possible sets
|
|    * Extend the query below to include all combinations of these three
|      columns in addition to the empty set:
|        * nationality
|        * membership_status
|        * the 10-year age range, as already expressed in the query.
|          (the age column is an integer, so `/` rounds down to an integer)
|
|    Note that the SELECT statement formats the age range expression using
|    to_char(). This is just to make the output easier to read and interpret.
|
*/ -----------------------------------------------------------------------------

-- SELECT
--   membership_status,
--   to_char(age / 10, '0"0s"') AS age_range,
--   COUNT(customers.id)
-- FROM customers
-- GROUP BY
--   GROUPING SETS (
--     (membership_status, age_range),
--     (membership_status)
--   )
-- ORDER BY membership_status, age_range;


/* -----------------------------------------------------------------------------
|
|    2. Using CUBE for all grouping combinations
|
|    * Rewrite the query from the previous exercise to use CUBE instead of
|      GROUPING SETS. Your results should include the same rows as before (but
|      perhaps in a different order).
|
|    * Add nationality to the SELECT list to include it in the output.
|
|    * Add gender to the CUBE clause to include all combinations across four
|      fields: nationality, membership_status, gender and age_range.
|
|    * Update the SELECT list to also include the gender column.
|
|    * Use the results to find
|       1. how many female Mexicans have Silver membership
|       2. how many men in their 20s have Bronze membership.
|
|      (You might want to use different ORDER BY clauses and change the order
|       of the columns to find each value.)
|
*/ -----------------------------------------------------------------------------


/* -----------------------------------------------------------------------------
|
|    3. Indicating which rows correspond to each grouping set
|
|    * Modify the query from the previous exercise to return the GROUPING function
|      applied to the gender column. Notice how the value in the new column
|      correlates with whether a row is grouped by gender or not.
|
|    * Change the GROUPING function so it applies to each of the other grouping
|      expressions in the cube clause  one at a time:
|        1. nationality
|        2. membership_status
|        3. to_char(age / 10, '0"0s"')
|
|      For each, save the file, and look at how the grouping column correlates
|      to the groupings in each row.
|
|    * Try using the age column on its own (without the "/ 10" expression) in
|      the GROUPING function. What output do you see?
|
*/ -----------------------------------------------------------------------------


/* -----------------------------------------------------------------------------
|
|    4. Using GROUPING to filter CUBE
|
|    * Copy the query from the previous exercise below, and delete any GROUPING
|      functions from the SELECT list.
|
|    * Add GROUPING indicators inside a HAVING clause to answer each of the
|      following questions.
|
|      You can change the HAVING clause for each question, and also re-order the
|      results but do not include any other filters.
|
|      * How many males have Bronze membership status?
|      * How many people in their 40s are non-binary gender?
|      * How many people with Gold membership are in their 70s?
|
*/ -----------------------------------------------------------------------------


/* -----------------------------------------------------------------------------
|
|    5. Using GROUPING indicators for insight into groupings
|
|    This exercise involves using the GROUPING function to identify
|    broad segments of customers that are of particular interest. A
|    broad segment is one that is only grouped by two values, for
|    example "Canadian women" or "Young 'gold members'".
|
|    * Uncomment the query below and save the file. It's very similar to the
|      queries from the previous exercises but has three broad age ranges
|      instead.
|
|    * Use a sum of GROUPING indicators to include only the rows that
|      are grouped by exactly two values.
|
|    * Add an appropriate ORDER BY to the query to answer these two questions:
|
|      1. Which segment (two characteristics) has the highest average sales amount?
|      2. What is the average value for the segment with the highest
|         number of sales?
|
*/ -----------------------------------------------------------------------------

-- SELECT
--   gender,
--   nationality,
--   membership_status,
--   CASE
--     WHEN age < 34 THEN 'young'
--     WHEN age >= 34 AND age < 56 THEN 'mid'
--     WHEN age >= 56 THEN 'old'
--   END AS age_bracket,
--   AVG(sales.value) as average_value,
--   COUNT(sales.id) as total_sales
-- FROM customers
-- LEFT JOIN sales ON sales.customer_id=customers.id
-- GROUP BY
--   CUBE (
--     membership_status,
--     age_bracket,
--     nationality,
--     gender
--   );
