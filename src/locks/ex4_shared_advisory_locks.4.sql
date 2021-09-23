/* -----------------------------------------------------------------------------
|
|    Take a look at the files ex4_shared_advisory_locks.1.sql, .2.sql and 3.sql
|    if you have not already done so.
|
|    The SQL below carries out some business logic to increase the salary of
|    everyone working for manager 6 by 1000, and takes this money off 6's
|    salary. This should be performed at a specific instance in time - so anyone
|    who is added to the team after that moment will not recieve the increase.
|    The important part of this exercise is avoiding a race condition to ensure
|    that the company's total salary spend does not change.
|
|    This happens in two separate statments, but you don't need to worry about
|    how each of these works. They will run concurrently with statements in the
|    other scripts that can cause issues with data correctness.
|
|    * Don't change, move or delete any lines of SQL in this or the other files!
|      You will only be adding lock and unlock statements for this exercise.
|
|    * Uncomment the first pg_sleep() statement below to run all four of these
|      files. You should see that there is a bug: the total salary at the
|      end of the operation is different to the total salary beforehand.
|
|    * Without modifying any existing code, add exclusive advisory locks (and
|      unlocks) to the relevant files so this bug is avoided, and the final total
|      salary is the same as the initial total.
|
|    * Use shared locks where appropriate so that the duration of this query
|      is less than 4 seconds.
|
*/ -----------------------------------------------------------------------------

/* Record some values at the start of the query */
SELECT SUM(salary) AS total_salary, clock_timestamp() AS clock_time
INTO TEMPORARY initial_state FROM employees;

-- SELECT pg_sleep(1.5);

/* Reduce manager 6's salary by £1000 for each of their team members */
UPDATE employees
  SET salary = salary - (1000 * sub.count)
  FROM ( SELECT COUNT(*) AS count FROM employees WHERE manager_id = 6 ) AS sub
  WHERE id = 6;
COMMIT;

SELECT pg_sleep(1.5);

/* Increase each of manager 6's team members' salaries by £1000 */
UPDATE employees SET salary = (salary + 1000) WHERE manager_id = 6;
COMMIT;

/* Report the final total salary budget for the company */
SELECT (SELECT initial_state.total_salary AS initial_total_salary FROM initial_state),
       SUM(salary) AS final_total_salary,
       (SELECT COUNT(*) FROM employees WHERE manager_id = 6) AS managed_by_6,
       (SELECT clock_timestamp() - initial_state.clock_time AS duration FROM initial_state)
FROM employees;
