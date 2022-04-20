/* -----------------------------------------------------------------------------
|
| The code below:
|  * Updates employee 19, so that they are managed by employee 6
|  * Updates the name of employee 6
|  * Updates employee 80 so they are managed by employee 6
|
| Do not edit any existing SQL, you will only be adding locks for this exercise.
| Read the instructions in ex4_shared_advisory_locks.4.sql first.
|
*/ -----------------------------------------------------------------------------

/* Update employee 19 to be managed by employee 6 */
BEGIN;
SELECT pg_sleep(1); UPDATE employees SET manager_id = 6 WHERE id = 19;
COMMIT;

/* Update the name of employee 6 */
BEGIN;
SELECT pg_sleep(1); UPDATE employees SET name = 'Ned Flounders' WHERE id = 6;
COMMIT;

/* Update employee 80 to be managed by employee 6 */
BEGIN;
SELECT pg_sleep(1.5); UPDATE employees SET manager_id = 6 WHERE id = 80;
COMMIT;

/* Report on team size and total salary */
SELECT SUM(salary) AS total_salary,
       (SELECT COUNT(*) FROM employees WHERE manager_id = 6) AS managed_by_6
FROM employees;
