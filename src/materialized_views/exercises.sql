/* -----------------------------------------------------------------------------
|
|    1. Materialized views
|
|    This exercise uses the EXPLAIN ANALYZE command to compare execution times
|    for different commands and queries.
|
|    EXPLAIN ANALYZE displays the actual planning time and execution time for
|    a query, as well as the query plan.  For large queries, the query plan will
|    be many lines long. For these exercises, focus on the timings at the end
|    and the overall complexity of the plan, rather than trying to interpret
|    every step.
|
|    * Uncomment the EXPLAIN ANALYZE statement below the command that creates
|      the employee_roles_and_locations view and save this file.
|
|    * Make a note of the planning time and the execution time at the end of
|      the query plan output.
|
|    * Change the CREATE VIEW to create a materialized view instead.
|
|    * Save the file and make a note of the planning time and the execution time
|      of executing the materialized view. Answer the questions in Skiller Whale
|      app.
|
*/ -----------------------------------------------------------------------------

CREATE VIEW employee_roles_and_locations AS
SELECT employees.name,
       roles.name AS role,
       countries.name AS branch_country,
       companies.name AS company
FROM employees
JOIN branches ON branches.id = employees.home_branch_id
JOIN countries ON countries.id = branches.country_id
JOIN employee_languages ON employee_languages.employee_id = employees.id
JOIN languages ON languages.id = employee_languages.language_id
JOIN employee_profiles ON employee_profiles.employee_id = employees.id
JOIN employee_nationalities ON employee_nationalities.employee_profile_id = employee_profiles.id
JOIN countries nationalities ON nationalities.id = employee_nationalities.country_id
JOIN roles ON roles.id = employees.role_id
JOIN role_responsibilities ON role_responsibilities.role_id = roles.id
JOIN responsibilities ON responsibilities.id = role_responsibilities.responsibility_id
JOIN companies ON companies.id = branches.company_id
WHERE responsibilities.name = 'Sales'
  AND nationalities.id = countries.id
  AND languages.name = 'English'
GROUP BY employees.id, roles.name, countries.name, companies.name;

-- TODO: This command will output the query plan and estimated timings for
--       running the query SELECT * FROM employee_roles_and_locations

-- EXPLAIN ANALYZE SELECT * FROM employee_roles_and_locations;

/* -----------------------------------------------------------------------------
|
|    2. How materialized views work
|
|    The commented query below runs EXPLAIN ANALYZE on the creation of a
|    materialized view. As well as displaying the EXPLAIN output, EXPLAIN ANALYZE
|    will also create the materialized view.
|
|    * Uncomment the command below. Before saving the file, think about what you
|      roughly expect the query plan to look like (simple or complicated output).
|
|    * Save the file. Did the query plan output match your expectations?
|
|    * Make a note of the planning time and the execution time from the output.
|
|    * After the CREATE, write a new EXPLAIN ANALYZE that SELECTs everything from
|      the materialized view. Before saving the file, think about how you expect 
|      the timings to differ from creating the view.
|
|    * Save the file. Did the query plan output match your expectations?
|
*/ -----------------------------------------------------------------------------

-- EXPLAIN ANALYZE
-- CREATE MATERIALIZED VIEW responsibility_count AS
--    SELECT
--      responsibilities.name,
--      COUNT(companies.id) AS total_companies,
--      COUNT(employee_nationalities.id) AS total_nationalities
--    FROM companies
--    JOIN branches ON branches.company_id=companies.id
--    JOIN employees ON employees.home_branch_id=branches.id
--    JOIN roles ON roles.id = employees.role_id
--    JOIN role_responsibilities ON role_responsibilities.role_id = roles.id
--    JOIN responsibilities ON responsibilities.id = role_responsibilities.responsibility_id
--    JOIN employee_profiles ON employee_profiles.employee_id = employees.id
--    JOIN employee_nationalities ON employee_nationalities.employee_profile_id = employee_profiles.id
--    GROUP BY
--      responsibilities.name
--    ORDER BY
--      responsibilities.name;

/* -----------------------------------------------------------------------------
|
|    3. Refreshing a materialized view
|
|    * Uncomment the four SQL statements below and save this file.
|      (1 CREATE statement , 2 UPDATE statements, and 1 SELECT statement)
|
|    * Read the output and think about what the output demonstrates about the
|      way in which materialized views store their data.
|
|    * Add a REFRESH MATERIALIZED VIEW statement, so the output of the final
|      SELECT query is up-to-date.
|
*/ -----------------------------------------------------------------------------

-- CREATE MATERIALIZED VIEW company_country_distribution AS
--   SELECT
--     DISTINCT(companies.name),
--     companies.id AS company_id,
--     COUNT(countries.name) AS country_count
--   FROM companies
--   JOIN branches ON branches.company_id=companies.id
--   JOIN countries ON countries.id = branches.country_id
--   GROUP BY companies.name, companies.id
--   ORDER BY companies.name;

-- UPDATE companies SET name='Plaicebook' WHERE id=1;
-- UPDATE companies SET name='Twitturbot' WHERE id=2;

-- SELECT * FROM company_country_distribution WHERE company_id IN (1,2,3);
