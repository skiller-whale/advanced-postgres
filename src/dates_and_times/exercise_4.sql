/* -----------------------------------------------------------------------------
|
|    Ex 4. Decomposing and composing dates and times
|
|    In this exercise, we'll add a column to track the time the next report is
|    due on each project.
|
|    This will be different for each project, each one hour apart from midnight
|    on the day *after* this script is run, based on the project's id.
|
|    The project with id 1 should have a "next_report_due" time of 1am, the
|    project with id 2 should have a "next_report_due" time of 2am.
|
*/ -----------------------------------------------------------------------------

-- IGNORE the next line of code!
-- It creates a new, blank column on the projects table for you to update
ALTER TABLE projects ADD COLUMN next_report_due timestamp with time zone;


-- TODO edit this query to populate the new column.
-- HINT: you can use the function `now()` to get a timestamp for this transaction.
UPDATE projects
SET next_report_due = '';

-- This query will output the id and the timestamp of the next report due
SELECT id, next_report_due
FROM projects;
