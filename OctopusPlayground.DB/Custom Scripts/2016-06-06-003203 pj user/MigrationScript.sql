/*
This migration script replaces uncommitted changes made to these objects:
Events

Use this script to make necessary schema and data changes for these objects only. Schema changes to any other objects won't be deployed.

Schema changes and migration scripts are deployed in the order they're committed.
*/

SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
PRINT N'Altering [dbo].[Events]'
GO

UPDATE [dbo].[Events] SET [Limit] = 1337 WHERE [Limit] IS NULL
GO

ALTER TABLE [dbo].[Events] ALTER COLUMN [Limit] [int] NOT NULL
GO

