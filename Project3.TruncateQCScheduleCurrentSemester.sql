USE [QueensClassSchedule]
GO

/****** Object:  StoredProcedure [Project3].[TruncateQCScheduleCurrentSemester]    Script Date: 5/8/2023 12:23:06 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Jordan Tran
-- Create date: 5/8/2023
-- Description:	Stored Procedure for TruncateQueensCollegeScheduleCurrentSemester
-- =============================================
CREATE   PROCEDURE [Project3].[TruncateQCScheduleCurrentSemester]
	@UserAuthorizationKey [Udt].[SurrogateKeyInt]

AS
BEGIN

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
		TRUNCATE TABLE [Department].Department;
		TRUNCATE TABLE [Department].Instructor;
		TRUNCATE TABLE [Course].Course;
		TRUNCATE TABLE [Course].Class;
		TRUNCATE TABLE [Course].ModeOfInstruction;
		TRUNCATE TABLE [Location].BuildingLocation;
		TRUNCATE TABLE [Location].RoomLocationWithinBuildingLocation;
		TRUNCATE TABLE Process.WorkflowSteps;

END
GO


