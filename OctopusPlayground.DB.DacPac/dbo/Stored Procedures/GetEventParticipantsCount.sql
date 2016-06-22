
CREATE PROCEDURE GetEventParticipantsCount
	@EventId INT
AS
BEGIN
	SET NOCOUNT ON;

	SELECT COUNT(Id) FROM dbo.Participants
	WHERE EventId = @EventId
END
