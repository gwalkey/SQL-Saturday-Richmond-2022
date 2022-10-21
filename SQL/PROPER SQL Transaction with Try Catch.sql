--- Sample SQL Transaction
SET XACT_ABORT ON

BEGIN TRANSACTION [Tran1]

BEGIN TRY

	--- Do Something fun and dangerous to trip the CATCH
	select 1/0

END TRY

BEGIN CATCH
	If @@TRANCOUNT>0
	begin
		--- Rollback
		ROLLBACK TRANSACTION [Tran1]

		--- Inform Client
		select 
	    ERROR_NUMBER() AS ErrorNumber,
        ERROR_SEVERITY() AS ErrorSeverity,
        ERROR_STATE() AS ErrorState,
        ERROR_PROCEDURE() AS ErrorProcedure,
        ERROR_LINE() AS ErrorLine,
        ERROR_MESSAGE() AS ErrorMessage

	end
END CATCH  

--- Commit
if @@TRANCOUNT>0
	COMMIT TRANSACTION [Tran1]


