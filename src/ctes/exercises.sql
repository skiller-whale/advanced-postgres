/* -----------------------------------------------------------------------------
|
|    1. Writing a CTE
|
|    Write a query below and then save this file. The query should run,
|    and you'll see results in the window where you ran docker-compose up.
|
|    This database has a table called employees with this structure:
|      - id         (the employee's id)
|      - name       (the employee's name)
|      - manager_id (the id of the manager's id, which is a nullable foreign key
|                    to the id column)
|      - salary     (the employee's salary)
|
|    Write a CTE that uses a GROUP BY to return:
|    (one row for each distinct manager_id)
|
|      * The manager's id
|      * The average salary of all direct reports of that manager
|        (all employees with that manager_id)
|
|    SELECT all columns and rows from that CTE.
|
*/ -----------------------------------------------------------------------------

-- TODO: Write your query here (remember to end it with a semicolon ;)


/* -----------------------------------------------------------------------------
|
|    2. Joining with CTEs
|
|    By joining the employees table to a CTE, write a query that returns:
|    (one row for each distinct manager)
|
|      * The manager's id
|      * The manager's name
|      * The manager's salary
|      * The average salary of all direct reports of that manager
|
|    Limit the results to the 5 managers with the highest average employee
|    salaries.
|
*/ -----------------------------------------------------------------------------

-- TODO: Write your query here (remember to end it with a semicolon ;)
-- (Copy the previous query here and edit it for your answer)

/* -----------------------------------------------------------------------------
|
|    3. CTEs for further processing
|
|    Use a CTE to find the employee(s) with the highest salary for each
|    manager. For each manager you should return:
|
|      * The manager's id
|      * The id of the highest earning employee(s) reporting to that manager
|      * The name of the highest earning employee(s) reporting to that manager
|      * The salary of the highest earning employee(s) reporting to that manager
|
|    ORDER your results by the manager_id ascending
|
|    HINT:
|        i. Use a CTE to find the highest salary across all the reports of each
|           manager (using GROUP BY).
|        ii. Join this CTE to the employees table to get the employees who have
|            the same salary and manager as the rows in the CTE.
|
|    ----------------------------------------------------------------------
|
|    BONUS: If you finish the above, then add a new column to the query, which
|           contains the manager's name
|
*/ -----------------------------------------------------------------------------

-- TODO: Write your query here (remember to end it with a semicolon ;)


/* -----------------------------------------------------------------------------
|
|    4. Modifying data in a CTE
|
|    Write a CTE that will update the employees who have a salary more than
|    80,000 and currently have a non-NULL manager_id, so that they have a NULL
|    manager_id.
|
|    As a reminder update statements look like:
|
|    UPDATE table_name
|    SET column = expression
|    WHERE condition;
|
|    The overall query should then return:
|
|      * The number of employees modified
|      * The average of their salaries
|
|    NOTE: this script does not commit transactions, so if you make a mistake,
|    your script should still be able to run the next time you make a change.
|
*/ -----------------------------------------------------------------------------

-- TODO: Write your query here (remember to end it with a semicolon ;)


/* -----------------------------------------------------------------------------
|
|    5. Multiple CTEs in one query
|
|    Write a query using two CTEs to find:
|
|    a) The 10 managers who are paid the least (you'll need to self-join the
|       employees table to find which users are managers)
|    b) The ids of the 10 managers who have the most direct reports
|       (i.e. the COUNT of their direct reports salaries is highest)
|
|    JOIN together those two CTEs to find the intersection between the two
|    datasets (the managers who are in the bottom 10 for their salary and
|    top 10 for number of reports). For each, your query should return:
|
|      * The manager's id
|      * The manager's name
|      * The manager's salary
|      * The number of direct reports the manager has
|
*/ -----------------------------------------------------------------------------

-- TODO: Write your query here (remember to end it with a semicolon ;)


/* -----------------------------------------------------------------------------
|
|    6. Converting to CTEs
|
|    The query below uses a correlated subquery. Rewrite it to use a CTE instead
|    (Do this without using a window function)
|
|    The results should be exactly the same after you have rewritten the query
|
*/ -----------------------------------------------------------------------------

-- SELECT id,
--   name,
--   salary,
--   manager_id,
--   (
--     SELECT AVG(salary)
--     FROM employees emp
--     WHERE employees.manager_id = emp.manager_id
--   ) AS average_for_manager
-- FROM employees;
