USE [Database]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Joe User
-- Create date: Feb 30, 2027
-- Description:	Does Something Cool
-- =============================================
CREATE PROCEDURE [dbo].[usp_Do_Something_Cool]	
	@ID UNIQUEIDENTIFIER
	
AS
BEGIN
	SET NOCOUNT ON;

	--- Log Execution of this Stored Proc
	INSERT INTO dbo.StoredProcExecutionTracker
	(
		ProcName,
		Caller,
		HostName,
		AppString
	)
	SELECT   
			COALESCE(OBJECT_NAME(@@PROCID),'Interactive'),
			s.login_name,
			s.host_name,
			s.program_name
	FROM 
		sys.dm_exec_connections AS c  
	JOIN 
		sys.dm_exec_sessions AS s  
	ON 
		c.session_id = s.session_id  
	WHERE 
		c.session_id = @@SPID

	--- Do the other thing
	UPDATE 
		dbo.[TABLE]
	SET 
		FileLoadedDate=NULL, 
		FileProcessedDate=NULL, 
		processduration = NULL, 
		badfile=0, 
		BadType = NULL
	WHERE 
		id = @ID
END
GO





