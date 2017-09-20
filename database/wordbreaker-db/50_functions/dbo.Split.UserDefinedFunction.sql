/****** Object:  UserDefinedFunction [Split]    Script Date: 04/24/2013 11:19:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Split]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [Split]
GO

/****** Object:  UserDefinedFunction [Exchange].[Split]    Script Date: 04/24/2013 11:19:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author: S
-- Create date: 4/21
-- Description: 
-- Revision:
-- 2013-4-21: Initia
-- =============================================
CREATE FUNCTION [Split] (@sText varchar(max), 
@sDelim varchar(20) = '')
RETURNS @retArray TABLE (idx smallint Primary Key, value varchar(max))
AS
BEGIN
DECLARE @idx int,
@value varchar(max),
@bcontinue bit,
@iStrike int,
@iDelimlength int

IF @sDelim = 'Space'
BEGIN
SET @sDelim = ' '
END

SET @idx = 0
SET @sText = LTrim(RTrim(@sText))
SET @iDelimlength = DATALENGTH(@sDelim)
SET @bcontinue = 1

if(Len(@sText) = 0)
return

IF NOT ((@iDelimlength = 0) or (@sDelim = 'Empty'))
BEGIN
WHILE @bcontinue = 1
BEGIN

--If you can find the delimiter in the text, retrieve the first element and
--insert it with its index into the return table.

IF CHARINDEX(@sDelim, @sText)>0
BEGIN
SET @value = SUBSTRING(@sText,1, CHARINDEX(@sDelim,@sText)-1)
BEGIN
INSERT @retArray (idx, value)
VALUES (@idx, @value)
END

--Trim the element and its delimiter from the front of the string.
--Increment the index and loop.
SET @iStrike = DATALENGTH(@value) + @iDelimlength
SET @idx = @idx + 1
SET @sText = LTrim(Right(@sText,DATALENGTH(@sText) - @iStrike))

END
ELSE
BEGIN
--If you can't find the delimiter in the text, @sText is the last value in
--@retArray.
SET @value = @sText
BEGIN
INSERT @retArray (idx, value)
VALUES (@idx, @value)
END
--Exit the WHILE loop.
SET @bcontinue = 0
END
END
END
ELSE
BEGIN
WHILE @bcontinue=1
BEGIN
--If the delimiter is an empty string, check for remaining text
--instead of a delimiter. Insert the first character into the
--retArray table. Trim the character from the front of the string.
--Increment the index and loop.
IF DATALENGTH(@sText)>1
BEGIN
SET @value = SUBSTRING(@sText,1,1)
BEGIN
INSERT @retArray (idx, value)
VALUES (@idx, @value)
END
SET @idx = @idx+1
SET @sText = SUBSTRING(@sText,2,DATALENGTH(@sText)-1)

END
ELSE
BEGIN
--One character remains.
--Insert the character, and exit the WHILE loop.
INSERT @retArray (idx, value)
VALUES (@idx, @sText)
SET @bcontinue = 0
END
END

END

RETURN
END

GO


