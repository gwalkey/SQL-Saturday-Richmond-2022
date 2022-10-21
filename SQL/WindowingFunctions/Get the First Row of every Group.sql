--- http://dba.stackexchange.com/questions/6368/how-to-select-the-first-row-of-each-group/6369#6369
--- Get the First Row of every Group

WITH ORDERED AS
(
SELECT
    ID
,   Val
,   kind
,   ROW_NUMBER() OVER (PARTITION BY Val ORDER BY Kind ASC) AS rn
FROM
    mytable
)
SELECT
    ID
,   Val
,   Kind
FROM
    ORDERED
WHERE
    rn = 1;