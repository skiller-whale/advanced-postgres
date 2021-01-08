/* -----------------------------------------------------------------------------
|
| The query below calculates:
|   * The total salary expenditure across the whole company
|   * The total number of people working for the manager with id 6
|
| The output from this query can be compared with the same values after some
| other queries have run. You don't need to change any code in this file.
|
*/ -----------------------------------------------------------------------------

/* Report on team size and total salary */
SELECT SUM(salary) AS total_salary,
       (SELECT COUNT(*) FROM employees WHERE manager_id = 6) AS managed_by_6
FROM employees;
