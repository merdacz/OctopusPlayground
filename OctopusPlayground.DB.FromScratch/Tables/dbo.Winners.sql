CREATE TABLE [dbo].[Winners]
(
[Id] [int] NOT NULL,
[ParticipantId] [int] NOT NULL,
[Prize] [nvarchar] (50) COLLATE Polish_CI_AS NULL,
[Test] [bit] NULL,
[Comments] [nvarchar] (100) COLLATE Polish_CI_AS NOT NULL,
[Test2] [bit] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Winners] ADD CONSTRAINT [PK_Winners] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
