/* -----------------------------------------------------------------------------
|
|    Ex 2. Date and time formatting
|
|    * Complete the three TODOs below so that the final query shows two "True" values.
|
*/ -----------------------------------------------------------------------------

-- Take a string and parse it as a timestamp with a time zone.
-- ISO time zone of -8 is equivalent to America/Los_Angeles
SELECT TIMESTAMP WITH TIME ZONE '10 January 1999 5:30-8' AS moment
INTO exercise_datetime;

-- TODO 1. add a statement to this file so that `moment` is considered equal to the string `10/01/1999 13:30:00 UTC`.


-- TODO 2. Convert "moment" in the expression below to the America/Los_Angeles timezone to localise the time to Los Angeles
-- TODO 3. Edit the format string below, so that it results in '99, 10 Jan at 05:30'
SELECT to_char(moment, 'YOUR FORMAT STRING') AS formatted
INTO formatted_datetime
FROM exercise_datetime;

-- Don't edit this query. It's here to show you whether you've got the formatting correct.
SELECT moment,
       moment = '10/01/1999 13:30:00 UTC' AS is_first_column_correct,
       formatted,
       formatted = '99, 10 Jan at 05:30' AS is_third_column_correct
FROM exercise_datetime
CROSS JOIN formatted_datetime;
