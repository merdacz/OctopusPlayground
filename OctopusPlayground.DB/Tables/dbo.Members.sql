CREATE TABLE [dbo].[Members]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[FirstName] [nchar] (50) COLLATE Polish_CI_AS NOT NULL,
[LastName] [nchar] (50) COLLATE Polish_CI_AS NOT NULL,
[JoinedOn] [datetimeoffset] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Members] ADD CONSTRAINT [PK__Members__3214EC0703317E3D] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
