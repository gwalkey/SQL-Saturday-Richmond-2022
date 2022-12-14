--- Create Login
USE [master]
GO
CREATE LOGIN [Domain\Joe.User] FROM WINDOWS WITH DEFAULT_DATABASE=[MyDatabase], DEFAULT_LANGUAGE=[us_english]
GO

-- Create Database User and link back to Login
USE [MyDatabase]
GO
CREATE USER [Domain\Joe.User] FOR LOGIN [Domain\Joe.User] WITH DEFAULT_SCHEMA=[dbo]
GO

-- Grant User the default reader/writer database roles
USE [MyDatabase]
ALTER ROLE [db_datareader] ADD MEMBER [Domain\Joe.User]
ALTER ROLE [db_datawriter] ADD MEMBER [Domain\Joe.User]

-- Optionally add User to [db_owner] Role
ALTER ROLE [db_owner] ADD MEMBER [JimmyDean]

--- Create Custom Database Role and Add User to it
USE [MyDatabase]
GO
CREATE ROLE GCWReader
GO
GRANT SELECT ON dbo.Table1 TO  GCWReader
GO
GRANT SELECT ON dbo.Table2 TO  GCWReader
GO
EXEC sp_addrolemember GCWReader , 'Domain\Joe.User'