/****** Object:  StoredProcedure [dbo].[InsertKeyword]    Script Date: 2017/5/15 ¤W¤È 11:08:15 ******/
DROP PROCEDURE [dbo].[InsertKeyword]
GO

/****** Object:  StoredProcedure [dbo].[InsertKeyword]    Script Date: 2017/5/15 ¤W¤È 11:08:15 ******/
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
CREATE PROCEDURE [dbo].[InsertKeyword]
@pKeyWord NVARCHAR(10),
@pPositiveScore FLOAT,
@pSourceUrlID BIGINT
AS
BEGIN
	IF NOT EXISTS(SELECT [KeyWord] FROM [KeyWords](NOLOCK) WHERE [KeyWord] = @pKeyWord) BEGIN
		INSERT INTO [dbo].[KeyWords](
			[KeyWord],
			[PositiveScore],
			[SourceUrlID])
		VALUES(
			@pKeyWord,
			@pPositiveScore,
			@pSourceUrlID)
	END ELSE BEGiN
		UPDATE [dbo].[KeyWords]
		SET 
			HitCount += 1,
			PositiveScore += @pPositiveScore
		WHERE Keyword = @pKeyWord
	END
END
GO
