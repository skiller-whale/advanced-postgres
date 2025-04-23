/* -----------------------------------------------------------------------------
|
|    Ex 3. Arithmetic and Intervals
|
|    This company wants to hold a "project completion party" for completed
|    projects.
|
|    Project completion parties will only be allowed for projects that last
|    more than 7 days.
|
|    The completion party should be at 1pm, 7 days after the project completion.
|
|    Write a query below that will find the dates and times of all project
|    completion parties for this dataset.
|
*/ -----------------------------------------------------------------------------

-- IGNORE the next three lines of code!
-- It populates the projects table with a start_date and end_date
ALTER TABLE projects ADD COLUMN start_date date, ADD COLUMN end_date date;
UPDATE projects SET start_date = '2023-1-1'::date + id;
UPDATE projects SET end_date = start_date + 1 + budget % 14;


-- TODO edit the query below to find the correct project completion party timestamps

SELECT *
FROM projects;

-- Expected Row Count: 12
