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
    [source].guidd,
    [source].TimeAdded,
    [source].ExtraData
FROM 
	[source]
LEFT JOIN 
	[destination]
ON 
	[destination].id = [source].id
WHERE 
	[destination].id is null
