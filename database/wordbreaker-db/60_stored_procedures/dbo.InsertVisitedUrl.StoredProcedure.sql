/****** Object:  StoredProcedure [dbo].[InsertVisitedUrl]    Script Date: 2017/5/15 ¤W¤È 11:08:15 ******/
DROP PROCEDURE [dbo].[InsertVisitedUrl]
GO

/****** Object:  StoredProcedure [dbo].[InsertVisitedUrl]    Script Date: 2017/5/15 ¤W¤È 11:08:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Tom Tang
-- Create date: 2017-09-20
-- Description:	
-- Revision:
-- =============================================
CREATE PROCEDURE [dbo].[InsertVisitedUrl]
@pUrl VARCHAR(500),
@pHmac VARCHAR(50),
@oID BIGINT OUTPUT
AS
BEGIN
	SET NOCOUNT ON;
	IF NOT EXISTS(SELECT [ID] FROM [VisitedUrls](NOLOCK) WHERE [Url] = @pUrl) BEGIN
		INSERT INTO [dbo].[VisitedUrls](
			[Url],
			[Hmac])
		VALUES(
			@pUrl,
			@pHmac)

		SET @oID = SCOPE_IDENTITY()
	END ELSE BEGIN
		SET @oID = 0
	END
END
GO
