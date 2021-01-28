/* -----------------------------------------------------------------------------
|
|    * Uncomment the line with SELECT pg_sleep(1), and save this file so the
|      queries are run. Look at the output from this transaction.
|
|      You should see a table displaying data about current locks.
|
|    * Follow the instructions in ex1_monitoring_locks.2.sql.
|
*/ -----------------------------------------------------------------------------

-- SELECT pg_sleep(1);  -- Give the other transaction time to acquire some locks

SELECT pg_locks.pid,
       pg_locks.locktype,
       pg_locks.mode,
       pg_locks.objid,
       pg_locks.granted,
       pg_class.relname
FROM pg_locks
LEFT JOIN pg_class
  ON pg_locks.relation = pg_class.oid;
