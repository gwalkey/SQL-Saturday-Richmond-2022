--- Example Window Function
SELECT 
	LogLevel, 
	COUNT(*) as GroupTotal,
    count(*) * 100.0/ sum(count(*)) over () as Level_Percent
FROM
	[dbo].[Table]
GROUP BY
	LogLevel