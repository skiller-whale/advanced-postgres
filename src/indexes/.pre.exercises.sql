-- This ensures that the statistics are up to date in the work_items table,
-- allowing Postgres to use index-only scans when possible.
VACUUM work_items;
