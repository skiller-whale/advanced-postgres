/* -----------------------------------------------------------------------------
|
|    3. Identifying Isolation Anomalies
|
|    * Read the transaction below, uncomment the two UPDATE statements, and save this file.
|    * Switch to exercise_3.2.sql and follow the instructions there.
|
*/ -----------------------------------------------------------------------------

SELECT pg_sleep(0.5);

-- T=0.5s, update employees 19 and 80 to be managed by employee 6
BEGIN;

-- UPDATE employees SET manager_id = 6 WHERE id = 19;
-- UPDATE employees SET manager_id = 6 WHERE id = 80;

COMMIT;

