/* -----------------------------------------------------------------------------
|
|    2. Writing Transactions
|
|    Follow the instructions in ex2_writing_transactions.1.sql if you have not
|    already done so.
|
|    * Read the queries below, and uncomment them.
|
|    * Look at the output from the first file
|
|    * Add commands to this file - WITHOUT editing any of the existing commands
|      so that the project insert will succeed and be visible to the other file,
|      but the first work_item won't be visible if the second isn't.
|
*/ -----------------------------------------------------------------------------

BEGIN;

-- -- Attempt to atomically add a project and two of its work items.
-- INSERT INTO projects (id, budget, reference) VALUES (500, 10000, 'PROJ001');

-- INSERT INTO work_items (id, project_reference, status, created_on, category_id) VALUES (100000, 'PROJ001', 'active', now(), 1);

-- -- This category id is invalid, so the insert will fail
-- INSERT INTO work_items (id, project_reference, status, created_on, category_id) VALUES (100001, 'PROJECT001', 'inactive', now(), 74);

COMMIT;
