/* -----------------------------------------------------------------------------

    This file has a few example queries that you can uncomment to
    quickly explore the database you'll be working with.

    Each time you save this file, you will see the result of the LAST query
    in this file in the terminal window where you ran docker-compose up.

    When you have more than one uncommented query you'll need to add a
    semicolon (;) after each one.

*/ -----------------------------------------------------------------------------

-- List all tables in the database

-- SELECT table_name FROM information_schema.tables WHERE table_schema = 'public';

-- Creates a view spanning several tables in the database

-- CREATE VIEW english_speaking_sales_employee_locations AS
--   SELECT employees.name,
--          roles.name AS role,
--          countries.name AS branch_country,
--          companies.name AS company
--   FROM employees
--   JOIN branches ON branches.id = employees.home_branch_id
--   JOIN countries ON countries.id = branches.country_id
--   JOIN employee_languages ON employee_languages.employee_id = employees.id
--   JOIN languages ON languages.id = employee_languages.language_id
--   JOIN employee_profiles ON employee_profiles.employee_id = employees.id
--   JOIN employee_nationalities ON employee_nationalities.employee_profile_id = employee_profiles.id
--   JOIN countries nationalities ON nationalities.id = employee_nationalities.country_id
--   JOIN roles ON roles.id = employees.role_id
--   JOIN role_responsibilities ON role_responsibilities.role_id = roles.id
--   JOIN responsibilities ON responsibilities.id = role_responsibilities.responsibility_id
--   JOIN companies ON companies.id = branches.company_id
--   WHERE responsibilities.name = 'Sales'
--     AND nationalities.id = countries.id
--     AND languages.name = 'English'
--   GROUP BY employees.id, roles.name, countries.name, companies.name;

-- Select first five results from the view

-- SELECT * FROM english_speaking_sales_employee_locations LIMIT 5;
