USE [master]
GO
/****** Object:  Database [FinancialManagement]    Script Date: 2020/6/26 22:00:27 ******/
CREATE DATABASE [FinancialManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FinancialManagement', FILENAME = N'D:\Sqlserver\MSSQL15.MSSQLSERVER\MSSQL\DATA\FinancialManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FinancialManagement_log', FILENAME = N'D:\Sqlserver\MSSQL15.MSSQLSERVER\MSSQL\DATA\FinancialManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [FinancialManagement] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FinancialManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FinancialManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FinancialManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FinancialManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FinancialManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FinancialManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [FinancialManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FinancialManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FinancialManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FinancialManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FinancialManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FinancialManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FinancialManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FinancialManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FinancialManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FinancialManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FinancialManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FinancialManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FinancialManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FinancialManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FinancialManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FinancialManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FinancialManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FinancialManagement] SET RECOVERY FULL 
GO
ALTER DATABASE [FinancialManagement] SET  MULTI_USER 
GO
ALTER DATABASE [FinancialManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FinancialManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FinancialManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FinancialManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FinancialManagement] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'FinancialManagement', N'ON'
GO
ALTER DATABASE [FinancialManagement] SET QUERY_STORE = OFF
GO
USE [FinancialManagement]
GO
/****** Object:  Table [dbo].[debt]    Script Date: 2020/6/26 22:00:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[debt](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[借出方] [varchar](50) NOT NULL,
	[欠债方] [varchar](50) NOT NULL,
	[借款时间] [date] NOT NULL,
	[借款金额] [float] NOT NULL,
	[还款期限] [date] NOT NULL,
	[还款状态] [bit] NULL,
	[备注] [text] NOT NULL,
 CONSTRAINT [PK_debt] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[income]    Script Date: 2020/6/26 22:00:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[income](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[收入日期] [date] NOT NULL,
	[收入方式] [varchar](50) NULL,
	[金额] [float] NOT NULL,
	[收入项目] [varchar](50) NULL,
	[来源] [varchar](50) NULL,
	[收入人员] [varchar](50) NOT NULL,
	[备注] [text] NULL,
 CONSTRAINT [PK_incom] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[outcome]    Script Date: 2020/6/26 22:00:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[outcome](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[支出日期] [date] NOT NULL,
	[支出方式] [varchar](50) NULL,
	[金额] [float] NOT NULL,
	[支出项目] [varchar](50) NULL,
	[支出人员] [varchar](50) NOT NULL,
	[备注] [text] NULL,
 CONSTRAINT [PK_outcome] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[saving]    Script Date: 2020/6/26 22:00:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[saving](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[储蓄人] [varchar](50) NOT NULL,
	[存入时间] [date] NOT NULL,
	[到期时间] [date] NULL,
	[金额] [float] NULL,
	[年利率] [float] NULL,
	[所储银行] [varchar](50) NULL,
	[储蓄状态] [varchar](50) NULL,
	[备注] [text] NULL,
 CONSTRAINT [PK_saving] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SystemUsers]    Script Date: 2020/6/26 22:00:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemUsers](
	[uname] [varchar](20) NOT NULL,
	[pwd] [varchar](50) NOT NULL,
	[isAdmin] [bit] NOT NULL,
	[role] [varchar](20) NOT NULL,
	[gender] [varchar](10) NOT NULL,
 CONSTRAINT [PK_SystemUsers] PRIMARY KEY CLUSTERED 
(
	[uname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[debt] ADD  CONSTRAINT [DF_debt_还款状态]  DEFAULT ((0)) FOR [还款状态]
GO
USE [master]
GO
ALTER DATABASE [FinancialManagement] SET  READ_WRITE 
GO
