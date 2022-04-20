/* -----------------------------------------------------------------------------
|
| The query below updates employee 20, so that they are managed by employee 6
|
| Do not edit any existing SQL, you will only be adding locks for this exercise.
| Read the instructions in ex4_shared_advisory_locks.4.sql first.
|
*/ -----------------------------------------------------------------------------

/* Update employee 20 to be managed by employee 6 */
BEGIN;
SELECT pg_sleep(2); UPDATE employees SET manager_id = 6 WHERE id = 20;
COMMIT;

/* Report on team size and total salary */
SELECT SUM(salary) AS total_salary,
       (SELECT COUNT(*) FROM employees WHERE manager_id = 6) AS managed_by_6,
       pg_sleep(1)
FROM employees;
