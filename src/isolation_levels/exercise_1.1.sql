/* -----------------------------------------------------------------------------
|
|    1. Isolation
|
|    * Read the transaction below, uncomment the three commented statements, and save this file.
|    * Switch to exercise_1.2.sql and follow the instructions there.
|
*/ -----------------------------------------------------------------------------

BEGIN;

-- -- 0 second elapsed
-- UPDATE employees
-- SET name = 'Shark Ruffalo'
-- WHERE id = 1;

-- NB: no commit yet!
SELECT pg_sleep(1);

-- -- 1 second elapsed
-- UPDATE employees
-- SET name = 'Cod Stewart'
-- WHERE id = 1;

COMMIT;

SELECT pg_sleep(1);

-- New transaction here
BEGIN;

-- -- 2 seconds elapsed
-- UPDATE employees
-- SET name = 'Stingray Charles'
-- WHERE id = 1;

COMMIT;
