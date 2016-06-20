CREATE TABLE [dbo].[Participants]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[MemberId] [int] NULL,
[EventId] [int] NOT NULL,
[JoinedOn] [datetimeoffset] NULL,
[Attended] [bit] NULL,
[FirstName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Participants] ADD CONSTRAINT [PK__Particip__3214EC0707020F21] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Participants] ADD CONSTRAINT [FK_Participants_Members] FOREIGN KEY ([MemberId]) REFERENCES [dbo].[Members] ([Id])
GO
ALTER TABLE [dbo].[Participants] ADD CONSTRAINT [FK_Participants_ToTable] FOREIGN KEY ([EventId]) REFERENCES [dbo].[Events] ([Id])
GO
