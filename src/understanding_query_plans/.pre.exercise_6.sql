-- This is going to turn off the analyser on the work_items table
-- which ensures the query plan will return the wrong number of rows

ALTER TABLE work_items SET (autovacuum_enabled = false);

SELECT pg_sleep(1);

DELETE FROM pg_statistic;
