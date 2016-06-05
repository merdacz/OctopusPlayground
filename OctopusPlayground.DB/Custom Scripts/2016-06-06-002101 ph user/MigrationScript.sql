/*
This migration script replaces uncommitted changes made to these objects:
Participants

Use this script to make necessary schema and data changes for these objects only. Schema changes to any other objects won't be deployed.

Schema changes and migration scripts are deployed in the order they're committed.
*/

SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
PRINT N'Dropping foreign keys from [dbo].[Participants]'
GO
ALTER TABLE [dbo].[Participants] DROP CONSTRAINT [FK_Participants_ToTable]
GO
PRINT N'Dropping constraints from [dbo].[Participants]'
GO
ALTER TABLE [dbo].[Participants] DROP CONSTRAINT [PK__Particip__3214EC0707020F21]
GO
PRINT N'Rebuilding [dbo].[Participants]'
GO
CREATE TABLE [dbo].[RG_Recovery_1_Participants]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[MemberId] [int] NOT NULL,
[EventId] [int] NOT NULL,
[JoinedOn] [datetimeoffset] NULL,
[Attended] [bit] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[RG_Recovery_1_Participants] ON
GO
INSERT INTO [dbo].[RG_Recovery_1_Participants]([Id], [MemberId], [EventId], [JoinedOn], [Attended]) SELECT [Id], 1, [EventId], [JoinedOn], NULL FROM [dbo].[Participants]
GO
SET IDENTITY_INSERT [dbo].[RG_Recovery_1_Participants] OFF
GO
DECLARE @idVal BIGINT
SELECT @idVal = IDENT_CURRENT(N'[dbo].[Participants]')
IF @idVal IS NOT NULL
    DBCC CHECKIDENT(N'[dbo].[RG_Recovery_1_Participants]', RESEED, @idVal)
GO
DROP TABLE [dbo].[Participants]
GO
EXEC sp_rename N'[dbo].[RG_Recovery_1_Participants]', N'Participants', N'OBJECT'
GO
PRINT N'Creating primary key [PK__Particip__3214EC0707020F21] on [dbo].[Participants]'
GO
ALTER TABLE [dbo].[Participants] ADD CONSTRAINT [PK__Particip__3214EC0707020F21] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
PRINT N'Adding foreign keys to [dbo].[Participants]'
GO
ALTER TABLE [dbo].[Participants] ADD CONSTRAINT [FK_Participants_Members] FOREIGN KEY ([MemberId]) REFERENCES [dbo].[Members] ([Id])
GO
ALTER TABLE [dbo].[Participants] ADD CONSTRAINT [FK_Participants_ToTable] FOREIGN KEY ([EventId]) REFERENCES [dbo].[Events] ([Id])
GO

