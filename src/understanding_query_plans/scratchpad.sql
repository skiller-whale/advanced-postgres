/* ----------------------------------------------------------------------------- |
|   This file has some example queries that you can uncomment to quickly
|   explore the database you'll be working with.
|
|   Each time you save this file, you will see the result of the LAST query
|   in this file in the terminal window where you ran docker-compose up.
|
|   When you have more than one uncommented query you'll need to add a
|   semicolon (;) after each one.
|
*/ -----------------------------------------------------------------------------

-- The projects table can be joined to work_items and documents with
-- projects.reference.

-- SELECT * FROM projects;

-- The work_items and documents tables can be joined to the categories
-- table to get the category of work_item or document.
-- SELECT *
-- FROM work_items
-- JOIN categories ON categories.id = work_items.category_id
-- LIMIT 3;

-- SELECT *
-- FROM documents
-- JOIN categories ON categories.id = documents.category_id
-- LIMIT 3;

-- The work_items and documents tables have a large number of rows.

-- SELECT COUNT(*) AS num_items FROM  work_items;

-- SELECT COUNT(*) AS num_documents FROM documents;
