/* -----------------------------------------------------------------------------

    This file has a few example queries that you can uncomment to
    quickly explore the database you'll be working with.

    Each time you save this file, you will see the result of the LAST query
    in this file in the terminal window where you ran docker-compose up.

    When you have more than one uncommented query you'll need to add a
    semicolon (;) after each one.

*/ -----------------------------------------------------------------------------

-- List all tables in the database
SELECT table_name FROM information_schema.tables WHERE table_schema = 'public';
