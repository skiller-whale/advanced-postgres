/* -----------------------------------------------------------------------------
|
|    Ex 1. Setting date and time types
|
|    * Uncomment the four new column definitions, and add types for each column.
|    * Check that your code is running successfully.
|    * Beth's birthday is on 4th September. Is that what your output is showing?
|      (HINT: Compare with how Alf's date of birth is supplied and how it's
|      displayed)
|    * Add a command to ensure that the database parses the dates as intended.
|
*/ -----------------------------------------------------------------------------

ALTER TABLE employees
--  ADD COLUMN typical_day_start TODO_add_a_type,
--  ADD COLUMN typical_day_end TODO_add_a_type,
--  ADD COLUMN date_of_birth TODO_add_a_type,
--  ADD COLUMN record_last_updated TODO_add_a_type
;

-- Insert 3 new employees
INSERT INTO employees (id,  name,            typical_day_start, typical_day_end, date_of_birth, record_last_updated)
VALUES
                      (200, 'Alf Hernandez', '8:00',            '160000',        '3 July 1980', now()),
                      (201, 'Beth Miller',   '8:30',            '17:00',         '4/9/1972',    now()),
                      (202, 'Chen Zhe',      '9:00',            '17:45:00',      '10/6/2002',   now())
;

-- Select all employees that we just added.
SELECT *
FROM employees
WHERE record_last_updated IS NOT NULL;

