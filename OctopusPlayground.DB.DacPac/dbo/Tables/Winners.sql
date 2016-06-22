CREATE TABLE [dbo].[Winners] (
    [Id]            INT           NOT NULL,
    [ParticipantId] INT           NOT NULL,
    [Prize]         NVARCHAR (50) NULL,
    CONSTRAINT [PK_Winners] PRIMARY KEY CLUSTERED ([Id] ASC)
);

