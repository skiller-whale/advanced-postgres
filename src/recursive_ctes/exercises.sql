/* -----------------------------------------------------------------------------
|
|    1. A Non-Recursive CTE
|
|    The database you'll work with has a table called employees with this
|    structure:
|      - id         (the employee's id)
|      - name       (the employee's name)
|      - manager_id (the id of the manager's id, which is a nullable foreign key
|                    to the id column)
|      - salary     (the employee's salary)
|
|    The query below uses this table to find the name and salary of all managers
|    with more than 4 direct reports.
|
|    To do this, it uses a CTE to calculate the number of people with each
|    manager_id, and then joins the CTE onto the employees table to get the
|    names and salaries corresponding to the manager_ids.
|
|    Uncomment the query, make sure you understand how it is working, and check
|    that the output looks sensible.
|
|    Write another query underneath which find the average salary by number of
|    direct reports. This can use the same CTE, and the result should have two
|    columns:
|
|      * report_count (one row for each value)
|      * average_salary for people with this report count
|
*/ -----------------------------------------------------------------------------

-- WITH reports AS (
--   SELECT manager_id,
--          COUNT(*) AS report_count
--   FROM employees
--   GROUP BY manager_id
-- )
-- SELECT employees.id,
--        employees.name,
--        employees.salary,
--        reports.report_count
-- FROM employees
-- JOIN reports
--   ON employees.id = reports.manager_id
-- WHERE reports.report_count > 4;


/* -----------------------------------------------------------------------------
|
|    2. Recursive CTEs
|
|    Using the employees table and a recursive CTE, write a query that will
|    return the sum of salaries for all people who work under the employee with
|    id 4.
|
|    This should include the direct reports of employee 4, their direct reports
|    and so on... but not employee 4 themselves.
|
|    The CTE in your answer will need to have the columns `id`, `salary` and
|    `manager_id`, and this CTE will then be used by the main query.
|
|    The final result should contain the columns:
|
|      * headcount     (the total number of direct and indirect reports)
|      * total_salary  (across all people included in this manager's headcount)
|
|
|    BONUS QUESTION:
|
|    Change just one line to update your query so that employee 4 is also
|    included in the count (in addition to all of their reports)
|
*/ -----------------------------------------------------------------------------

-- TODO: Write your query here (remember to end it with a semicolon ;)


/* -----------------------------------------------------------------------------
|
|    3. Recursive CTEs Part 2.
|
|    Using the employees table and a recursive CTE, write a query that will
|    return one row for each of the 10 managers in charge of the most expensive
|    teams (those with the highest total salary).
|
|    A manager's team includes the manager, the manager's direct reports, each
|    of their direct reports and so on...
|
|    The result should contain the columns:
|
|      * id            (of the manager)
|      * headcount     (the total number of people on the team - this includes
|                       the manager, and their direct and indirect reports)
|      * total_salary  (across all people included in this manager's headcount)
|
|    It should be sorted by total_salary, and just include the top 10
|
*/ -----------------------------------------------------------------------------

-- TODO: Write your query here (remember to end it with a semicolon ;)
--   (you might want to use your previous answer as a starting point)


/* -----------------------------------------------------------------------------
|
|    4. Multiple Base Queries
|
|    Copy your answer from above, then modify it, so the result only includes
|    managers who are not the owner of any projects. (Do this using multiple
|    base queries rather than a LEFT JOIN). You will probably want to use the
|    EXCEPT keyword.
|
|    The set of employees who ARE the owner of a project can be found by
|    querying
|
|    SELECT employees.*
|    FROM employees
|    JOIN projects
|    ON employees.id = projects.owner_id
|
|    Again your query should return
|
|      * id            (of the manager)
|      * headcount     (the number of direct and indirect reports
|                       INCLUDING themselves)
|      * total_salary  (across all people included in this manager's headcount)
|
|    It should be sorted by total_salary, and just include the top 10
|
*/ -----------------------------------------------------------------------------

-- TODO: Write your query here (remember to end it with a semicolon ;)
--   use your previous answer as a starting point


/* -----------------------------------------------------------------------------
|
|    5. Multiple Recursive CTEs
|
|    This final exercise is tricky, and requires two recursive CTEs. It can also
|    benefit from additional non-recursive CTEs to simplify the data from each
|    recursive CTE.
|
|    Your query should return one row for each employee, containing:
|
|      * id           (of the employee)
|      * budget_size  (the sum of the salaries for the employee, and all people
|                     under them in the hierarchy, plus the total project
|                     budget for any project that they are the owner of,
|                     including the budgets for all of its subprojects)
|
|    NOTE: If Ali manages Ben, and Ben is the owner of a project, then that
|          project's budget is not included in Ali's budget_size (unless it is
|          a sub-project of a project with Ali as its owner).
|
|    The result should be sorted descending by total_budget.
|
|    The easiest way to solve this problem involves breaking the query down
|    using CTEs to store intermediate stages. The steps to get there are
|    detailed below (but feel free to have a go yourself if you think you can!)
|
*/ -----------------------------------------------------------------------------

/* ~~~~~~~~~ STEP 1. ~~~~~~~~~

Uncomment the query below, and make sure you understand what it does. It
should look very similar to your answer to question 3.

This query uses CTEs to return the id of each employee, and the
salary_budget (including their own salary) that they are responsible for.
*/

-- WITH RECURSIVE reports AS (
--     SELECT id, salary, id AS manager_id
--     FROM employees
--   UNION
--     SELECT employees.id, employees.salary, reports.manager_id
--     FROM employees
--     JOIN reports
--     ON reports.id = employees.manager_id
-- ),
--   total_salary_budget AS (
--     SELECT manager_id AS employee_id,
--            sum(salary) AS salary_budget
--     FROM reports
--     GROUP BY manager_id
-- )
-- SELECT * FROM total_salary_budget;


/* ~~~~~~~~~ STEP 2. ~~~~~~~~~

Create a recursive CTE called `subprojects` that is similar to the
`reports` CTE above. Instead of `id`, `manager_id` and `salary`, this will
need to use the columns `id`, `base_project_owner_id` and `budget`. This CTE will
contain one row for each 'subproject - project' relationship (so that
GROUP BY base_project_owner_id, SUM(budget) will give the total budget for projects
managed by each owner).

The results of this CTE should contain 54 rows, with the columns

   id    budget    base_project_owner_id
  ----  --------  ----------------------- */



/* ~~~~~~~~~ STEP 3. ~~~~~~~~~

Add a second (non-recursive) CTE to the query from STEP 2. called
`total_project_budget`. This should be similar to the `total_salary_budget` CTE,
and calculate the total project budget that each employee is responsible for
(by grouping on `base_project_owner_id`)

This CTE should contain 22 rows, with the columns

  base_project_owner_id    total_budget
 -----------------------  -------------- */



/* ~~~~~~~~~ STEP 4. ~~~~~~~~~

Write a new query that combines the CTEs from steps 1 and 3, and join them in
the main query to find the total budget ownership for each employee in the space
below. (total_project_budget.total_budget + total_salary_budget.salary_budget)

You might need to use the COALESCE function to deal with the situation where
the total_budget is null for some employees.

COALESCE(total_budget, 0) is equal to 0 when total_budget is null.
*/
