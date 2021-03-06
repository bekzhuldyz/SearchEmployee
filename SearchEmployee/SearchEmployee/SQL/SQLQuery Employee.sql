/****** Скрипт для команды SelectTopNRows из среды SSMS  ******/

USE [Zhuldyz]
GO

/****** Object:  Table [dbo].[Employee]    Script Date: 28.10.2017 19:51:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Employee](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[MiddleName] [nvarchar](50) NULL,
	[PhoneNumber] [nvarchar](30) NULL,
	[Email] [nvarchar](20) NOT NULL,
	[Country] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[IIN] [nvarchar](12) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

  insert into [Zhuldyz].[dbo].[Employee] ([Surname]
      ,[Name]
      ,[MiddleName]
      ,[PhoneNumber]
      ,[Email]
      ,[Country]
      ,[City]
      ,[IIN]) values ('Bek', 'Zhuldyz', 'Zhanaikyzy', '+7(778) 928-08-00', 'bekzhuldyz@gmail.com','1', '1', '911018401392')

insert into [Zhuldyz].[dbo].[Employee] ([Surname]
      ,[Name]
      ,[MiddleName]
      ,[PhoneNumber]
      ,[Email]
      ,[Country]
      ,[City]
      ,[IIN]) values ('Bek', 'Zhuldyz', '', '+7(778) 928-08-02', 'bekzhuldyz@gmail.com','1', '6', '911018401392')