CREATE TABLE [dbo].[Members] (
    [Id]        INT                IDENTITY (1, 1) NOT NULL,
    [FirstName] NCHAR (50)         NOT NULL,
    [LastName]  NCHAR (50)         NOT NULL,
    [JoinedOn]  DATETIMEOFFSET (7) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

