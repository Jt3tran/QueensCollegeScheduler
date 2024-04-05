USE [QueensClassSchedule]
GO
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP SCHEMA IF EXISTS Course
GO
CREATE SCHEMA Course
GO

DROP SCHEMA IF EXISTS Udt
GO
CREATE SCHEMA Udt
GO

-- Globals var

DROP TYPE IF EXISTS [UdtModeOfInstruction].[Name]
GO
DROP TYPE IF EXISTS [Udt].[SurrogateKeyInt]
GO
DROP TYPE IF EXISTS  [Udt].[DateOf]
GO
DROP TYPE IF EXISTS  [Udt].[Name]
GO

CREATE TYPE [Udt].[SurrogateKeyInt] FROM [int] NULL
GO
CREATE TYPE [Udt].[DateOf] FROM [datetime2](7) NOT NULL
GO
CREATE TYPE [Udt].[Name] FROM [nvarchar](35) NOT NULL
GO

DROP TABLE IF EXISTS [Course].[ModeOfInstruction]
GO

CREATE TABLE [Course].[ModeOfInstruction]
(
    [ModeOfInstructionID] [Udt].[SurrogateKeyInt] IDENTITY PRIMARY KEY,
    [ModeOfInstructionName] [Udt].[Name] NOT NULL UNIQUE,
    [UserAuthorizationKey] [Udt].[SurrogateKeyInt] NOT NULL,
    [DateAdded] [Udt].[DateOf] CONSTRAINT DF_ModeOfInstruction_DateAdded DEFAULT SYSDATETIME() NOT NULL,
    [DateOfLastUpdate] [Udt].[DateOf] CONSTRAINT DF_ModeOfInstruction_DateOfLastUpdate DEFAULT SYSDATETIME() NOT NULL
)

-- Indexing

IF EXISTS (SELECT * FROM sys.indexes WHERE name = 'idx_ModeOfInstructionID' AND object_id = OBJECT_ID('[Course].[ModeOfInstruction]'))
    DROP INDEX idx_ModeOfInstructionID ON [Course].[ModeOfInstruction];
    
CREATE CLUSTERED INDEX idx_ModeOfInstructionID 
ON [Course].[ModeOfInstruction](ModeOfInstructionID);

CREATE NONCLUSTERED INDEX idx_ModeOfInstructionName
ON [Course].[ModeOfInstruction](ModeOfInstructionName);

-- Altering table for adding constraints
ALTER TABLE [Course].[ModeOfInstruction]
ADD CONSTRAINT CK_UserAuthorizationKey CHECK ([UserAuthorizationKey] > 0);
GO -- add this to separate the CREATE PROCEDURE statement into its own batch

ALTER TABLE [Course].[ModeOfInstruction]
ADD CONSTRAINT CK_DateOfLastUpdate CHECK ([DateOfLastUpdate] >= [DateAdded])
GO


SELECT 
    schema_name(t.schema_id) AS schema_name,
    t.name AS table_name
FROM 
    sys.tables AS t
WHERE 
    t.name = 'WorkflowSteps';
