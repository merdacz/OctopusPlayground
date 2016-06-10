CREATE TABLE [dbo].[Events]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[Name] [nvarchar] (100) COLLATE Polish_CI_AS NOT NULL,
[StartDate] [datetimeoffset] NOT NULL,
[EndDate] [datetimeoffset] NOT NULL,
[Description] [nvarchar] (max) COLLATE Polish_CI_AS NOT NULL,
[Limit] [int] NOT NULL,
[SurveyStart] [datetimeoffset] NULL,
[SurveyEnd] [datetimeoffset] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Events] ADD CONSTRAINT [PK__Events__3214EC077F60ED59] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
CREATE FULLTEXT INDEX ON [dbo].[Events] KEY INDEX [PK__Events__3214EC077F60ED59] ON [Test]
GO
ALTER FULLTEXT INDEX ON [dbo].[Events] ADD ([Description] LANGUAGE 1033)
GO
