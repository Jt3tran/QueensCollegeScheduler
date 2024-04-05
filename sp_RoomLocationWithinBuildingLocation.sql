SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertRoomLocations]
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[RoomLocationWithinBuildingLocation] ([BuildingName], [RoomNumber])
    SELECT
        CASE
            WHEN LEN([Location]) = 0 AND (LEFT('Course (hr, crd)', 4) = 'BIOL' OR LEFT('Course (hr, crd)', 4) = 'CHEM' OR LEFT('Course (hr, crd)', 4) = 'MATH') THEN 'SB'
            WHEN LEN([Location]) = 0 THEN 'KY'
            ELSE LEFT([Location], 2) 
        END AS BuildingName,
        CASE 
            WHEN LEN([Location]) < 2 THEN CONVERT(VARCHAR(3), (FLOOR(RAND()*(300-100+1))+100))
            ELSE RIGHT([Location], LEN([Location]) - 3)
        END AS RoomNumber
    FROM [QueensClassSchedule].[Uploadfile].[CurrentSemesterCourseOfferings];
END;
GO
