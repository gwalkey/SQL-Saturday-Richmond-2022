## SQL Code Snippets

### 
Update Table with join to another Table
UPDATE
	D
SET
    D.first = S.first,
	D.last = S.last
FROM
    Prescriber D
INNER JOIN
    Phyrel S
ON 
    d.ManagerName= s.distinguishedname
WHERE
	s.first <>d.first
	OR
	s.last <>d.last
