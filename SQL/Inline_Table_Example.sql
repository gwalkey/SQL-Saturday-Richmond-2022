	SELECT * from (
		VALUES 
			('server1','win'),
			('server2','win'),
			('server3','win'),
			('dbcc','win'),
			('pbi','win'),
			('datamart','win'),
			('reportserver','win')			
		) AS t([Server],[auth])
