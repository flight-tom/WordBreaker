/****** Object:  StoredProcedure [dbo].[GetTopPositiveKeywords]    Script Date: 2017/5/15 ¤W¤È 11:08:15 ******/
DROP PROCEDURE [dbo].[GetTopPositiveKeywords]
GO

/****** Object:  StoredProcedure [dbo].[GetTopPositiveKeywords]    Script Date: 2017/5/15 ¤W¤È 11:08:15 ******/
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
CREATE PROCEDURE [dbo].[GetTopPositiveKeywords]
@pTop INT
AS
BEGIN
	SET NOCOUNT ON
	SELECT TOP (@pTop) * 
	FROM [KeyWords](NOLOCK)
	ORDER BY 
		PositiveScore DESC, 
		HitCount DESC
END
GO
