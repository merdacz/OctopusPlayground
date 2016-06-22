CREATE TABLE [dbo].[Surveys] (
    [Id]            INT           IDENTITY (1, 1) NOT NULL,
    [EventId]       INT           NOT NULL,
    [ParticipantId] INT           NOT NULL,
    [OverallRate]   SMALLINT      NOT NULL,
    [UsefulRate]    SMALLINT      NOT NULL,
    [VenueRate]     SMALLINT      NOT NULL,
    [Suggestions]   VARCHAR (MAX) NULL,
    [Email]         VARCHAR (50)  NULL,
    CONSTRAINT [PK_Surveys] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Surveys_Events] FOREIGN KEY ([EventId]) REFERENCES [dbo].[Events] ([Id]),
    CONSTRAINT [FK_Surveys_Members] FOREIGN KEY ([ParticipantId]) REFERENCES [dbo].[Members] ([Id])
);

