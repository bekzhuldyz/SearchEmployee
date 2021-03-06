/****** Скрипт для команды SelectTopNRows из среды SSMS  ******/

USE [Zhuldyz]
GO

/****** Object:  Table [dbo].[Cities]    Script Date: 28.10.2017 19:49:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Cities](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](10) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CountryCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_Cities] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

  insert into [Zhuldyz].[dbo].[Cities] ([Code], [Name], [CountryCode]) values ('1', 'Almaty', '1')
  insert into [Zhuldyz].[dbo].[Cities] ([Code], [Name], [CountryCode]) values ('2', 'Astana', '1')

  insert into [Zhuldyz].[dbo].[Cities] ([Code], [Name], [CountryCode]) values ('3', 'Moscow', '2')
  insert into [Zhuldyz].[dbo].[Cities] ([Code], [Name], [CountryCode]) values ('4', 'Sankt-Peterburg', '2')

  insert into [Zhuldyz].[dbo].[Cities] ([Code], [Name], [CountryCode]) values ('5', 'New York', '3')
  insert into [Zhuldyz].[dbo].[Cities] ([Code], [Name], [CountryCode]) values ('6', 'Las Vegas', '3')

  insert into [Zhuldyz].[dbo].[Cities] ([Code], [Name], [CountryCode]) values ('7', 'Barselona', '4')
  insert into [Zhuldyz].[dbo].[Cities] ([Code], [Name], [CountryCode]) values ('8', 'Madrid', '4')

  insert into [Zhuldyz].[dbo].[Cities] ([Code], [Name], [CountryCode]) values ('9', 'Paris', '5')
  insert into [Zhuldyz].[dbo].[Cities] ([Code], [Name], [CountryCode]) values ('10', 'Lyon', '5')