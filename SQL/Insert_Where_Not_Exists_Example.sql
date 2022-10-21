INSERT INTO 
	[Destination] 
(
	[id], 
	[guid], 
	[First], 
	[Last]
)
SELECT
    [source].id,
    [source].guid,
    [source].First,
    [source].Last
FROM 
	[source]
LEFT JOIN 
	[destination]
ON 
	[destination].id = [source].id
WHERE 
	[destination].id is NULL --- KEY Not IN Destination
