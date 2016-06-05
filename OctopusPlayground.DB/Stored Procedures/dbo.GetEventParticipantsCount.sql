SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[GetEventParticipantsCount]
	@EventId INT
AS
BEGIN
	SET NOCOUNT ON;

	SELECT COUNT(Id) FROM dbo.Participants
	WHERE EventId = @EventId
END
GO
