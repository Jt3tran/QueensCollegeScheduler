USE [QueensClassSchedule]
GO

/****** Object:  StoredProcedure [Project3].[TruncateQCScheduleCurrentSemester]    Script Date: 5/8/2023 12:23:06 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP SCHEMA IF EXISTS Project3;
GO

CREATE SCHEMA Project3;
GO
-- =============================================
-- Author:		Jordan Tran
-- Procedure: [Project3].[Load_ModeOfInstruction]
-- Create date: 5/8/2023
-- Description:	[Project3].[Load_ModeOfInstruction]
-- =============================================


CREATE PROCEDURE [Project3].[Load_ModeOfInstruction]
	@UserAuthorizationKey [Udt].[SurrogateKeyInt]
AS
BEGIN
    INSERT INTO [Course].[ModeOfInstruction] (ModeOfInstructionName, UserAuthorizationKey, DateAdded, DateOfLastUpdate)
    SELECT DISTINCT [Mode of Instruction], @UserAuthorizationKey, SYSDATETIME(), SYSDATETIME()
    FROM [QueensClassSchedule].[Uploadfile].[CurrentSemesterCourseOfferings]
    WHERE [Mode of Instruction] NOT IN (SELECT ModeOfInstructionName FROM [Course].[ModeOfInstruction]);

END
GO


