/****** Object:  StoredProcedure [dbo].[DeleteKeywords]    Script Date: 2017/5/15 ¤W¤È 11:08:15 ******/
DROP PROCEDURE [dbo].[DeleteKeywords]
GO

/****** Object:  StoredProcedure [dbo].[DeleteKeywords]    Script Date: 2017/5/15 ¤W¤È 11:08:15 ******/
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
CREATE PROCEDURE [dbo].[DeleteKeywords]
@pHitCountThreshold BIGINT
AS
BEGIN
	DELETE [dbo].[KeyWords]
	WHERE HitCount < @pHitCountThreshold
END
GO
