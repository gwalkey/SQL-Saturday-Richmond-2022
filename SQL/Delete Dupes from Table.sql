--- Delete DUPE PatientIDs (leave the newest/latest one by Identity Interger order)
;WITH CTE AS(
   SELECT [PatientID],ID,
	   RN = ROW_NUMBER() OVER(PARTITION BY PatientID ORDER BY ID desc)
   FROM dbo.Patients
)
DELETE FROM CTE WHERE RN > 1
