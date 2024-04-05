USE [QueensClassSchedule]
GO
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP SCHEMA IF EXISTS [Location]
GO

CREATE SCHEMA [Location]
GO

CREATE TYPE [Location].[SurrogateKeyInt] FROM [int] NULL
GO
CREATE TYPE [Location].[DateOf] FROM [datetime2](7) NOT NULL
GO
CREATE TYPE [Location].[Name] FROM [nvarchar](35) NOT NULL
GO


DROP SCHEMA IF EXISTS [BuildingLocation]
GO
CREATE SCHEMA [BuildingLocation]
GO 

CREATE TABLE [Location].[BuildingLocation](
	
	[BuildingLocationID][Location].[SurrogateKeyInt] IDENTITY PRIMARY KEY,
	[BuildingLocationName] [Location].[Name] NOT NULL UNIQUE,
	[UserAuthorizationKey] [Location].[SurrogateKeyInt] NOT NULL,
	[DateAdded] [Location].[DateOf] NOT NULL,
	[DateOfLastUpdate] [Location].[DateOf] NOT NULL
)

CREATE INDEX idx_BuildingLocationID
ON [Location].BuildingLocation(BuildingLocationID);

CREATE INDEX idx_BuildingLocationName
ON [Location].BuildingLocation(BuildingLocationName);

ALTER TABLE [Location].[BuildingLocation]
ADD CONSTRAINT CK_UserAuthorizationKey CHECK ([UserAuthorizationKey] > 0);
GO 
ALTER TABLE [Location].[BuildingLocation]
ADD CONSTRAINT CK_DateOfLastUpdate CHECK ([DateOfLastUpdate] >= [DateAdded])
GO
