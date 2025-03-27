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

/*
 * This file aims to implement a new policy: every manager should be paid 10000 more
 * than their best-paid report.
 *
 * It will do that for manager id 46
*/
BEGIN;

/*
 * This select the maximum salary of employees managed by 46, and stores it.
*/
-- SELECT MAX(salary) AS maximum INTO report_max
-- FROM employees
-- WHERE manager_id = 46;

SELECT pg_sleep(1);

-- UPDATE employees
-- SET salary = (SELECT maximum FROM report_max) + 10000
-- WHERE id = 46;

-- Sleep for 1 second to ensure the transactions overlap
SELECT pg_sleep(1);

COMMIT;

SELECT pg_sleep(1);

/*
 * This file ends by displaying a message if it has been successful.
 *
 * You can ignore it and focus on the rest of the file.
*/
SELECT 'successful' AS result;
