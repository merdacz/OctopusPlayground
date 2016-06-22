

CREATE PROCEDURE [dbo].[TestFreeText]
	@term nvarchar (200)
AS
BEGIN
	SET NOCOUNT ON;
	/* some more change */
	SELECT * FROM [Events] WHERE CONTAINS([Description], @term) 
END

