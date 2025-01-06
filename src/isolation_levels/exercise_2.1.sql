/* -----------------------------------------------------------------------------
|
|    2. Non-Repeatable Reads
|
|    * Read the transaction below, uncomment the three commented statements, and save this file.
|    * Switch to exercise_2.2.sql and follow the instructions there.
|
*/ -----------------------------------------------------------------------------

BEGIN;

/*
 * This saves the value of employee 6's salary at the start of the file before changes are made.
*/
-- SELECT salary INTO salary_before_100_increase
-- FROM employees
-- WHERE id = 6;

SELECT pg_sleep(1);

-- -- T=1s, update employee 6 to have 100 higher salary
-- UPDATE employees
-- SET salary = salary + 100
-- WHERE id = 6;

COMMIT;

SELECT pg_sleep(2);


/*
 * This code displays the salary found at the start of this file, and the salary found when the file completes.
 *
 * You can ignore it and focus on the rest of the file.
*/
-- SELECT salary_before_100_increase.salary AS before, employees.salary AS after
-- FROM employees, salary_before_100_increase
-- WHERE id = 6;
