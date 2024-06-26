USE [TSQLV4]
GO
/****** Object:  Schema [MyFunc]    Script Date: 2/26/2020 8:50:10 AM ******/
CREATE SCHEMA [MyFunc]
GO
/****** Object:  UserDefinedFunction [MyFunc].[AddMonthsToDate]    Script Date: 2/26/2020 8:50:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		yOUR Name
-- Create date: 
-- Description:	
-- =============================================
CREATE FUNCTION [MyFunc].[AddMonthsToDate]
(
	-- Add the parameters for the function here
	@TheDate DATE,
	@NumberOfMonths INT
)
RETURNS DATE
AS
BEGIN

	RETURN DATEADD(MONTH,@NumberOfMonths,@TheDate)

END
GO
/****** Object:  UserDefinedFunction [MyFunc].[AddThreeNumbers]    Script Date: 2/26/2020 8:50:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Your Name
-- Create date: 
-- Description:	
-- =============================================
CREATE FUNCTION [MyFunc].[AddThreeNumbers] 
(
	-- Add the parameters for the function here
	@Number1 INT,
	@Number2 INT,
	@Number3 INT
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result int

	-- Add the T-SQL statements to compute the return value here
	SELECT @Result = @Number1+@Number2+@Number3

	-- Return the result of the function
	RETURN @Result

END
GO
/****** Object:  UserDefinedFunction [MyFunc].[AverageTwoNumbers]    Script Date: 2/26/2020 8:50:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		yOUR Name
-- Create date: 
-- Description:	
-- =============================================
CREATE FUNCTION [MyFunc].[AverageTwoNumbers]
(
    -- Add the parameters for the function here
    @Number1 INT,
    @Number2 INT
)
RETURNS float
AS
BEGIN


    -- Return the result of the function
    RETURN (@Number1 + @Number2)/2.;

END;
GO
/****** Object:  UserDefinedFunction [MyFunc].[NumberOfDaysBetweenTwoDates]    Script Date: 2/26/2020 8:50:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Your Name
-- Create date: 
-- Description:	
-- =============================================
create FUNCTION [MyFunc].[NumberOfDaysBetweenTwoDates] 
(
	-- Add the parameters for the function here
	@StartDate Date,
	@EndDate Date
	
)
RETURNS int
AS
BEGIN
	-- Return the result of the function
	RETURN DATEDIFF(DAY,@StartDate,@EndDate)

END
GO
/****** Object:  Table [IntermediateStep].[IntersectionEmployeesCustomers]    Script Date: 2/26/2020 8:50:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [IntermediateStep].[IntersectionEmployeesCustomers](
	[country] [nvarchar](15) NOT NULL,
	[region] [nvarchar](15) NULL,
	[city] [nvarchar](15) NOT NULL
) ON [PRIMARY]
GO
