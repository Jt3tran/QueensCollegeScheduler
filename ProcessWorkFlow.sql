DROP SCHEMA IF EXISTS Process
GO

CREATE SCHEMA Process
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

DROP TABLE IF EXISTS [Process].[WorkflowSteps];

CREATE TABLE [Process].[WorkflowSteps](
	[WorkFlowStepKey] [int] NOT NULL,
	[WorkFlowStepDescription] [nvarchar](100) NOT NULL,
	[WorkFlowStepTableRowCount] [int] NULL,
	[StartingDateTime] [datetime2](7) NULL,
	[EndingDateTime] [datetime2](7) NULL,
	[Class Time] [char](5) NULL,
	[UserAuthorizationKey] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[WorkFlowStepKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO