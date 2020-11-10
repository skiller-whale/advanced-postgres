/* -----------------------------------------------------------------------------
|
|    1. Sources of slowness
|
|    * Uncomment the SQL query below, and save this file. The query should run,
|    and you'll see results in the window where you ran docker-compose up.
|    * Don't bother reading the query to understand what it's doing. That's not
|    important for the problem you're going to be solving.
|    * Add "EXPLAIN ANALYZE" to the start of the query, and save the file so it
|    runs again.
|    * That will display details of the plan being used, and the time taken to
|    execute, which we won't be examining in this session.
|    * It will also show the amount of time spent planning the query, and
|    executing it.
|
*/ -----------------------------------------------------------------------------

-- SELECT employees.name,
--        roles.name AS role,
--        countries.name AS branch_country,
--        companies.name AS company
-- FROM employees
-- JOIN branches
-- ON branches.id = employees.home_branch_id
-- JOIN countries
-- ON countries.id = branches.country_id
-- JOIN employee_languages
-- ON employee_languages.employee_id = employees.id
-- JOIN languages
-- ON languages.id = employee_languages.language_id
-- JOIN employee_profiles
-- ON employee_profiles.employee_id = employees.id
-- JOIN employee_nationalities
-- ON employee_nationalities.employee_profile_id = employee_profiles.id
-- JOIN countries nationalities
-- ON nationalities.id = employee_nationalities.country_id
-- JOIN roles
-- ON roles.id = employees.role_id
-- JOIN role_responsibilities
-- ON role_responsibilities.role_id = roles.id
-- JOIN responsibilities
-- ON responsibilities.id = role_responsibilities.responsibility_id
-- JOIN companies
-- ON companies.id = branches.company_id
-- WHERE responsibilities.name = 'Sales'
--   AND nationalities.id = countries.id
--   AND languages.name = 'English'
-- GROUP BY employees.id, roles.name, countries.name, companies.name;



/* -----------------------------------------------------------------------------
|
|    2. Preparing a statement
|
|    * Copy the query you wrote for section 1 below.
|    * Edit the query to create a prepared statement:
|       1. The statement should be called "find_local_employees"
|       1. It should have two parameters, which should be used instead of
           'Sales' and 'English'
|    * After creating the prepared statement, execute it with the parameters
|      'Sales' and 'English'
|    * Check the output in the window where you ran docker-compose up
|    * Add EXPLAIN ANALYZE in front of the statement where you execute the query
|
|    You probably won't see any improvement yet.
|
*/ -----------------------------------------------------------------------------

-- TODO: Write your query here.



/* -----------------------------------------------------------------------------
|
|    3. Generic and custom plans
|
|    * Leave the code from section 2 above uncommented (including the EXECUTE
|      statement).
|    * Add another call below to EXECUTE the statement again, using EXPLAIN
|      ANALYZE. Call it with the same parameters as before.
|    * You should see the strings 'Sales' and 'English' in the output of the
|      plan.
|    * Keep adding EXPLAIN ANALYZE calls to EXECUTE the statement until
|      you see a generic plan, with ($2) instead of 'English' and ($1) instead of
|      'Sales'.
|
|    BONUS EXERCISE (if you have time)
|
|    * Remove all the calls to EXPLAIN ANALYZE EXECUTE this statement with these
|      parameters, and instead write one call to EXPLAIN ANALYZE EXECUTE it with
|      both parameters NULL.
|    * You should see a much simpler execution plan as the output.
|    * Add five more calls to execute the statement with the same parameters.
|
|    Depending on the exact timings for your first five queries, you may now see
|    a custom plan being used for the prepared statement, because the first 5
|    executions were so much faster than the generic plan would have been.
|
*/ -----------------------------------------------------------------------------

-- TODO: Write your queries here.



/* -----------------------------------------------------------------------------
|
|    4. Limitations of Prepared Statements
|
|    Can you overload a prepared statement, to have another with the same name
|    and different parameters?
|
|    * Copy your code from section 2 below, edit it so that it only has one
|      parameter, and remove the condition `languages.name = $2`. Keep the
|      name of the statement the same.
|    * Check whether you see any errors in the output.
|
|    Delete the statement you just wrote, and instead write a prepared 
|    statement called "find" with a single VARCHAR parameter, which will
|    "SELECT *" from the "employees" table where "name" is equal to the 
|    parameter value.
|
|    Can you pass prepared statement parameters to functions?
|
|    * Edit your new prepared statement to compare `LOWER(name)` with `LOWER($1)`.
|    * Check the output to see whether there are any error messages.
|
|    Can you pass column names as parameters to functions?
|
|    * Edit your new prepared statement to have another parameter, and replace
|      the reference to the "name" column with a reference to the new parameter
|      (using "employees.$2")
|    * Check the output to see whether there are any error messages.
|
|    Can you pass table names as parameters to functions?
|
|    * Revert your new prepared statement to specify the "name" column, rather than
|      using a parameter.
|    * Edit the query so that the reference to the "employees" table instead uses
|      the new parameter.
|    * Check the output to see whether there are any error messages.
|
|    * Change the prepared statement back to only having one parameter, selecting
|      from the employees table.
|
*/ -----------------------------------------------------------------------------

-- TODO: Write your queries here



/* -----------------------------------------------------------------------------
|
|    5. Managing Prepared Statements
|
|    * Ensure the code to create all previous created prepared statements is
|      uncommented.
|    * Write a line of code to list all prepared statements.
|    * Check the output to see what is listed.
|    * Deallocate the "find" prepared statement.
|    * Check the list of all prepared statements again, and confirm that
|      "find" is no longer listed.
|
*/ -----------------------------------------------------------------------------

-- TODO: Write your queries here
