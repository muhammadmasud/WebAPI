USE [master]
GO
/****** Object:  Database [PersonalInfo]    Script Date: 10/6/2016 1:27:29 AM ******/
CREATE DATABASE [PersonalInfo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PersonalInfo', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\PersonalInfo.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PersonalInfo_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\PersonalInfo_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [PersonalInfo] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PersonalInfo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PersonalInfo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PersonalInfo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PersonalInfo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PersonalInfo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PersonalInfo] SET ARITHABORT OFF 
GO
ALTER DATABASE [PersonalInfo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PersonalInfo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PersonalInfo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PersonalInfo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PersonalInfo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PersonalInfo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PersonalInfo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PersonalInfo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PersonalInfo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PersonalInfo] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PersonalInfo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PersonalInfo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PersonalInfo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PersonalInfo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PersonalInfo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PersonalInfo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PersonalInfo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PersonalInfo] SET RECOVERY FULL 
GO
ALTER DATABASE [PersonalInfo] SET  MULTI_USER 
GO
ALTER DATABASE [PersonalInfo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PersonalInfo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PersonalInfo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PersonalInfo] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [PersonalInfo] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'PersonalInfo', N'ON'
GO
USE [PersonalInfo]
GO
/****** Object:  Table [dbo].[StudentInfo]    Script Date: 10/6/2016 1:27:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StudentInfo](
	[Id] [int] IDENTITY(1001,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Address] [varchar](50) NULL,
 CONSTRAINT [PK_StudentInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[StudentInfo] ON 

INSERT [dbo].[StudentInfo] ([Id], [FirstName], [LastName], [Phone], [Email], [Address]) VALUES (1001, N'Muhammad', N'Masud', N'23456789', N'me@muhammadmasud.info', N'Haluaghat')
INSERT [dbo].[StudentInfo] ([Id], [FirstName], [LastName], [Phone], [Email], [Address]) VALUES (1003, N'Mahadi', N'Hasan', N'47654', N'mahadi@muhammadmasud.info', N'Dhaka')
INSERT [dbo].[StudentInfo] ([Id], [FirstName], [LastName], [Phone], [Email], [Address]) VALUES (1006, N'Ashraful ', N'Islam', N'34567890', N'me@inof.com', N'Dhaka')
INSERT [dbo].[StudentInfo] ([Id], [FirstName], [LastName], [Phone], [Email], [Address]) VALUES (1007, N'Susmita', N'sarker', N'456789987', N'susmita@email.com', N'polton')
INSERT [dbo].[StudentInfo] ([Id], [FirstName], [LastName], [Phone], [Email], [Address]) VALUES (1011, N'Utpol', N'Das', N'567899654', N'kaupul@gmail.com', N'Comilla')
INSERT [dbo].[StudentInfo] ([Id], [FirstName], [LastName], [Phone], [Email], [Address]) VALUES (1014, N'Shofiqul', N'Islam', N'05389933', N'shofiq@gmail.com', N'ksa')
INSERT [dbo].[StudentInfo] ([Id], [FirstName], [LastName], [Phone], [Email], [Address]) VALUES (1017, N'Maruf', N'Hasan', N'019785565', N'maruf@gmail.com', N'mym')
INSERT [dbo].[StudentInfo] ([Id], [FirstName], [LastName], [Phone], [Email], [Address]) VALUES (1018, N'Asrifa', N'Masud', N'01992903922', N'asrifamasudtultul@gmail.com', N'Haluaghat')
INSERT [dbo].[StudentInfo] ([Id], [FirstName], [LastName], [Phone], [Email], [Address]) VALUES (1019, N'Anamul', N'Hosain', N'01992543922', N'anam@gmail.com', N'Gazipur')
SET IDENTITY_INSERT [dbo].[StudentInfo] OFF
/****** Object:  StoredProcedure [dbo].[spGetMatchingStudentName]    Script Date: 10/6/2016 1:27:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc  [dbo].[spGetMatchingStudentName]
@StudentName nvarchar(50)
as
begin
	select Name from StudentInfo
	where Name LIKE @StudentName + '%'
End
GO
USE [master]
GO
ALTER DATABASE [PersonalInfo] SET  READ_WRITE 
GO
