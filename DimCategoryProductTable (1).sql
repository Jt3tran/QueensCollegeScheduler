DROP SCHEMA IF EXISTS [CH01-01-Dimension]
GO

CREATE SCHEMA [CH01-01-Dimension]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

DROP TABLE IF EXISTS [CH01-01-Dimension].[DimProductCategory];

CREATE TABLE [CH01-01-Dimension].[DimProductCategory](
	[ProductCategoryKey] [int] NOT NULL,
	[ProductCategory] [varchar](20) NULL,
	[UserAuthorizationKey] [int] NOT NULL,
	[DateAdded] [datetime2](7) NULL,
	[DateOfLastUpdate] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductCategoryKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

DROP TABLE IF EXISTS [CH01-01-Dimension].[DimProductSubCategory];

CREATE TABLE [CH01-01-Dimension].[DimProductSubCategory](
	[ProductSubcategoryKey] [int] NOT NULL,
	[ProductCategoryKey] [int] NOT NULL,
	[ProductSubcategory] [varchar](20) NULL,
	[UserAuthorizationKey] [int] NOT NULL,
	[DateAdded] [datetime2](7) NULL,
	[DateOfLastUpdate] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductSubcategoryKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

DROP TABLE IF EXISTS [CH01-01-Dimension].[DimProduct];

CREATE TABLE [CH01-01-Dimension].[DimProduct](
	[ProductKey] [int] NOT NULL,
	[ProductSubcategoryKey] [int] NULL,
	[ProductCategory] [varchar](20) NULL,
	[ProductSubcategory] [varchar](20) NULL,
	[ProductCode] [varchar](10) NULL,
	[ProductName] [varchar](40) NULL,
	[Color] [varchar](10) NULL,
	[ModelName] [varchar](30) NULL,
	[UserAuthorizationKey] [int] NOT NULL,
	[DateAdded] [datetime2](7) NULL,
	[DateOfLastUpdate] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO