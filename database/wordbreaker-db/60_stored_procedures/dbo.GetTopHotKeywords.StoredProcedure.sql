/****** Object:  StoredProcedure [dbo].[GetTopHotKeywords]    Script Date: 2017/5/15 ¤W¤È 11:08:15 ******/
DROP PROCEDURE [dbo].[GetTopHotKeywords]
GO

/****** Object:  StoredProcedure [dbo].[GetTopHotKeywords]    Script Date: 2017/5/15 ¤W¤È 11:08:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Tom Tang
-- Create date: 2017-09-21
-- Description:	
-- Revision:
-- =============================================
CREATE PROCEDURE [dbo].[GetTopHotKeywords]
@pTop INT
AS
BEGIN
	SET NOCOUNT ON
	SELECT TOP (@pTop) * 
	FROM [KeyWords](NOLOCK)
	ORDER BY 
		HitCount DESC
END
GO
