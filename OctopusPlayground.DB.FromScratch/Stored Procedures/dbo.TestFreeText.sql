SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE PROCEDURE [dbo].[TestFreeText]
	@term nvarchar (200)
AS
BEGIN
	SET NOCOUNT ON;
	/* some more change */
	SELECT * FROM [Events] /* WHERE CONTAINS([Description], @term) */
END


GO
