/****** Скрипт для команды SelectTopNRows из среды SSMS  ******/

USE [Zhuldyz]
GO

/****** Object:  Table [dbo].[Countries]    Script Date: 28.10.2017 19:50:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Countries](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](10) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

  insert into [Zhuldyz].[dbo].[Countries] ([Code], [Name]) values ('1', 'Kazakhstan')
  insert into [Zhuldyz].[dbo].[Countries] ([Code], [Name]) values ('2', 'Russia')
  insert into [Zhuldyz].[dbo].[Countries] ([Code], [Name]) values ('3', 'USA')
  insert into [Zhuldyz].[dbo].[Countries] ([Code], [Name]) values ('4', 'Spain')
  insert into [Zhuldyz].[dbo].[Countries] ([Code], [Name]) values ('5', 'France')

