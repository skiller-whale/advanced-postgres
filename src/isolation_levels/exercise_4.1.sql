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

/*
 * This file aims to implement a new policy: every manager's reports should be paid
 * 10000 less than the manager themselves.
 *
 * It will do that for manager id 46.
*/
-- SELECT id, salary INTO before_changes
-- FROM employees
-- WHERE id = 46 OR manager_id = 46;

BEGIN;

-- SELECT salary INTO manager_salary
-- FROM employees
-- WHERE id = 46;

SELECT pg_sleep(1);

-- -- NOTE: Only uncomment this after you've followed the instructions above.
-- UPDATE employees
-- SET salary = (SELECT salary FROM manager_salary) - 10000
-- WHERE manager_id = 46;

SELECT pg_sleep(1);

COMMIT;

SELECT pg_sleep(1);

/*
 * This file ends by displaying the salaries of employee 46 and all employees
 * managed by them, compared with the values before.
 *
 * You can ignore it and focus on the rest of the file.
*/
-- SELECT before_changes.id, before_changes.salary AS old_salary, employees.salary AS new_salary
-- FROM employees
-- JOIN before_changes
--   ON before_changes.id = employees.id
-- WHERE employees.id = 46 OR employees.manager_id = 46;
