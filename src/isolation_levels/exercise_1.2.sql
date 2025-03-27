/* -----------------------------------------------------------------------------
|
|    1. Isolation
|
|    Follow the instructions in exercise_1.1.sql if you have not
|    already done so.
|
|    * Read the queries below, and guess what will be present at each SELECT
|      when the pg_sleep commands are uncommented.
|
|    * Write your answer to the first question in the Skiller Whale app.
|
|    * Uncomment all the pg_sleep statements, and see whether you were right.
|
*/ -----------------------------------------------------------------------------

/*
 * This file saves the name of employee 1 at 0.5s, 1.5s and 2.5s.
 *
 * Then it displays all the values found.
*/

-- -- Make sure you uncomment this line!
-- SELECT pg_sleep(0.5);

-- 0.5 seconds in
SELECT name INTO at_0_5 FROM employees WHERE id = 1;

-- SELECT pg_sleep(1);

-- Start a transaction
BEGIN;
-- 1.5 seconds in
SELECT name INTO at_1_5 FROM employees WHERE id = 1;

-- SELECT pg_sleep(1);

-- 2.5 seconds in, re-read the same data
SELECT name INTO at_2_5 FROM employees WHERE id = 1;

-- End the transaction
COMMIT;


/*
 * This code displays the name found at 0.5s, 1.5s and 2.5s.
 *
 * You can ignore it and focus on the rest of the file.
*/
SELECT at_0_5.name, at_1_5.name, at_2_5.name
FROM at_0_5
CROSS JOIN at_1_5
CROSS JOIN at_2_5;
