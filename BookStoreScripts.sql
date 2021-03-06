use master
go

Create database BookStore
go

use BookStore
go

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Author](
	[Id] [int] NOT NULL,
	[FirstName] [nvarchar](20) NULL,
	[LastName] [nvarchar](20) NULL,
	[Address] [nvarchar](50) NULL,
	[Phone] [nchar](10) NULL,
	[Email] [nvarchar](50) NULL,
 CONSTRAINT [PK_Author] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Author] ([Id], [FirstName], [LastName], [Address], [Phone], [Email]) VALUES (1, N'Thành', N'Dương', N'Hậu Giang', N'0984461466', N'dhthanhqa@gmail.com')
INSERT [dbo].[Author] ([Id], [FirstName], [LastName], [Address], [Phone], [Email]) VALUES (2, N'Lê', N'Nguyễn', N'Tp.HCM', N'0984461467', N'lenguyen@gmail.com')
INSERT [dbo].[Author] ([Id], [FirstName], [LastName], [Address], [Phone], [Email]) VALUES (3, N'Nam', N'Võ', N'Long An', N'0984461468', N'namvo@gmail.com')
/****** Object:  Table [dbo].[Category]    Script Date: 04/08/2021 08:10:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] NOT NULL,
	[CategoryName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (1, N'Tin học')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (2, N'Ngoại ngữ')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (3, N'Chính trị')
/****** Object:  StoredProcedure [dbo].[Top3Authors]    Script Date: 04/08/2021 08:10:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Top3Authors]
as
	select top 3 *
	from Author
GO
/****** Object:  StoredProcedure [dbo].[CountAuthors]    Script Date: 04/08/2021 08:10:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[CountAuthors]
as
	select COUNT(*)
	from Author
GO
/****** Object:  Table [dbo].[Book]    Script Date: 04/08/2021 08:10:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[BookID] [int] NOT NULL,
	[BookName] [nvarchar](50) NULL,
	[CategoryID] [int] NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[BookID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Book] ([BookID], [BookName], [CategoryID]) VALUES (1, N'CSDL', 1)
INSERT [dbo].[Book] ([BookID], [BookName], [CategoryID]) VALUES (2, N'LTCSDL', 1)
INSERT [dbo].[Book] ([BookID], [BookName], [CategoryID]) VALUES (3, N'LTGD', 1)
INSERT [dbo].[Book] ([BookID], [BookName], [CategoryID]) VALUES (4, N'Anh văn 1', 2)
/****** Object:  Table [dbo].[BookAuthor]    Script Date: 04/08/2021 08:10:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookAuthor](
	[BookID] [int] NOT NULL,
	[AuthorID] [int] NOT NULL,
	[PublishDate] [date] NULL,
 CONSTRAINT [PK_BookAuthor] PRIMARY KEY CLUSTERED 
(
	[BookID] ASC,
	[AuthorID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [PublishDate]) VALUES (1, 1, CAST(0x843F0B00 AS Date))
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [PublishDate]) VALUES (1, 2, CAST(0x843F0B00 AS Date))
INSERT [dbo].[BookAuthor] ([BookID], [AuthorID], [PublishDate]) VALUES (2, 1, CAST(0x6C410B00 AS Date))
/****** Object:  ForeignKey [FK_Book_Category]    Script Date: 04/08/2021 08:10:16 ******/
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_Category]
GO
/****** Object:  ForeignKey [FK_BookAuthor_Author]    Script Date: 04/08/2021 08:10:16 ******/
ALTER TABLE [dbo].[BookAuthor]  WITH CHECK ADD  CONSTRAINT [FK_BookAuthor_Author] FOREIGN KEY([AuthorID])
REFERENCES [dbo].[Author] ([Id])
GO
ALTER TABLE [dbo].[BookAuthor] CHECK CONSTRAINT [FK_BookAuthor_Author]
GO
/****** Object:  ForeignKey [FK_BookAuthor_Book]    Script Date: 04/08/2021 08:10:16 ******/
ALTER TABLE [dbo].[BookAuthor]  WITH CHECK ADD  CONSTRAINT [FK_BookAuthor_Book] FOREIGN KEY([BookID])
REFERENCES [dbo].[Book] ([BookID])
GO
ALTER TABLE [dbo].[BookAuthor] CHECK CONSTRAINT [FK_BookAuthor_Book]
GO
