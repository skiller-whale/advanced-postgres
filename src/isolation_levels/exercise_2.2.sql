/* -----------------------------------------------------------------------------
|
|    2. Non-Repeatable Reads
|
|    Follow the instructions in exercise_2.1.sql if you have not
|    already done so.
|
|    * Read the queries below, and uncomment the three commented statements.
|
|    * These two files are trying to increase employee 6's salary by a total of
|      110. Is that happening? Why?
|
|    * Adjust the isolation level of this transaction only so that the database
|      detects the anomaly, and this transaction fails instead of succeeding
|      and overwriting the other transaction's update
|
*/ -----------------------------------------------------------------------------

-- TODO you may only edit the following line of code!
BEGIN;

/*
 * This saves the value of employee 6's salary at the start of the file before changes are made.
*/
-- SELECT salary INTO salary_before_10_increase
-- FROM employees
-- WHERE id = 6;

-- T=2s, Update employee 6 to have 10 more in salary
SELECT pg_sleep(2);

-- UPDATE employees
-- SET salary = (SELECT salary FROM salary_before_10_increase) + 10
-- WHERE id = 6;

COMMIT;

SELECT pg_sleep(1);

/*
 * This code displays the salary found at the start of this file, and the salary found when the file completes.
 *
 * You can ignore it and focus on the rest of the file.
*/
-- SELECT salary_before_10_increase.salary AS before, employees.salary AS after
-- FROM employees, salary_before_10_increase
-- WHERE id = 6;
