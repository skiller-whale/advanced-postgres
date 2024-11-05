/* -----------------------------------------------------------------------------
|
|    3. Savepoints
|
|    * Read the queries below, and uncomment them.
|
|    * Add transaction management statements to this file - without editing or
|      moving any of the existing statements - so that the output from file one
|      has categories with labels 'FINANCE', 'SALES, 'DEV' and 'marketing'.
|
*/ -----------------------------------------------------------------------------

BEGIN;

-- This lock will prevent any other transactions from reading from the table for
-- the duration of this transaction.
LOCK TABLE categories IN ACCESS EXCLUSIVE MODE;

-- UPDATE categories
-- SET label = 'FINANCE'
-- WHERE id = 1;

-- UPDATE categories
-- SET label = 'SALES'
-- WHERE id = 2;

-- UPDATE categories
-- SET label = 'Sales'
-- WHERE id = 2;

-- UPDATE categories
-- SET label = 'DEV'
-- WHERE id = 3;

-- UPDATE categories
-- SET label = 'MARKETING'
-- WHERE id = 4;

SELECT pg_sleep(2);

COMMIT;
