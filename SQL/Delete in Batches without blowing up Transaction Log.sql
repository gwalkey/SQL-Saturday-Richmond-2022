--- batch delete without blowing up the LOG file
SET QUOTED_IDENTIFIER ON

DECLARE @Deleted_Rows BIGINT;
SET @Deleted_Rows = 1;


WHILE (@Deleted_Rows > 0)
  BEGIN
   -- Delete some small number of rows at a time
	DELETE TOP (104857)
	FROM  [DBA].[dbo].[SysLog] WHERE [DateTime]<'10-01-2021' OPTION (MAXDOP 1)


  SELECT @Deleted_Rows= COUNT_BIG(*) 
	FROM  [DBA].[dbo].[SysLog] WHERE [DateTime]<'10-01-2021' OPTION (MAXDOP 1)

END

-- check the size of the data files
SELECT size / 128.0 AS sizeMB, name
FROM sys.database_files;
GO

CHECKPOINT
