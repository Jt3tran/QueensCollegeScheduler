DROP TABLE IF EXISTS [DbSecurity].[UserAuthorization];

DROP SCHEMA IF EXISTS DbSecurity
GO

CREATE SCHEMA DbSecurity
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [DbSecurity].[UserAuthorization](
    [UserAuthorizationKey] [int] NOT NULL,
    [ClassTime] [nchar](5) NULL,
    [IndividualProject] [nvarchar](60) NULL,
    [GroupMemberLastName] [nvarchar](35) NOT NULL,
    [GroupMemberFirstName] [nvarchar](25) NOT NULL,
    [GroupName] [nvarchar](20) NOT NULL,
    [DateAdded] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
    [UserAuthorizationKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

INSERT INTO DbSecurity.UserAuthorization(
    UserAuthorizationKey,
    ClassTime,
    IndividualProject,
    GroupMemberLastName,
    GroupMemberFirstName,
    GroupName
) VALUES
    (1, '09:15', 'Project 2', 'Jiang', 'Jason', 'Group 5'),
    (2, '09:15', 'Project 2', 'Cheng', 'Brandon', 'Group 5'),
    (3, '09:15', 'Project 2', 'Katayev', 'Josh', 'Group 5'),
    (4, '09:15', 'Project 2', 'Tran', 'Jordan', 'Group 5'),
    (5, '09:15', 'Project 2', 'Humaira', 'Mir', 'Group 5'),
    (6, '09:15', 'Project 2', 'Seenarine', 'Eric', 'Group 5')

GO