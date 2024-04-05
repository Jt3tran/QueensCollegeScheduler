SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--need to alter which schema it'll go into
CREATE TABLE [dbo].[RoomLocationWithinBuildingLocation](
	[BuildingName] [varchar](10) NOT NULL,
	[RoomNumber] [varchar](10) NOT NULL
) ON [PRIMARY]
GO
