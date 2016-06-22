CREATE TABLE [dbo].[Participants] (
    [Id]        INT                IDENTITY (1, 1) NOT NULL,
    [MemberId]  INT                NULL,
    [FirstName] NVARCHAR (50)      COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
    [LastName]  NVARCHAR (50)      COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
    [EventId]   INT                NOT NULL,
    [JoinedOn]  DATETIMEOFFSET (7) NULL,
    [Attended]  BIT                NULL,
    CONSTRAINT [PK__Particip__3214EC0707020F21] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Participants_Members] FOREIGN KEY ([MemberId]) REFERENCES [dbo].[Members] ([Id]),
    CONSTRAINT [FK_Participants_ToTable] FOREIGN KEY ([EventId]) REFERENCES [dbo].[Events] ([Id])
);

