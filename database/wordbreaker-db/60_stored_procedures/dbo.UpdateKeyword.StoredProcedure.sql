/****** Object:  StoredProcedure [dbo].[UpdateKeyword]    Script Date: 2017/5/15 ¤W¤È 11:08:15 ******/
DROP PROCEDURE [dbo].[UpdateKeyword]
GO

/****** Object:  StoredProcedure [dbo].[UpdateKeyword]    Script Date: 2017/5/15 ¤W¤È 11:08:15 ******/
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
CREATE PROCEDURE [dbo].[UpdateKeyword]
@pKeyWord NVARCHAR(10),
@pPositiveScore FLOAT,
@pHitCountInc BIGINT
AS
BEGIN
	UPDATE [dbo].[KeyWords]
	SET 
		HitCount += @pHitCountInc,
		PositiveScore += @pPositiveScore
	WHERE Keyword = @pKeyWord
END
GO
