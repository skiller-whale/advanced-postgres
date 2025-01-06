/* -----------------------------------------------------------------------------
|
|    4. Serialization Anomalies
|
|    * Read the transaction below, then uncomment just the SELECT queries.
|
|    * Uncomment the UPDATE query, and check it did what you expected.
|
|    * Switch to exercise_4.2.sql and follow the instructions there.
|
*/ -----------------------------------------------------------------------------

BEGIN;

/*
 * This stores employee 46's salary, then changes all employees managed by 46
 * to have a salary 10000 lower than that value.
*/
-- -- Uncomment this!
-- SELECT salary INTO managers_salary FROM employees WHERE id = 46;

SELECT pg_sleep(1);

-- -- NOTE: Only uncomment this after you've followed the instructions above.
-- UPDATE employees
-- SET salary = (SELECT salary FROM managers_salary) - 10000
-- WHERE manager_id = 46;

SELECT pg_sleep(1);

COMMIT;

SELECT pg_sleep(1);

/*
 * This file ends by displaying the salaries of employee 46 and all employees
 * managed by them.
 *
 * You can ignore it and focus on the rest of the file.
*/
-- -- Uncomment this!
-- SELECT id, salary
-- FROM employees
-- WHERE id = 46 OR manager_id = 46;
