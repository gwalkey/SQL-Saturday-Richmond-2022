--- Creates Numbers table with 1 Milion Rows
WITH
    N1 AS (SELECT N1.n FROM (VALUES (1),(1),(1),(1),(1),(1),(1),(1),(1),(1)) AS N1 (n)),
    N2 AS (SELECT L.n FROM N1 AS L CROSS JOIN N1 AS R),
    N3 AS (SELECT L.n FROM N2 AS L CROSS JOIN N2 AS R),
    N4 AS (SELECT L.n FROM N3 AS L CROSS JOIN N2 AS R),
    N AS (SELECT ROW_NUMBER() OVER (ORDER BY n) AS n FROM N4)
SELECT
    -- Destination column type integer NOT NULL
    ISNULL(CONVERT(integer, N.n), 0) AS n
INTO dbo.Numbers
FROM N
OPTION (MAXDOP 1);

/*
(1000000 rows affected)
(16 rows affected)
(1 row affected)

 SQL Server Execution Times:
   CPU time = 734 ms,  elapsed time = 764 ms.
SQL Server parse and compile time: 
   CPU time = 0 ms, elapsed time = 0 ms.

 SQL Server Execution Times:
   CPU time = 0 ms,  elapsed time = 0 ms.

 SQL Server Execution Times:
   CPU time = 0 ms,  elapsed time = 0 ms.

*/
