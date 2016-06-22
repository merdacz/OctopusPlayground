CREATE TABLE [dbo].[Events] (
    [Id]          INT                IDENTITY (1, 1) NOT NULL,
    [Name]        NVARCHAR (100)     NOT NULL,
    [StartDate]   DATETIMEOFFSET (7) NOT NULL,
    [EndDate]     DATETIMEOFFSET (7) NOT NULL,
    [Description] NVARCHAR (MAX)     NOT NULL,
    [Limit]       INT                NOT NULL,
    [SurveyStart] DATETIMEOFFSET (7) NULL,
    [SurveyEnd]   DATETIMEOFFSET (7) NULL,
    CONSTRAINT [PK__Events__3214EC077F60ED59] PRIMARY KEY CLUSTERED ([Id] ASC)
);

