
USE [master]
GO
/****** Object:  Database [GarageManagement]    Script Date: 08/15/2020 17:18:07 ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'GarageManagement')
BEGIN
CREATE DATABASE [GarageManagement] ON  PRIMARY 
( NAME = N'GarageManagement.mdf', FILENAME = N'C:\Facul CCT\FinalProject\GarageManagement\GarageManagement\App_Data\GarageManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GarageManagement_log.ldf', FILENAME = N'C:\Facul CCT\FinalProject\GarageManagement\GarageManagement\App_Data\GarageManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
END
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GarageManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GarageManagement] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [GarageManagement] SET ANSI_NULLS OFF
GO
ALTER DATABASE [GarageManagement] SET ANSI_PADDING OFF
GO
ALTER DATABASE [GarageManagement] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [GarageManagement] SET ARITHABORT OFF
GO
ALTER DATABASE [GarageManagement] SET AUTO_CLOSE ON
GO
ALTER DATABASE [GarageManagement] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [GarageManagement] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [GarageManagement] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [GarageManagement] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [GarageManagement] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [GarageManagement] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [GarageManagement] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [GarageManagement] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [GarageManagement] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [GarageManagement] SET  ENABLE_BROKER
GO
ALTER DATABASE [GarageManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [GarageManagement] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [GarageManagement] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [GarageManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [GarageManagement] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [GarageManagement] SET READ_COMMITTED_SNAPSHOT ON
GO
ALTER DATABASE [GarageManagement] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [GarageManagement] SET  READ_WRITE
GO
ALTER DATABASE [GarageManagement] SET RECOVERY SIMPLE
GO
ALTER DATABASE [GarageManagement] SET  MULTI_USER
GO
ALTER DATABASE [GarageManagement] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [GarageManagement] SET DB_CHAINING OFF
GO
USE [GarageManagement]
GO
/****** Object:  Table [dbo].[EngineType]    Script Date: 08/15/2020 17:18:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EngineType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EngineType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 08/15/2020 17:18:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customer]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Customer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[Surname] [varchar](100) NULL,
	[BirthDate] [date] NULL,
	[ContactNumber] [varchar](10) NULL,
	[UserId] [nvarchar](128) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 08/15/2020 17:18:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Brands]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Brands](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BookingTypes]    Script Date: 08/15/2020 17:18:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BookingTypes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[BookingTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 08/15/2020 17:18:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND name = N'UserNameIndex')
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers] 
(
	[UserName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 08/15/2020 17:18:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND name = N'RoleNameIndex')
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles] 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 08/15/2020 17:18:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[__MigrationHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ServicesAndParts]    Script Date: 08/15/2020 17:18:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ServicesAndParts]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ServicesAndParts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[Price] [decimal](6, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[VehicleType]    Script Date: 08/15/2020 17:18:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[VehicleType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[VehicleType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Status]    Script Date: 08/15/2020 17:18:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Status]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Status](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 08/15/2020 17:18:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Staff]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Staff](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[Surname] [varchar](100) NULL,
	[BirthDate] [date] NULL,
	[ContactNumber] [varchar](10) NULL,
	[UserId] [nvarchar](128) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Makes]    Script Date: 08/15/2020 17:18:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Makes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Makes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VehicleTypeId] [int] NOT NULL,
	[Name] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 08/15/2020 17:18:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND name = N'IX_RoleId')
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles] 
(
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND name = N'IX_UserId')
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles] 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 08/15/2020 17:18:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND name = N'IX_UserId')
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins] 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 08/15/2020 17:18:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND name = N'IX_UserId')
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims] 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bookings]    Script Date: 08/15/2020 17:18:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Bookings]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Bookings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Make] [varchar](100) NULL,
	[BookingTypeId] [int] NOT NULL,
	[DueDate] [date] NULL,
	[StatusId] [int] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[Observation] [varchar](1000) NULL,
	[VRC] [varchar](100) NULL,
	[VLC] [varchar](100) NULL,
	[EngineTypeId] [int] NOT NULL,
	[VehicleTypeId] [int] NOT NULL,
	[StaffId] [int] NULL,
	[Licence] [varchar](100) NULL,
	[BasicCost] [decimal](6, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[booking_cost]    Script Date: 08/15/2020 17:18:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[booking_cost]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[booking_cost](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BookingId] [int] NOT NULL,
	[ServicesAndPartsId] [int] NOT NULL,
	[Price] [decimal](6, 2) NULL,
	[Qtd] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Default [DF__Bookings__Status__6D0D32F4]    Script Date: 08/15/2020 17:18:10 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__Bookings__Status__6D0D32F4]') AND parent_object_id = OBJECT_ID(N'[dbo].[Bookings]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Bookings__Status__6D0D32F4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Bookings] ADD  DEFAULT ((1)) FOR [StatusId]
END


End
GO
/****** Object:  ForeignKey [FK__Staff__UserId__3F466844]    Script Date: 08/15/2020 17:18:10 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Staff__UserId__3F466844]') AND parent_object_id = OBJECT_ID(N'[dbo].[Staff]'))
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
/****** Object:  ForeignKey [FK__Makes__VehicleTy__3C69FB99]    Script Date: 08/15/2020 17:18:10 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Makes__VehicleTy__3C69FB99]') AND parent_object_id = OBJECT_ID(N'[dbo].[Makes]'))
ALTER TABLE [dbo].[Makes]  WITH CHECK ADD FOREIGN KEY([VehicleTypeId])
REFERENCES [dbo].[VehicleType] ([Id])
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]    Script Date: 08/15/2020 17:18:10 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]    Script Date: 08/15/2020 17:18:10 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]    Script Date: 08/15/2020 17:18:10 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]    Script Date: 08/15/2020 17:18:10 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
/****** Object:  ForeignKey [FK__Bookings__Bookin__6E01572D]    Script Date: 08/15/2020 17:18:10 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Bookings__Bookin__6E01572D]') AND parent_object_id = OBJECT_ID(N'[dbo].[Bookings]'))
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD FOREIGN KEY([BookingTypeId])
REFERENCES [dbo].[BookingTypes] ([Id])
GO
/****** Object:  ForeignKey [FK__Bookings__Custom__6EF57B66]    Script Date: 08/15/2020 17:18:10 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Bookings__Custom__6EF57B66]') AND parent_object_id = OBJECT_ID(N'[dbo].[Bookings]'))
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
/****** Object:  ForeignKey [FK__Bookings__Engine__70DDC3D8]    Script Date: 08/15/2020 17:18:10 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Bookings__Engine__70DDC3D8]') AND parent_object_id = OBJECT_ID(N'[dbo].[Bookings]'))
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD FOREIGN KEY([EngineTypeId])
REFERENCES [dbo].[EngineType] ([Id])
GO
/****** Object:  ForeignKey [FK__Bookings__StaffI__72C60C4A]    Script Date: 08/15/2020 17:18:10 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Bookings__StaffI__72C60C4A]') AND parent_object_id = OBJECT_ID(N'[dbo].[Bookings]'))
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD FOREIGN KEY([StaffId])
REFERENCES [dbo].[Staff] ([Id])
GO
/****** Object:  ForeignKey [FK__Bookings__Status__6FE99F9F]    Script Date: 08/15/2020 17:18:10 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Bookings__Status__6FE99F9F]') AND parent_object_id = OBJECT_ID(N'[dbo].[Bookings]'))
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([Id])
GO
/****** Object:  ForeignKey [FK__Bookings__Vehicl__71D1E811]    Script Date: 08/15/2020 17:18:10 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Bookings__Vehicl__71D1E811]') AND parent_object_id = OBJECT_ID(N'[dbo].[Bookings]'))
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD FOREIGN KEY([VehicleTypeId])
REFERENCES [dbo].[VehicleType] ([Id])
GO
/****** Object:  ForeignKey [FK__booking_c__Booki__7B5B524B]    Script Date: 08/15/2020 17:18:10 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__booking_c__Booki__7B5B524B]') AND parent_object_id = OBJECT_ID(N'[dbo].[booking_cost]'))
ALTER TABLE [dbo].[booking_cost]  WITH CHECK ADD FOREIGN KEY([BookingId])
REFERENCES [dbo].[Bookings] ([Id])
GO
/****** Object:  ForeignKey [FK__booking_c__Servi__7C4F7684]    Script Date: 08/15/2020 17:18:10 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__booking_c__Servi__7C4F7684]') AND parent_object_id = OBJECT_ID(N'[dbo].[booking_cost]'))
ALTER TABLE [dbo].[booking_cost]  WITH CHECK ADD FOREIGN KEY([ServicesAndPartsId])
REFERENCES [dbo].[ServicesAndParts] ([Id])
GO


insert into VehicleType values ('Motorbike'), ('Car'), ('Small Van'),('Small Bus')

insert into makes values
(1,'Ducati Diavel 1260 S')
,(1,'KTM 790 Adventure R')
,(1,'KTM 500 EXC-F')
,(1,'Kawasaki KX450')
,(1,'Kawasaki Z400')
,(1,'Triumph Street Triple R')
,(1,'KTM 1290 Super Duke GT')
,(1,'Triumph Scrambler 1200 XE')
,(1,'BMW R 1250 GS Adventure')
,(1,'Ducati V4 R')

insert into makes values
(2,'Toyota Corolla'),
(2,'Nissan Qashqai'),
(2,'Hyundai Tucson'),
(2,'Volkswagen Golf'),
(2,'Skoda Octavia'),
(2,'Volkswagen Tiguan'),
(2,'Hyundai Kona'),
(2,'Ford Focus'),
(2,'Toyota Yaris'),
(2,'Toyota C-HR'),
(2,'Ford Fiesta'),
(2,'Nissan Micra'),
(2,'Kia Sportage'),
(2,'Volkswagen Polo'),
(2,'Peugeot 3008'),
(2,'Ford Kuga'),
(2,'Volkswagen Passat'),
(2,'Renault Clio'),
(2,'Skoda Kodiaq'),
(2,'Dacia Duster'),
(2,'Renault Captur'),
(2,'Toyota Rav4'),
(2,'Volkswagen T-Roc'),
(2,'Renault Kadjar'),
(2,'Skoda Superb'),
(2,'Peugeot 5008'),
(2,'Renault Megane'),
(2,'Opel Corsa'),
(2,'Skoda Fabia'),
(2,'Dacia Sandero'),
(2,'Seat Arona'),
(2,'Nissan Leaf'),
(2,'BMW 5 Series'),
(2,'Kia Stonic'),
(2,'Skoda Karoq'),
(2,'Hyundai i30'),
(2,'Hyundai i20'),
(2,'Seat Ateca'),
(2,'Audi A6'),
(2,'Opel Astra'),
(2,'Hyundai i10'),
(2,'Seat Ibiza'),
(2,'Peugeot 2008'),
(2,'Audi A3'),
(2,'BMW 3 Series'),
(2,'Mercedes Benz E Class'),
(2,'Audi A4'),
(2,'Kia Ceed'),
(2,'Opel Grandland X'),
(2,'Mazda CX-5'),
(2,'Ford Mondeo'),
(2,'Honda Civic'),
(2,'Mercedes Benz A Class'),
(2,'Mercedes Benz C Class'),
(2,'Ford Ecosport'),
(2,'Nissan X-Trail'),
(2,'Suzuki Vitara'),
(2,'Opel Insignia'),
(2,'Kia  Picanto'),
(2,'Mini'),
(2,'Seat Leon'),
(2,'Kia Niro'),
(2,'Audi Q3'),
(2,'Opel Mokka X'),
(2,'Mercedes Benz CLA'),
(2,'Opel Crossland X'),
(2,'Peugeot 208'),
(2,'Mazda 3'),
(2,'Hyundai Santa Fe'),
(2,'BMW X5'),
(2,'Mitsubishi Outlander'),
(2,'Audi Q2'),
(2,'Kia Sorento'),
(2,'Volvo XC60'),
(2,'Audi Q5'),
(2,'BMW X3'),
(2,'BMW X1'),
(2,'Mazda 6'),
(2,'Mercedes Benz GLC'),
(2,'Seat Tarraco'),
(2,'Mitsubishi Eclipse Cross'),
(2,'Volvo XC90'),
(2,'Volvo XC40'),
(2,'Landrover Range Rover Sport'),
(2,'Toyota Aygo'),
(2,'BMW 1 Series'),
(2,'Audi A5'),
(2,'Kia Rio'),
(2,'Ford Ka'),
(2,'Renault Zoe'),
(2,'Hyundai i40'),
(2,'Skoda Citigo'),
(2,'Peugeot 508'),
(2,'Mazda 2'),
(2,'Volkswagen Up'),
(2,'Landrover Discovery Sport'),
(2,'Landrover Range Rover Evoque'),
(2,'Volkswagen Arteon'),
(2,'Honda Jazz'),
(2,'Peugeot 308'),
(2,'Audi A1'),
(2,'Honda CR-V'),
(2,'Kia Optima'),
(2,'Renault Grand Scenic'),
(2,'Dacia Logan'),
(2,'Honda HR-V'),
(2,'Seat Alhambra'),
(2,'Hyundai ix20'),
(2,'Suzuki Ignis'),
(2,'Citroen C3'),
(2,'Tesla Model 3'),
(2,'Jaguar E-Pace'),
(2,'Mazda CX-3'),
(2,'Suzuki Swift'),
(2,'Citroen Grand C4 Spacetourer'),
(2,'BMW 4 Series'),
(2,'Volkswagen Touran'),
(2,'Landrover Range Rover Velar'),
(2,'BMW 2 Series'),
(2,'Fiat 500'),
(2,'Mitsubishi ASX'),
(2,'Lexus NX'),
(2,'Jaguar F-Pace'),
(2,'Hyundai Ioniq'),
(2,'BMW i3'),
(2,'Landrover Discovery'),
(2,'Nissan Juke'),
(2,'Volvo V40'),
(2,'Volvo V60'),
(2,'Lexus ES'),
(2,'Nissan Pulsar'),
(2,'Fiat Tipo'),
(2,'Citroen C3 Aircross'),
(2,'Audi Q7'),
(2,'Citroen C4 Cactus'),
(2,'Mercedes Benz B Class'),
(2,'Volvo S90'),
(2,'Mercedes Benz CLS'),
(2,'Toyota Prius'),
(2,'Ford C-Max'),
(2,'Skoda Rapid'),
(2,'Renault Scenic'),
(2,'Ford Galaxy'),
(2,'Jeep Compass'),
(2,'Renault Koleos'),
(2,'Suzuki SX4'),
(2,'Seat Mii'),
(2,'BMW X2'),
(2,'Kia Pro_Ceed'),
(2,'Volkswagen Sharan'),
(2,'Volvo S60'),
(2,'Audi Q8'),
(2,'Suzuki Baleno'),
(2,'Kia Soul'),
(2,'Suzuki Celerio'),
(2,'Audi A7'),
(2,'Fiat 500X'),
(2,'Toyota Auris'),
(2,'Mercedes Benz GLE'),
(2,'Tesla Model S'),
(2,'Mitsubishi Spacestar'),
(2,'Lexus RX'),
(2,'Volvo V90'),
(2,'Mercedes Benz GLA'),
(2,'Opel Karl'),
(2,'Opel Adam'),
(2,'Lexus IS'),
(2,'Landrover Range Rover'),
(2,'Ford Grand C-Max'),
(2,'Audi e-tron'),
(2,'Kia Carens'),
(2,'BMW 8 Series'),
(2,'Jaguar I-Pace'),
(2,'Kia Stinger'),
(2,'Ssangyong Tivoli'),
(2,'Lexus CT'),
(2,'Jaguar XE'),
(2,'Mercedes Benz S Class'),
(2,'Jaguar XF'),
(2,'Peugeot 108'),
(2,'BMW X4'),
(2,'Tesla Model X'),
(2,'BMW 7 Series'),
(2,'Fiat Panda'),
(2,'Subaru XV'),
(2,'Porsche Panamera'),
(2,'Kia Venga'),
(2,'Mazda MX-5'),
(2,'Audi A8'),
(2,'Porsche Macan'),
(2,'Citroen DS3'),
(2,'Subaru Forester'),
(2,'Alfa Romeo Giulia'),
(2,'BMW 6 Series'),
(2,'Citroen C4'),
(2,'Jeep Renegade'),
(2,'Subaru Impreza'),
(2,'Citroen C1'),
(2,'Ford Mustang'),
(2,'Lexus RC'),
(2,'Audi TT'),
(2,'Lexus LS'),
(2,'Porsche Cayenne'),
(2,'Porsche 911'),
(2,'Volkswagen Beetle'),
(2,'Alfa Romeo Giulietta'),
(2,'Alfa Romeo Stelvio'),
(2,'BMW M4'),
(2,'BMW M2'),
(2,'Mitsubishi Lancer'),
(2,'BMW M5'),
(2,'Fiat 500L'),
(2,'Mercedes Benz EQC'),
(2,'Opel Zafira'),
(2,'Seat Toledo'),
(2,'Toyota Avensis'),
(2,'Ford Edge'),
(2,'Nissan Note'),
(2,'Volkswagen Jetta')

insert into makes values
(3,'Vauxhall Combo')
,(3,'Ford Transit Courier')
,(3,'Volkswagen Caddy')
,(3,'Citroen Berlingo')
,(3,'Peugeot Partner')
,(3,'Mercedes Citan')
,(3,'Renault Kangoo Z.E')
,(3,'Fiat Doblo Cargo')
,(3,'Nissan NV200')
,(3,'Fiat Fiorino')

insert into makes values
(4,'Ford Transit')
,(4,'Fiat Ducato')
,(4,'Mercedes-Benz Vario')
,(4,'Mercedes-Benz Vito')
,(4,'Volkswagen Caravelle')
,(4,'Renault Master')
,(4,'Vauxhall Movano')
,(4,'Fiat Scudo')
,(4,'Vauxhall Vivaro')
,(4,'Renault Trafic')


insert into AspNetRoles (Id, Name) values (NEWID(), 'Staff'),
(NEWID(),'Admin'),(NEWID(),'Customer')

insert into BookingTypes (Name) values ('Annual Service'),
('Major Service'),(' Repair / Fault'),(' Major Repair')

insert into [Status] (Name) values ('Booked'),
('In Service'),('Fixed / Completed'),('Collected'),('Unrepairable / Scrapped')

insert into EngineType (Name) values ('Diesel'),
('Petrol'),('Hybrid'),('Electric')

--user admin@admin.com
--pwd Admin123!
insert into AspNetUsers (Id, Email, PasswordHash, SecurityStamp, UserName, LockoutEnabled, EmailConfirmed, PhoneNumberConfirmed, TwoFactorEnabled, AccessFailedCount)
values ( '04530ac5-da5c-48ab-8b5c-ff13ec1038a0', 'admin@admin.com', 'AO7bDCvTNwUTSOVTU3HGJQ8EYvd/x70SBnOxoECrBRsR2fy7kDrNvoFtmsPdU3EjHA==', '4efc7d5a-6655-4a2c-b5f4-2784ecffdc99', 'admin@admin.com', 1, 0, 0, 0, 0)

insert into AspNetUserRoles values ('04530ac5-da5c-48ab-8b5c-ff13ec1038a0', (select Id from AspNetRoles where Name = 'Admin'))

insert into ServicesAndParts values
('SHOCK ABSORBER', 0
),('REPLACEMENT OF WHEEL CRUSH', 30
),('EXCHANGE OF DOOR NUT', 33.33
),('HOMOCINETIC EXCHANGE', 45.0
),('CLUTCH EXCHANGE', 145.0
),('REPLACEMENT OF WHEEL BEARING', 0
),('STARTING MOTOR SERVICE', 65.0
),('TURNING VOLANTE', 65.0
),('RADIATOR SERVICE', 55.0
),('ASSEMBLING AND DISASSEMBLING RADIATOR', 85.0
),('CLEANING OF INJECTORS AND TEST', 245.0
),('LOAD OF GAS AND OIL', 135.0
),('ACD HIGH PRESSURE HOSE', 145.0
),('EXCHANGE FOR FALLS', 23.0
),('DUCATO TOOTH BELT EXCHANGE', 245.0
),('LEFT REAR BEARING REPLACEMENT', 95.0
),('REMOVE OIL LEAKAGE', 65.0
),('CLUTCH TUBE REPLACEMENT', 65.0
),('RETROVISOR PAINTING SERVICE', 30.0
),('WORKPLACE', 145.0
),('BUTTERFLY BODY KIT', 24.5
),('NOZZLE CLEANING AND TEST', 165.0
),('PETROL', 18.0
),('NO SERVICE', 0.0
),('BELT BEARING', 98.0
),('MATCHING', 30.0
),('BALANCE', 7.5
),('SPOD SPOD Adapter Harness for ARB Compressor', 18.99
),('VIAIR VIAIR 5-in-1 Inline Inflation/Deflation Coil Hose',	29.99
),('VIAIR VIAIR 5-in-1 Inline Inflation/Deflation Coil Hose', 39.99
),('VIAIR VIAIR Onboard Air Hookup Kit', 79.99
),('VIAIR VIAIR Air Source Relocation Kit', 19.99
),('VIAIR VIAIR Onboard Air Hookup Kit', 79.99
),('VIAIR VIAIR 5-in-1 Inline Inflation/Deflation Coil Hose', 39.99
),('VIAIR VIAIR Onboard Air Hookup Kit', 79.99
),('Smittybilt Smittybilt Compressor Storage Bag', 19.99
),('VIAIR VIAIR Direct Inlet Air Filter Assembly', 3.99
),('VIAIR VIAIR Metal Direct Inlet Air Filter Assembly', 6.99
),('VIAIR VIAIR Dual Stage Air Filter Element', 4.99
),('VIAIR VIAIR Direct Inlet Air Filter Assembly', 11.99
),('VIAIR VIAIR Remote Intake Air Filter Assembly', 5.99
),('VIAIR VIAIR Remote Intake Air Filter Assembly', 6.99
),('VIAIR VIAIR Direct Inlet Air Filter Assembly', 6.99
),('VIAIR VIAIR Dual Stage Air Filter Elements', 4.99
),('VIAIR VIAIR Metal Remote Inlet Air Filter Assembly', 9.99
),('VIAIR VIAIR Remote Intake Air Filter Assembly', 4.99
),('TeraFlex TeraFlex ARB Compressor Under Seat Mounting Kit ',84.99)
