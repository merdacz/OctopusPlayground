/*
This migration script replaces uncommitted changes made to these objects:
Winners

Use this script to make necessary schema and data changes for these objects only. Schema changes to any other objects won't be deployed.

Schema changes and migration scripts are deployed in the order they're committed.
*/

SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
PRINT N'Dropping constraints from [dbo].[Winners]'
GO
ALTER TABLE [dbo].[Winners] DROP CONSTRAINT [PK_Winners]
GO
PRINT N'Rebuilding [dbo].[Winners]'
GO
CREATE TABLE [dbo].[RG_Recovery_1_Winners]
(
[Id] [int] NOT NULL,
[ParticipantId] [int] NOT NULL,
[Prize] [nvarchar] (50) COLLATE Polish_CI_AS NULL,
[Comment] [nvarchar] (max) COLLATE Polish_CI_AS NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT INTO [dbo].[RG_Recovery_1_Winners]([Id], [ParticipantId], [Prize], [Comment]) 
SELECT [Id], [ParticipantId], [Prize], 'some test comment' FROM [dbo].[Winners]
GO
DROP TABLE [dbo].[Winners]
GO
EXEC sp_rename N'[dbo].[RG_Recovery_1_Winners]', N'Winners', N'OBJECT'
GO
PRINT N'Creating primary key [PK_Winners] on [dbo].[Winners]'
GO
ALTER TABLE [dbo].[Winners] ADD CONSTRAINT [PK_Winners] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO

