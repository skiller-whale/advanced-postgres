/* -----------------------------------------------------------------------------
|
|    3. Identifying Isolation Anomalies
|
|    Follow the instructions in exercise_3.1.sql if you have not
|    already done so.
|
|    * Read the queries below, and uncomment the UPDATE statements.
|
|    * This code is intended to decrease employee 6's salary, and increase
|      their reports' salaries by the same total, but it is not current doing that.
|
|    * Adjust the transaction to fix the code, and confirm that the total salary
|      before is equal to the total salary after.
|
*/ -----------------------------------------------------------------------------

-- TODO you may only edit the following line of code!
BEGIN;

/*
 * This calculates the total salary at the start of the file before changes are made.
*/
SELECT SUM(salary) AS total_salary_before INTO salary_before FROM employees;

-- -- T=0s, Update employee 6 to have 1000 less in salary for each report
-- UPDATE employees
--   SET salary = salary - (1000 * sub.count)
--   FROM ( SELECT COUNT(*) AS count FROM employees WHERE manager_id = 6 ) AS sub
--   WHERE id = 6;

SELECT pg_sleep(1);

-- -- T=1s, increase the salary of each person managed by employee 6 by 1000.
-- UPDATE employees SET salary = (salary + 1000) WHERE manager_id = 6;

COMMIT;


/*
 * This code finds the total salary of all employees at the end of the file.
 *
 * It displays that total, with the total salary at the start of the file.
*/
SELECT SUM(salary) AS total_salary_after INTO salary_after FROM employees;

SELECT salary_before.total_salary_before, salary_after.total_salary_after
FROM salary_before
CROSS JOIN salary_after;
