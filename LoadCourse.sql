USE [QueensClassSchedule]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP SCHEMA IF EXISTS Project3;
GO

CREATE SCHEMA Project3;
GO


CREATE OR ALTER PROCEDURE [Project3].[Load_Course]
	@UserAuthorizationKey [Udt].[SurrogateKeyInt]

AS
BEGIN

	SET NOCOUNT ON;

	DECLARE @DateAdded [Udt].[DateOf];
	SET @DateAdded = sysdatetime();

	SET IDENTITY_INSERT Course.Course ON;

INSERT INTO [Course].[Course] (
	[CourseID],
    [CourseSection],
    [CourseCode],
    [CourseInfo],
    [CourseDescription],
    [CourseDays],
    [CourseTime],
    [CourseEnrolled],
    [CourseLimit],
    [UserAuthorizationKey],
    [DateAdded],
    [DateOfLastUpdate]
)
SELECT
	ROW_NUMBER() OVER (ORDER BY Sec) AS CourseID,
    Sec AS CourseSection,
    Code AS CourseCode,
	[Course (hr, crd)] AS CourseInfo,
    [Description] AS CourseDescription,
    [Day] AS CourseDays,
    [Time] AS CourseTime,
    [Enrolled] AS CourseEnrolled,
    [Limit] AS CourseLimit,
    @UserAuthorizationKey AS UserAuthorizationKey,
    GETDATE() AS DateAdded,
    GETDATE() AS DateOfLastUpdate
FROM [Uploadfile].[CurrentSemesterCourseOfferings]

SET IDENTITY_INSERT Course.Course OFF;

END
