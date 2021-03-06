USE [master]
GO
/****** Object:  Database [RegisterDB]    Script Date: 10/21/2017 23:48:42 ******/
CREATE DATABASE [RegisterDB] ON  PRIMARY 
( NAME = N'RegisterDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\RegisterDB.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'RegisterDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\RegisterDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [RegisterDB] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RegisterDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RegisterDB] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [RegisterDB] SET ANSI_NULLS OFF
GO
ALTER DATABASE [RegisterDB] SET ANSI_PADDING OFF
GO
ALTER DATABASE [RegisterDB] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [RegisterDB] SET ARITHABORT OFF
GO
ALTER DATABASE [RegisterDB] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [RegisterDB] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [RegisterDB] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [RegisterDB] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [RegisterDB] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [RegisterDB] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [RegisterDB] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [RegisterDB] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [RegisterDB] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [RegisterDB] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [RegisterDB] SET  DISABLE_BROKER
GO
ALTER DATABASE [RegisterDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [RegisterDB] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [RegisterDB] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [RegisterDB] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [RegisterDB] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [RegisterDB] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [RegisterDB] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [RegisterDB] SET  READ_WRITE
GO
ALTER DATABASE [RegisterDB] SET RECOVERY FULL
GO
ALTER DATABASE [RegisterDB] SET  MULTI_USER
GO
ALTER DATABASE [RegisterDB] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [RegisterDB] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'RegisterDB', N'ON'
GO
USE [RegisterDB]
GO
/****** Object:  Table [dbo].[TblEmployee]    Script Date: 10/21/2017 23:48:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TblEmployee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[Address] [varchar](50) NULL,
 CONSTRAINT [PK_TblEmployee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[TblEmployee] ON
INSERT [dbo].[TblEmployee] ([Id], [Name], [City], [Address]) VALUES (1, N'Sandip Das', N'Bangalore', N'Marathalli, Bangalore-37')
SET IDENTITY_INSERT [dbo].[TblEmployee] OFF
/****** Object:  StoredProcedure [dbo].[UpdateEmpDetails_SP]    Script Date: 10/21/2017 23:48:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[UpdateEmpDetails_SP]  
(  
   @EmpId int,  
   @Name varchar (50),  
   @City varchar (50),  
   @Address varchar (50)  
)  
as  
begin  
   Update TblEmployee   
   set Name=@Name,  
   City=@City,  
   Address=@Address  
   where Id=@EmpId  
End
GO
/****** Object:  StoredProcedure [dbo].[GetEmployees_SP]    Script Date: 10/21/2017 23:48:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[GetEmployees_SP]  
as  
begin  
   select * from TblEmployee  
End
GO
/****** Object:  StoredProcedure [dbo].[DeleteEmpById_SP]    Script Date: 10/21/2017 23:48:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[DeleteEmpById_SP]  
(  
   @EmpId int  
)  
as   
begin  
   Delete from TblEmployee where Id=@EmpId  
End
GO
/****** Object:  StoredProcedure [dbo].[AddNewEmpDetails_SP]    Script Date: 10/21/2017 23:48:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[AddNewEmpDetails_SP]  
(  
   @Name varchar (50),  
   @City varchar (50),  
   @Address varchar (50)  
)  
as  
begin  
   Insert into TblEmployee values(@Name,@City,@Address)  
End
GO
