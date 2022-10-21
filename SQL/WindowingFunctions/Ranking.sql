--- Ranking partitioned by Providence
USE AdventureWorks2019;

SELECT 
	PostalCode, 
	StateProvinceID,
    RANK() OVER (PARTITION BY StateProvinceID ORDER BY PostalCode ASC) AS RankingValue
FROM 
	Person.Address 
WHERE 
	StateProvinceID IN (23,46);

--- Dense Rank, DENSE RANK function I can generate a ranking value that does not skip values
USE AdventureWorks2019;

SELECT 
	PostalCode, 
	StateProvinceID,
    DENSE_RANK() OVER (PARTITION BY StateProvinceID ORDER BY PostalCode ASC) AS RankingValue
FROM 
	Person.Address 
WHERE 
	StateProvinceID IN (23,46);


---Ntile, The NTILE function splits a set of records into groups. 
USE AdventureWorks2019;

SELECT 
	PostalCode, 
	StateProvinceID,
    NTILE(2) OVER (ORDER BY PostalCode ASC) AS NTileValue
FROM 
	Person.Address 
WHERE 
	StateProvinceID IN (23,46);

---ROW_NUMBER, A Synthetic Identity Integer

USE AdventureWorks2019;

SELECT 
	ROW_NUMBER() OVER (ORDER BY PostalCode ASC) AS RowNumber,
	PostalCode, 
	StateProvinceID    
FROM 
	Person.Address 
WHERE 
	StateProvinceID IN (46,23);
