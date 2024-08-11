/* -----------------------------------------------------------------------------
|
|    The query below returns all categories linked to a project through
|    work_items, using a UNION to combine categories from work_items and nested
|    work_items (subitems).
|
|    * Uncomment the ANALYZE command, save the file and look at the output.
|
|    * Note how many rows are retrieved for the Append node, and how many
|      _actual_ rows are returned in total. (This is the number in the second
|      section of the top node, not the first section)
|
|    * Alter the query to move the filter from the outer query into both
|      queries within the UNION, "pushing down the predicate" manually.
|
|    * Save the query and check that the total number of rows matches the
|      number from the original query. (If it is not the same, you will have
|      made a mistake with the changes from the previous step.)
|
*/ -----------------------------------------------------------------------------

-- ANALYZE;

EXPLAIN ANALYZE
  SELECT *
  FROM
  (SELECT
    work_items.project_reference,
    categories.label
    FROM work_items
    JOIN categories ON categories.id = work_items.category_id
  UNION ALL
  SELECT
    documents.project_reference,
    categories.label
    FROM documents
    JOIN categories ON categories.id = documents.category_id
  ) as project_labels
  JOIN projects ON projects.reference = project_labels.project_reference
  WHERE projects.id = 11;
