/* -----------------------------------------------------------------------------
|
|    1. Familiarity with the Data
|
|    Uncomment the SQL query below, and save this file. The query should run,
|    and you'll see results in the window where you ran docker-compose up.
|
|    Make sure you understand how this query works. It uses all of the columns
|    in the database except for students.name
|
*/ -----------------------------------------------------------------------------

-- SELECT tutors.name AS tutor_name,
--        AVG(scores.score) AS average_maths_score
-- FROM tutors
-- LEFT JOIN students
--   ON tutors.id = students.tutor_id
-- LEFT JOIN scores
--   ON students.id = scores.student_id
-- WHERE scores.subject = 'maths'
-- GROUP BY tutors.id;

/* -----------------------------------------------------------------------------
|
|    2. Window Functions Recap
|
|    Use window functions to write a query that will return:
|
|    * Each student's name.
|    * The tutor's name for the student.
|    * The students alphabetical position amongst students with the same tutor.
|    * The average score for the subject 'it' across all students.
|
|    Use the row_number() function to return the student's alphabetical position
|
*/ -----------------------------------------------------------------------------

-- TODO: Write your query here (remember to end it with a semicolon ;)
--       (You can copy any joins from the query above to save time!)


/* -----------------------------------------------------------------------------
|
|    3. Different Types of Ranking
|
|    Use window functions to write a query that will return:
|    * Each student's name.
|    * Their score for 'science'.
|    * Their row_number() when sorted by science score.
|    * The rank of their science score.
|    * The dense_rank() of their science score.
|
|    Remember that a higher score means a lower rank (you may need to use DESC)
|
*/ -----------------------------------------------------------------------------

-- TODO: Write your query here (remember to end it with a semicolon ;)


/* -----------------------------------------------------------------------------
|
|    4. Combining PARTITION BY, ORDER BY and GROUP BY
|
|    Use a window function to write a query that will return:
|    * Each student's name.
|    * Their total score (SUM across all three subjects)
|    * Their tutor's name.
|    * The rank of their total score among students with the same tutor.
|
|    To do this you will need to use a GROUP BY, and a window function with a
|    PARTITION BY and an ORDER BY
|    (remember that GROUP BY is performed before window functions)
|
*/ -----------------------------------------------------------------------------

-- TODO: Write your query here (remember to end it with a semicolon ;)


/* -----------------------------------------------------------------------------
|
|    5. Framing
|
|    Use framing to write a query that will return:
|    * Each student's name.
|    * Their total score.
|    * Their tutor's name.
|    * The name of the student with the same tutor who had the highest total
|      score.
|
|    You can use your answer to 4 as a starting point (this is quite similar).
|
|    -----------------------------------------------------------------------
|
|    Extension:
|
|    * Once you've done this, add another column with the average total score
|      across all students with the same tutor and an equal or lower total.
|
*/ -----------------------------------------------------------------------------

-- TODO: Write your query here (remember to end it with a semicolon ;)


/* -----------------------------------------------------------------------------
|
|    6. Re-framing
|
|    Use framing to write a query that will return:
|    * Each student's name.
|    * Their maths score.
|    * The average maths score of the three people whose names are just before
|      the student's name in the alphabet.
|
*/ -----------------------------------------------------------------------------

-- TODO: Write your query here (remember to end it with a semicolon ;)


/* -----------------------------------------------------------------------------
|
|    7. Tidier Queries
|
|    Use a window clause WINDOW ... AS () to tidy up the query from question 3.
|
*/ -----------------------------------------------------------------------------

-- TODO: Copy the query from 3 and tidy it up here.
