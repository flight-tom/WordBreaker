/****** Object:  Table [dbo].[VisitedUrls]    Script Date: 2017/5/12 ¤U¤È 05:36:53 ******/
DROP TABLE [dbo].[VisitedUrls]
GO

/****** Object:  Table [dbo].[VisitedUrls]    Script Date: 2017/5/12 ¤U¤È 05:36:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[VisitedUrls](
	[ID] [bigint] IDENTITY(1, 1),
	[Url] [varchar](500) NOT NULL,
	[Hmac] [varchar](50) NOT NULL,
	[CreatedAt] [datetime] NOT NULL DEFAULT(GETDATE())
 CONSTRAINT [PK_VisitedUrls] PRIMARY KEY CLUSTERED 
(
	[ID] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


