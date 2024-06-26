USE [QueensClassSchedule]
GO
/****** Object:  StoredProcedure [dbo].[InsertBuildingLocations]    Script Date: 5/9/2023 11:01:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[InsertBuildingLocations]
AS
BEGIN
    SET NOCOUNT ON;
--SET IDENTITY_INSERT [Location].[BuildingLocation] ON
    INSERT INTO [Location].[BuildingLocation] (
		[BuildingLocationID], 
        [BuildingLocationName], 
        [UserAuthorizationKey], 
        [DateAdded], 
        [DateOfLastUpdate])
    SELECT
        CASE
            WHEN LEFT([Location], 2) = 'RE' THEN 'RE'
            WHEN LEFT([Location], 2) = 'KL' THEN 'KL'
            WHEN LEFT([Location], 2) = 'QC' THEN 'QC'
            WHEN LEFT([Location], 2) = 'KY' THEN 'KY'
            WHEN LEFT([Location], 2) = 'SB' THEN 'SB'
            ELSE 'Other'
        END AS [BuildingLocationID],
        CASE
            WHEN LEFT([Location], 2) = 'RE' THEN 'Remsen Hall'
            WHEN LEFT([Location], 2) = 'KL' THEN 'King Hall'
            WHEN LEFT([Location], 2) = 'QC' THEN 'Queens Hall'
            WHEN LEFT([Location], 2) = 'KY' THEN 'Kiely Hall'
            WHEN LEFT([Location], 2) = 'SB' THEN 'Science Building'
            ELSE 'Other'
        END AS [BuildingLocationName],
        'UserAuthorizationKey' AS [UserAuthorizationKey],
        GETDATE() AS [DateAdded],
        GETDATE() AS [DateOfLastUpdate]
    FROM [QueensClassSchedule].[Uploadfile].[CurrentSemesterCourseOfferings]
    WHERE LEFT([Location], 2) IN ('RE', 'KL', 'QC', 'KY', 'SB');
END;
--SET IDENTITY_INSERT [Location].[BuildingLocation] OFF