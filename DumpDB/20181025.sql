USE [master]
GO
/****** Object:  Database [Chat]    Script Date: 10/25/2018 8:37:08 PM ******/
CREATE DATABASE [Chat]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Chat', FILENAME = N'C:\Workshop\Chat.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Chat_log', FILENAME = N'C:\Workshop\Chat_log.ldf' , SIZE = 3456KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Chat] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Chat].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Chat] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Chat] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Chat] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Chat] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Chat] SET ARITHABORT OFF 
GO
ALTER DATABASE [Chat] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Chat] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Chat] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Chat] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Chat] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Chat] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Chat] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Chat] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Chat] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Chat] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Chat] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Chat] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Chat] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Chat] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Chat] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Chat] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Chat] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Chat] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Chat] SET  MULTI_USER 
GO
ALTER DATABASE [Chat] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Chat] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Chat] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Chat] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Chat] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Chat]
GO
/****** Object:  Table [dbo].[tblChatCaNhan]    Script Date: 10/25/2018 8:37:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblChatCaNhan](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[MaNguoiDung1] [int] NOT NULL,
	[MaNguoiDung2] [int] NOT NULL,
	[NoiDungChat] [nvarchar](500) NULL,
	[NgayTao] [datetime] NULL,
	[NguoiChat] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblChuDe]    Script Date: 10/25/2018 8:37:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblChuDe](
	[MaChuDe] [int] IDENTITY(1,1) NOT NULL,
	[TenChuDe] [nvarchar](255) NULL,
	[NgayTao] [datetime] NOT NULL CONSTRAINT [DF_tblChuDe_NgayTao]  DEFAULT (getdate()),
 CONSTRAINT [PK_tblChuDe] PRIMARY KEY CLUSTERED 
(
	[MaChuDe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblNguoiDung]    Script Date: 10/25/2018 8:37:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNguoiDung](
	[MaNguoiDung] [int] IDENTITY(1,1) NOT NULL,
	[TaiKhoanNguoiDung] [nvarchar](30) NULL,
	[MatKhau] [nvarchar](30) NULL,
	[Email] [nvarchar](50) NULL,
	[Quyen] [int] NULL CONSTRAINT [DF_tblnguoidung_Quyen]  DEFAULT ((2)),
	[NgayTao] [datetime] NULL CONSTRAINT [DF_tblnguoidung_NgayTao]  DEFAULT (getdate()),
	[GioiTinh] [int] NULL,
 CONSTRAINT [PK_tblnguoidung] PRIMARY KEY CLUSTERED 
(
	[MaNguoiDung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblNguoiDung_tblChuDe]    Script Date: 10/25/2018 8:37:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNguoiDung_tblChuDe](
	[MaChat] [int] IDENTITY(1,1) NOT NULL,
	[MaNguoiDung] [int] NOT NULL,
	[MaChuDe] [int] NOT NULL,
	[TaoChuDe] [int] NULL CONSTRAINT [DF_tblNguoiDung_tblChuDe_TaoChuDe]  DEFAULT ((0)),
	[NoiDungChat] [nvarchar](500) NULL,
	[NgayTao] [datetime] NULL CONSTRAINT [DF_tblNguoiDung_tblChuDe_NgayTao]  DEFAULT (getdate()),
 CONSTRAINT [PK_tblNguoiDung_tblChuDe_1] PRIMARY KEY CLUSTERED 
(
	[MaChat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[tblChatCaNhan] ON 

INSERT [dbo].[tblChatCaNhan] ([Id], [MaNguoiDung1], [MaNguoiDung2], [NoiDungChat], [NgayTao], [NguoiChat]) VALUES (1, 5, 1, N'sdf', CAST(N'2018-10-25 17:44:24.690' AS DateTime), 1)
INSERT [dbo].[tblChatCaNhan] ([Id], [MaNguoiDung1], [MaNguoiDung2], [NoiDungChat], [NgayTao], [NguoiChat]) VALUES (2, 5, 1, N'sdfsdf', CAST(N'2018-10-25 17:44:32.917' AS DateTime), 1)
INSERT [dbo].[tblChatCaNhan] ([Id], [MaNguoiDung1], [MaNguoiDung2], [NoiDungChat], [NgayTao], [NguoiChat]) VALUES (3, 5, 1, N'sdfsdfsdfsdf', CAST(N'2018-10-25 17:44:34.990' AS DateTime), 1)
INSERT [dbo].[tblChatCaNhan] ([Id], [MaNguoiDung1], [MaNguoiDung2], [NoiDungChat], [NgayTao], [NguoiChat]) VALUES (4, 5, 1, N'sdfsdfsdfsdf', CAST(N'2018-10-25 17:44:36.390' AS DateTime), 1)
INSERT [dbo].[tblChatCaNhan] ([Id], [MaNguoiDung1], [MaNguoiDung2], [NoiDungChat], [NgayTao], [NguoiChat]) VALUES (5, 3, 1, N'sdfsdf', CAST(N'2018-10-25 17:46:52.377' AS DateTime), 1)
INSERT [dbo].[tblChatCaNhan] ([Id], [MaNguoiDung1], [MaNguoiDung2], [NoiDungChat], [NgayTao], [NguoiChat]) VALUES (6, 3, 1, N'from haily', CAST(N'2018-10-25 17:47:20.627' AS DateTime), 3)
SET IDENTITY_INSERT [dbo].[tblChatCaNhan] OFF
SET IDENTITY_INSERT [dbo].[tblChuDe] ON 

INSERT [dbo].[tblChuDe] ([MaChuDe], [TenChuDe], [NgayTao]) VALUES (1, N'con cua con bo la con gi', CAST(N'2011-06-06 16:40:59.227' AS DateTime))
INSERT [dbo].[tblChuDe] ([MaChuDe], [TenChuDe], [NgayTao]) VALUES (2, N'mua he nong qua', CAST(N'2011-06-07 11:10:41.230' AS DateTime))
INSERT [dbo].[tblChuDe] ([MaChuDe], [TenChuDe], [NgayTao]) VALUES (3, N'mua he', CAST(N'2011-06-08 09:49:53.767' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblChuDe] OFF
SET IDENTITY_INSERT [dbo].[tblNguoiDung] ON 

INSERT [dbo].[tblNguoiDung] ([MaNguoiDung], [TaiKhoanNguoiDung], [MatKhau], [Email], [Quyen], [NgayTao], [GioiTinh]) VALUES (1, N'david', N'1', N'mr@v.zz', 1, CAST(N'2011-06-06 16:39:44.020' AS DateTime), 1)
INSERT [dbo].[tblNguoiDung] ([MaNguoiDung], [TaiKhoanNguoiDung], [MatKhau], [Email], [Quyen], [NgayTao], [GioiTinh]) VALUES (3, N'haily', N'1', N'haily@a.com', 0, CAST(N'2011-06-07 11:02:36.587' AS DateTime), 0)
INSERT [dbo].[tblNguoiDung] ([MaNguoiDung], [TaiKhoanNguoiDung], [MatKhau], [Email], [Quyen], [NgayTao], [GioiTinh]) VALUES (4, N'alice', N'1234', N'3@a.com', 0, CAST(N'2011-06-08 09:49:23.543' AS DateTime), 1)
INSERT [dbo].[tblNguoiDung] ([MaNguoiDung], [TaiKhoanNguoiDung], [MatKhau], [Email], [Quyen], [NgayTao], [GioiTinh]) VALUES (5, N'alice123', N'123', N'a@a.b', 0, CAST(N'2011-06-08 10:10:32.253' AS DateTime), 1)
INSERT [dbo].[tblNguoiDung] ([MaNguoiDung], [TaiKhoanNguoiDung], [MatKhau], [Email], [Quyen], [NgayTao], [GioiTinh]) VALUES (6, N'deptrai', N'12', N'a@s.s', 0, CAST(N'2011-06-08 16:22:57.950' AS DateTime), 1)
INSERT [dbo].[tblNguoiDung] ([MaNguoiDung], [TaiKhoanNguoiDung], [MatKhau], [Email], [Quyen], [NgayTao], [GioiTinh]) VALUES (7, N'deptrai', N'123', N'a@s.s', 0, CAST(N'2011-06-08 16:25:20.567' AS DateTime), 1)
INSERT [dbo].[tblNguoiDung] ([MaNguoiDung], [TaiKhoanNguoiDung], [MatKhau], [Email], [Quyen], [NgayTao], [GioiTinh]) VALUES (9, N'nguyen hai ly', N'1', N'a@ss.com', 0, CAST(N'2011-06-13 00:56:17.620' AS DateTime), 0)
INSERT [dbo].[tblNguoiDung] ([MaNguoiDung], [TaiKhoanNguoiDung], [MatKhau], [Email], [Quyen], [NgayTao], [GioiTinh]) VALUES (10, N'hanh', N'1', N'hanh@a.com', 0, CAST(N'2011-06-13 15:53:40.987' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[tblNguoiDung] OFF
SET IDENTITY_INSERT [dbo].[tblNguoiDung_tblChuDe] ON 

INSERT [dbo].[tblNguoiDung_tblChuDe] ([MaChat], [MaNguoiDung], [MaChuDe], [TaoChuDe], [NoiDungChat], [NgayTao]) VALUES (1, 1, 1, 1, N'cac bac oi biet con con bo la gi ko?
', CAST(N'2011-06-06 16:40:59.243' AS DateTime))
INSERT [dbo].[tblNguoiDung_tblChuDe] ([MaChat], [MaNguoiDung], [MaChuDe], [TaoChuDe], [NoiDungChat], [NgayTao]) VALUES (2, 3, 2, 1, N'nhiệt độ lên đến gần 40 độ :D', CAST(N'2011-06-07 11:10:41.400' AS DateTime))
INSERT [dbo].[tblNguoiDung_tblChuDe] ([MaChat], [MaNguoiDung], [MaChuDe], [TaoChuDe], [NoiDungChat], [NgayTao]) VALUES (3, 4, 3, 1, N'troi nong', CAST(N'2011-06-08 09:49:53.843' AS DateTime))
INSERT [dbo].[tblNguoiDung_tblChuDe] ([MaChat], [MaNguoiDung], [MaChuDe], [TaoChuDe], [NoiDungChat], [NgayTao]) VALUES (4, 1, 2, 0, N'alo', CAST(N'2011-06-10 13:43:33.993' AS DateTime))
INSERT [dbo].[tblNguoiDung_tblChuDe] ([MaChat], [MaNguoiDung], [MaChuDe], [TaoChuDe], [NoiDungChat], [NgayTao]) VALUES (5, 1, 1, 0, N'thanh', CAST(N'2011-06-11 00:58:28.360' AS DateTime))
INSERT [dbo].[tblNguoiDung_tblChuDe] ([MaChat], [MaNguoiDung], [MaChuDe], [TaoChuDe], [NoiDungChat], [NgayTao]) VALUES (6, 4, 1, 0, N'ducanh', CAST(N'2011-06-11 01:01:07.727' AS DateTime))
INSERT [dbo].[tblNguoiDung_tblChuDe] ([MaChat], [MaNguoiDung], [MaChuDe], [TaoChuDe], [NoiDungChat], [NgayTao]) VALUES (7, 4, 1, 0, N'Thanh vị', CAST(N'2011-06-11 01:01:27.113' AS DateTime))
INSERT [dbo].[tblNguoiDung_tblChuDe] ([MaChat], [MaNguoiDung], [MaChuDe], [TaoChuDe], [NoiDungChat], [NgayTao]) VALUES (8, 1, 1, 0, N'haiz', CAST(N'2011-06-11 07:15:21.773' AS DateTime))
INSERT [dbo].[tblNguoiDung_tblChuDe] ([MaChat], [MaNguoiDung], [MaChuDe], [TaoChuDe], [NoiDungChat], [NgayTao]) VALUES (9, 1, 1, 0, N'hihi', CAST(N'2011-06-11 07:15:33.753' AS DateTime))
INSERT [dbo].[tblNguoiDung_tblChuDe] ([MaChat], [MaNguoiDung], [MaChuDe], [TaoChuDe], [NoiDungChat], [NgayTao]) VALUES (10, 1, 1, 0, N'chao ban', CAST(N'2011-06-11 07:16:00.090' AS DateTime))
INSERT [dbo].[tblNguoiDung_tblChuDe] ([MaChat], [MaNguoiDung], [MaChuDe], [TaoChuDe], [NoiDungChat], [NgayTao]) VALUES (11, 1, 1, 0, N'chao ban', CAST(N'2011-06-11 07:17:26.880' AS DateTime))
INSERT [dbo].[tblNguoiDung_tblChuDe] ([MaChat], [MaNguoiDung], [MaChuDe], [TaoChuDe], [NoiDungChat], [NgayTao]) VALUES (12, 1, 1, 0, N'chao ban', CAST(N'2011-06-11 07:30:27.140' AS DateTime))
INSERT [dbo].[tblNguoiDung_tblChuDe] ([MaChat], [MaNguoiDung], [MaChuDe], [TaoChuDe], [NoiDungChat], [NgayTao]) VALUES (13, 1, 1, 0, N'chao ban', CAST(N'2011-06-11 07:31:13.003' AS DateTime))
INSERT [dbo].[tblNguoiDung_tblChuDe] ([MaChat], [MaNguoiDung], [MaChuDe], [TaoChuDe], [NoiDungChat], [NgayTao]) VALUES (14, 1, 1, 0, N'chao ban', CAST(N'2011-06-11 07:32:18.850' AS DateTime))
INSERT [dbo].[tblNguoiDung_tblChuDe] ([MaChat], [MaNguoiDung], [MaChuDe], [TaoChuDe], [NoiDungChat], [NgayTao]) VALUES (15, 1, 1, 0, N'hi', CAST(N'2011-06-11 07:32:51.820' AS DateTime))
INSERT [dbo].[tblNguoiDung_tblChuDe] ([MaChat], [MaNguoiDung], [MaChuDe], [TaoChuDe], [NoiDungChat], [NgayTao]) VALUES (16, 1, 1, 0, N'chao ban', CAST(N'2011-06-11 07:33:15.360' AS DateTime))
INSERT [dbo].[tblNguoiDung_tblChuDe] ([MaChat], [MaNguoiDung], [MaChuDe], [TaoChuDe], [NoiDungChat], [NgayTao]) VALUES (17, 4, 1, 0, N'ducanh', CAST(N'2011-06-11 07:33:45.087' AS DateTime))
INSERT [dbo].[tblNguoiDung_tblChuDe] ([MaChat], [MaNguoiDung], [MaChuDe], [TaoChuDe], [NoiDungChat], [NgayTao]) VALUES (18, 9, 3, 0, N'chao ban alice', CAST(N'2011-06-13 01:02:23.090' AS DateTime))
INSERT [dbo].[tblNguoiDung_tblChuDe] ([MaChat], [MaNguoiDung], [MaChuDe], [TaoChuDe], [NoiDungChat], [NgayTao]) VALUES (19, 10, 1, 0, N'', CAST(N'2011-06-13 15:54:42.933' AS DateTime))
INSERT [dbo].[tblNguoiDung_tblChuDe] ([MaChat], [MaNguoiDung], [MaChuDe], [TaoChuDe], [NoiDungChat], [NgayTao]) VALUES (20, 1, 2, 0, N'', CAST(N'2011-06-14 09:59:36.813' AS DateTime))
INSERT [dbo].[tblNguoiDung_tblChuDe] ([MaChat], [MaNguoiDung], [MaChuDe], [TaoChuDe], [NoiDungChat], [NgayTao]) VALUES (21, 1, 2, 0, N'', CAST(N'2011-06-14 10:08:16.333' AS DateTime))
INSERT [dbo].[tblNguoiDung_tblChuDe] ([MaChat], [MaNguoiDung], [MaChuDe], [TaoChuDe], [NoiDungChat], [NgayTao]) VALUES (22, 1, 2, 0, N'a', CAST(N'2011-06-14 10:08:42.080' AS DateTime))
INSERT [dbo].[tblNguoiDung_tblChuDe] ([MaChat], [MaNguoiDung], [MaChuDe], [TaoChuDe], [NoiDungChat], [NgayTao]) VALUES (23, 1, 2, 0, N'', CAST(N'2011-06-14 10:08:46.603' AS DateTime))
INSERT [dbo].[tblNguoiDung_tblChuDe] ([MaChat], [MaNguoiDung], [MaChuDe], [TaoChuDe], [NoiDungChat], [NgayTao]) VALUES (24, 1, 2, 0, N'', CAST(N'2011-06-14 10:14:23.190' AS DateTime))
INSERT [dbo].[tblNguoiDung_tblChuDe] ([MaChat], [MaNguoiDung], [MaChuDe], [TaoChuDe], [NoiDungChat], [NgayTao]) VALUES (25, 1, 2, 0, N'', CAST(N'2011-06-14 10:14:35.290' AS DateTime))
INSERT [dbo].[tblNguoiDung_tblChuDe] ([MaChat], [MaNguoiDung], [MaChuDe], [TaoChuDe], [NoiDungChat], [NgayTao]) VALUES (26, 1, 1, 0, N'alice', CAST(N'2011-06-15 22:35:12.473' AS DateTime))
INSERT [dbo].[tblNguoiDung_tblChuDe] ([MaChat], [MaNguoiDung], [MaChuDe], [TaoChuDe], [NoiDungChat], [NgayTao]) VALUES (27, 1, 1, 0, N'a', CAST(N'2011-06-17 09:48:28.477' AS DateTime))
INSERT [dbo].[tblNguoiDung_tblChuDe] ([MaChat], [MaNguoiDung], [MaChuDe], [TaoChuDe], [NoiDungChat], [NgayTao]) VALUES (28, 1, 1, 0, N'a', CAST(N'2011-06-17 09:49:23.357' AS DateTime))
INSERT [dbo].[tblNguoiDung_tblChuDe] ([MaChat], [MaNguoiDung], [MaChuDe], [TaoChuDe], [NoiDungChat], [NgayTao]) VALUES (29, 1, 1, 0, N'a', CAST(N'2011-06-17 09:50:23.863' AS DateTime))
INSERT [dbo].[tblNguoiDung_tblChuDe] ([MaChat], [MaNguoiDung], [MaChuDe], [TaoChuDe], [NoiDungChat], [NgayTao]) VALUES (30, 1, 1, 0, N'a', CAST(N'2011-06-17 09:50:53.003' AS DateTime))
INSERT [dbo].[tblNguoiDung_tblChuDe] ([MaChat], [MaNguoiDung], [MaChuDe], [TaoChuDe], [NoiDungChat], [NgayTao]) VALUES (31, 1, 1, 0, N'ab', CAST(N'2011-06-17 09:50:57.557' AS DateTime))
INSERT [dbo].[tblNguoiDung_tblChuDe] ([MaChat], [MaNguoiDung], [MaChuDe], [TaoChuDe], [NoiDungChat], [NgayTao]) VALUES (32, 1, 1, 0, N'ab', CAST(N'2011-06-17 09:52:06.820' AS DateTime))
INSERT [dbo].[tblNguoiDung_tblChuDe] ([MaChat], [MaNguoiDung], [MaChuDe], [TaoChuDe], [NoiDungChat], [NgayTao]) VALUES (33, 1, 1, 0, N'ab', CAST(N'2011-06-17 09:52:21.517' AS DateTime))
INSERT [dbo].[tblNguoiDung_tblChuDe] ([MaChat], [MaNguoiDung], [MaChuDe], [TaoChuDe], [NoiDungChat], [NgayTao]) VALUES (34, 1, 3, 0, N'sdfsdf', CAST(N'2018-09-16 23:00:57.783' AS DateTime))
INSERT [dbo].[tblNguoiDung_tblChuDe] ([MaChat], [MaNguoiDung], [MaChuDe], [TaoChuDe], [NoiDungChat], [NgayTao]) VALUES (35, 1, 3, 0, N'sdfsdf', CAST(N'2018-09-16 23:01:17.437' AS DateTime))
INSERT [dbo].[tblNguoiDung_tblChuDe] ([MaChat], [MaNguoiDung], [MaChuDe], [TaoChuDe], [NoiDungChat], [NgayTao]) VALUES (36, 10, 3, 0, N'hello', CAST(N'2018-09-16 23:01:47.820' AS DateTime))
INSERT [dbo].[tblNguoiDung_tblChuDe] ([MaChat], [MaNguoiDung], [MaChuDe], [TaoChuDe], [NoiDungChat], [NgayTao]) VALUES (37, 1, 3, 0, N'hello im david', CAST(N'2018-09-20 09:16:37.010' AS DateTime))
INSERT [dbo].[tblNguoiDung_tblChuDe] ([MaChat], [MaNguoiDung], [MaChuDe], [TaoChuDe], [NoiDungChat], [NgayTao]) VALUES (38, 1, 3, 0, N'dfdf', CAST(N'2018-10-25 16:44:17.153' AS DateTime))
INSERT [dbo].[tblNguoiDung_tblChuDe] ([MaChat], [MaNguoiDung], [MaChuDe], [TaoChuDe], [NoiDungChat], [NgayTao]) VALUES (39, 1, 3, 0, N'dfdffsdfsdf', CAST(N'2018-10-25 16:44:20.780' AS DateTime))
INSERT [dbo].[tblNguoiDung_tblChuDe] ([MaChat], [MaNguoiDung], [MaChuDe], [TaoChuDe], [NoiDungChat], [NgayTao]) VALUES (40, 3, 3, 0, N'from haily', CAST(N'2018-10-25 16:49:11.660' AS DateTime))
INSERT [dbo].[tblNguoiDung_tblChuDe] ([MaChat], [MaNguoiDung], [MaChuDe], [TaoChuDe], [NoiDungChat], [NgayTao]) VALUES (41, 1, 3, 0, N'from david', CAST(N'2018-10-25 16:49:25.860' AS DateTime))
INSERT [dbo].[tblNguoiDung_tblChuDe] ([MaChat], [MaNguoiDung], [MaChuDe], [TaoChuDe], [NoiDungChat], [NgayTao]) VALUES (42, 3, 3, 0, N'from haily', CAST(N'2018-10-25 16:49:35.507' AS DateTime))
INSERT [dbo].[tblNguoiDung_tblChuDe] ([MaChat], [MaNguoiDung], [MaChuDe], [TaoChuDe], [NoiDungChat], [NgayTao]) VALUES (43, 3, 3, 0, N'from hailysdfsdf', CAST(N'2018-10-25 16:49:45.917' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblNguoiDung_tblChuDe] OFF
ALTER TABLE [dbo].[tblChatCaNhan]  WITH CHECK ADD FOREIGN KEY([MaNguoiDung1])
REFERENCES [dbo].[tblNguoiDung] ([MaNguoiDung])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblChatCaNhan]  WITH CHECK ADD FOREIGN KEY([MaNguoiDung2])
REFERENCES [dbo].[tblNguoiDung] ([MaNguoiDung])
GO
ALTER TABLE [dbo].[tblNguoiDung_tblChuDe]  WITH CHECK ADD  CONSTRAINT [FK_tblNguoiDung_tblChuDe_tblChuDe] FOREIGN KEY([MaChuDe])
REFERENCES [dbo].[tblChuDe] ([MaChuDe])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblNguoiDung_tblChuDe] CHECK CONSTRAINT [FK_tblNguoiDung_tblChuDe_tblChuDe]
GO
ALTER TABLE [dbo].[tblNguoiDung_tblChuDe]  WITH CHECK ADD  CONSTRAINT [FK_tblNguoiDung_tblChuDe_tblNguoiDung] FOREIGN KEY([MaNguoiDung])
REFERENCES [dbo].[tblNguoiDung] ([MaNguoiDung])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblNguoiDung_tblChuDe] CHECK CONSTRAINT [FK_tblNguoiDung_tblChuDe_tblNguoiDung]
GO
USE [master]
GO
ALTER DATABASE [Chat] SET  READ_WRITE 
GO
