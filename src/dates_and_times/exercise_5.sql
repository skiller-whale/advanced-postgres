/* -----------------------------------------------------------------------------
|
|    Ex 5. Getting the (Correct) Time
|
|    This exercise has some complex code and is intended to measure the time
|    it takes to run. However, it is currently displaying output of 0.
|
|    * Edit the code so that it outputs the true execution time for the query.
|      This will be at least 3 seconds.
*/ -----------------------------------------------------------------------------

BEGIN;

SELECT CURRENT_TIMESTAMP AS start_time INTO timings;

-- The next 5 statements are doing the main work of the query, and will take a few seconds to run.
SELECT *
FROM employees
WHERE length(name) > 12
FOR UPDATE;

LOCK TABLE projects IN ACCESS EXCLUSIVE MODE;

SELECT pg_sleep(3);

SELECT employees.*
FROM employees
WHERE salary > (
  SELECT MAX(reports.salary)
  FROM employees AS reports
  WHERE reports.manager_id = employees.id
);

UPDATE employees
SET name = LEFT(name, 12)
WHERE length(name) > 12;

-- This statement calculates the total amount of time taken for the query to run.
SELECT now() - start_time AS total_time_taken INTO total_time
FROM timings;

COMMIT;

-- This last statement outputs the total timing.
SELECT *
FROM total_time;
