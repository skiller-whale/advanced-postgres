/* -----------------------------------------------------------------------------
|
|    4. Serialization Anomalies
|
|    Follow the instructions in exercise_4.1.sql if you have not
|    already done so.
|
|    * Read the queries below.
|
|    * Uncomment all statements here and save the file.
|
|    * Use isolation levels to ensure that at least one transaction achieves
|      its intentions.
|
|    * Answer the questions in the Skiller Whale app.
|
*/ -----------------------------------------------------------------------------

BEGIN;

/*
 * This select the average salary of employees managed by 46, and stores it.
*/
-- SELECT AVG(salary) AS average INTO report_average
-- FROM employees
-- WHERE manager_id = 46;

SELECT pg_sleep(1);

-- UPDATE employees
-- SET salary = (SELECT average FROM report_average)
-- WHERE id = 46;

-- Sleep for 1 second to ensure the transactions overlap
SELECT pg_sleep(1);

COMMIT;

SELECT pg_sleep(1);

/*
 * This file ends by displaying the salaries of employee 46 and all employees
 * managed by them.
 *
 * You can ignore it and focus on the rest of the file.
*/
-- SELECT id, salary
-- FROM employees
-- WHERE id = 46 OR manager_id = 46;
