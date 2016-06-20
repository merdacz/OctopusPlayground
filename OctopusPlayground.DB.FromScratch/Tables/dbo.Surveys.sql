CREATE TABLE [dbo].[Surveys]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[EventId] [int] NOT NULL,
[ParticipantId] [int] NOT NULL,
[OverallRate] [smallint] NOT NULL,
[UsefulRate] [smallint] NOT NULL,
[VenueRate] [smallint] NOT NULL,
[Suggestions] [varchar] (max) COLLATE Polish_CI_AS NULL,
[Email] [varchar] (50) COLLATE Polish_CI_AS NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Surveys] ADD CONSTRAINT [PK_Surveys] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Surveys] ADD CONSTRAINT [FK_Surveys_Events] FOREIGN KEY ([EventId]) REFERENCES [dbo].[Events] ([Id])
GO
ALTER TABLE [dbo].[Surveys] ADD CONSTRAINT [FK_Surveys_Members] FOREIGN KEY ([ParticipantId]) REFERENCES [dbo].[Members] ([Id])
GO
