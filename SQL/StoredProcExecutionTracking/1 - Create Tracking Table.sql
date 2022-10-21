-- Put this Tracking Table in the Database that you wish to track SP executions

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[StoredProcExecutionTracker](
	[ID] [INT] IDENTITY(1,1) NOT NULL,
	[LogTime] [DATETIME2](7) DEFAULT GETDATE() NOT NULL,
	[ProcName] [VARCHAR](100) NOT NULL,
	[Caller] [VARCHAR](100) NULL,
	[HostName] [VARCHAR](100) NULL,
	[AppString] [VARCHAR](150) NULL,
 CONSTRAINT [PK_ProcExecutionLog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


--- Index to your hearts content
