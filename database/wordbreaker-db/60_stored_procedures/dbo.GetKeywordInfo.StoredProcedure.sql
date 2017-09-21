/****** Object:  StoredProcedure [dbo].[GetKeywordInfo]    Script Date: 2017/5/15 ¤W¤È 11:08:15 ******/
DROP PROCEDURE [dbo].[GetKeywordInfo]
GO

/****** Object:  StoredProcedure [dbo].[GetKeywordInfo]    Script Date: 2017/5/15 ¤W¤È 11:08:15 ******/
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
CREATE PROCEDURE [dbo].[GetKeywordInfo]
@pKeyword NVARCHAR(10)
AS
BEGIN
	SET NOCOUNT ON
	SELECT 
		kw.*, vu.[Url]
	FROM 
		[KeyWords] kw(NOLOCK)
		INNER JOIN [VisitedUrls] vu(NOLOCK) ON kw.SourceUrlID = vu.ID
	WHERE
		Keyword = @pKeyword
END
GO
