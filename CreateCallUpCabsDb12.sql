USE [master]
GO

/****** Object:  Database [CallUpCabs]    Script Date: 22-04-2020 13:28:02 ******/
DROP DATABASE IF EXISTS [CallUpCabs]
GO

/****** Object:  Database [CallUpCabs]    Script Date: 22-04-2020 13:28:02 ******/
CREATE DATABASE [CallUpCabs]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CallUpCabs', FILENAME = N'F:\SQL_DATA\CallUpCabs.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CallUpCabs_log', FILENAME = N'D:\SQL_LOGS\CallUpCabs_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CallUpCabs].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [CallUpCabs] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [CallUpCabs] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [CallUpCabs] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [CallUpCabs] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [CallUpCabs] SET ARITHABORT OFF 
GO

ALTER DATABASE [CallUpCabs] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [CallUpCabs] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [CallUpCabs] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [CallUpCabs] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [CallUpCabs] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [CallUpCabs] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [CallUpCabs] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [CallUpCabs] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [CallUpCabs] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [CallUpCabs] SET  ENABLE_BROKER 
GO

ALTER DATABASE [CallUpCabs] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [CallUpCabs] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [CallUpCabs] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [CallUpCabs] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [CallUpCabs] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [CallUpCabs] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [CallUpCabs] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [CallUpCabs] SET RECOVERY FULL 
GO

ALTER DATABASE [CallUpCabs] SET  MULTI_USER 
GO

ALTER DATABASE [CallUpCabs] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [CallUpCabs] SET DB_CHAINING OFF 
GO

ALTER DATABASE [CallUpCabs] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [CallUpCabs] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [CallUpCabs] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [CallUpCabs] SET QUERY_STORE = OFF
GO

ALTER DATABASE [CallUpCabs] SET  READ_WRITE 
GO


USE [CallUpCabs]
GO

/****** Object:  Table [dbo].[cab]    Script Date: 22-04-2020 13:37:33 ******/
DROP TABLE IF EXISTS [dbo].[cab]
GO

/****** Object:  Table [dbo].[cab]    Script Date: 22-04-2020 13:37:33 ******/
--Create cab table
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[cab](
	[cab_id] [numeric](18, 0) NOT NULL,		--Cab number
	[cab_owner] [nvarchar](50) NOT NULL,	--Owner name
	[cab_model] [nvarchar](50) NOT NULL,	--Cab model
	[milage] [numeric](18, 0) NOT NULL,		--milege km/hr
 CONSTRAINT [PK_cab] PRIMARY KEY CLUSTERED 
(
	[cab_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO



USE [CallUpCabs]
GO

/****** Object:  Table [dbo].[customer]    Script Date: 22-04-2020 13:43:20 ******/
DROP TABLE IF EXISTS [dbo].[customer]
GO

/****** Object:  Table [dbo].[customer]    Script Date: 22-04-2020 13:43:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[customer](
	[cust_id] [numeric](18, 0) NOT NULL,		--Customer phone number
	[cust_name] [nvarchar](50) NOT NULL,		--Customer name
	[cust_email] [nvarchar](50) NULL,			--Customer email Id
	[cust_address] [nvarchar](50) NOT NULL,		--Customer address
	[date] [smalldatetime] NOT NULL				--Date of joining
) ON [PRIMARY]
GO

USE [CallUpCabs]
GO

/****** Object:  Table [dbo].[driver]    Script Date: 22-04-2020 13:51:36 ******/
DROP TABLE IF EXISTS [dbo].[driver]
GO

/****** Object:  Table [dbo].[driver]    Script Date: 22-04-2020 13:51:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[driver](
	[driver_id] [nchar](10) NOT NULL,		--Driver id
	[cab_id] [nchar](10) NOT NULL,			--Cab id-cab number
	[driver_ph] [nchar](10) NOT NULL,		--Driver phone number
	[status] [nchar](10) NOT NULL,			--status -available/not
 CONSTRAINT [PK_driver] PRIMARY KEY CLUSTERED 
(
	[driver_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO



USE [CallUpCabs]
GO

/****** Object:  Table [dbo].[jouney]    Script Date: 22-04-2020 13:55:39 ******/
DROP TABLE IF EXISTS [dbo].[jouney]
GO

/****** Object:  Table [dbo].[jouney]    Script Date: 22-04-2020 13:55:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[jouney](
	[journey_id] [nchar](10) NOT NULL,		--Journey Id
	[cust_id] [nchar](10) NOT NULL,			--Customer phone number
	[driver_id] [nchar](10) NOT NULL,		--Driver Id
	[cab_id] [nchar](10) NOT NULL,			--Cab number
	[places] [nvarchar](max) NOT NULL,		--Places were visited
	[amount] [numeric](18, 0) NOT NULL		--Cost
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO




