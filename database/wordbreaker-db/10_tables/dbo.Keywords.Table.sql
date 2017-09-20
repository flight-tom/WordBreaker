/****** Object:  Table [dbo].[Keywords]    Script Date: 2017/5/12 ¤U¤È 05:36:53 ******/
DROP TABLE [dbo].[Keywords]
GO

/****** Object:  Table [dbo].[VisitedUrls]    Script Date: 2017/5/12 ¤U¤È 05:36:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Keywords](
	[Keyword] [nvarchar](10) NOT NULL,
	[PositiveScore] [float] DEFAULT(0) NOT NULL,
	[SourceUrlID] [bigint] NOT NULL,
	[HitCount][bigint] DEFAULT(0) NOT NULL,
	[CreatedAt] [datetime] NOT NULL DEFAULT(GETDATE())
 CONSTRAINT [PK_KeyWords] PRIMARY KEY CLUSTERED 
(
	[KeyWord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


