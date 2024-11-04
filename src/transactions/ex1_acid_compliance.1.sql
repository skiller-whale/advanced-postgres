/* -----------------------------------------------------------------------------
|
|    1. ACID Compliance
|
|    * Read the transaction below, uncomment the three commented statements,
|      and save this file.
|
|    * Switch to ex1_acid_compliance.2.sql and follow the instructions there.
|
*/ -----------------------------------------------------------------------------

BEGIN;

-- -- Add a new category
-- INSERT INTO categories (id, label) VALUES (5, 'email draft');

-- SELECT pg_sleep(2);

-- -- Accidentally use the same id as the previous new category...
-- INSERT INTO categories (id, label) VALUES (5, 'project update');

COMMIT;
