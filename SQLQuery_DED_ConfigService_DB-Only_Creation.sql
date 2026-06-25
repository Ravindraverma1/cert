USE [master]
GO
/****** Object:  Database [DED_ConfigService]    Script Date: 6/25/2026 11:39:38 AM ******/
CREATE DATABASE [DED_ConfigService]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DED_ConfigService', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL17.MSSQLSERVER\MSSQL\DATA\DED_ConfigService.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DED_ConfigService_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL17.MSSQLSERVER\MSSQL\DATA\DED_ConfigService_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DED_ConfigService] SET COMPATIBILITY_LEVEL = 170
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DED_ConfigService].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DED_ConfigService] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DED_ConfigService] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DED_ConfigService] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DED_ConfigService] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DED_ConfigService] SET ARITHABORT OFF 
GO
ALTER DATABASE [DED_ConfigService] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DED_ConfigService] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DED_ConfigService] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DED_ConfigService] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DED_ConfigService] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DED_ConfigService] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DED_ConfigService] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DED_ConfigService] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DED_ConfigService] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DED_ConfigService] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DED_ConfigService] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DED_ConfigService] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DED_ConfigService] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DED_ConfigService] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DED_ConfigService] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DED_ConfigService] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [DED_ConfigService] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DED_ConfigService] SET RECOVERY FULL 
GO
ALTER DATABASE [DED_ConfigService] SET  MULTI_USER 
GO
ALTER DATABASE [DED_ConfigService] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DED_ConfigService] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DED_ConfigService] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DED_ConfigService] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DED_ConfigService] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DED_ConfigService] SET OPTIMIZED_LOCKING = OFF 
GO
ALTER DATABASE [DED_ConfigService] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DED_ConfigService', N'ON'
GO
ALTER DATABASE [DED_ConfigService] SET QUERY_STORE = ON
GO
ALTER DATABASE [DED_ConfigService] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DED_ConfigService]
GO
/****** Object:  Schema [cfg]    Script Date: 6/25/2026 11:39:38 AM ******/
CREATE SCHEMA [cfg]
GO
/****** Object:  Table [cfg].[Activities]    Script Date: 6/25/2026 11:39:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [cfg].[Activities](
	[Activity_UID] [int] IDENTITY(1,1) NOT NULL,
	[ActivityGroupUid] [int] NOT NULL,
	[SeverityLevel] [nvarchar](100) NULL,
	[ExtraProperties] [nvarchar](max) NOT NULL,
	[ConcurrencyStamp] [nvarchar](40) NOT NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatorId] [uniqueidentifier] NULL,
	[LastModificationTime] [datetime2](7) NULL,
	[LastModifierId] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterId] [uniqueidentifier] NULL,
	[DeletionTime] [datetime2](7) NULL,
	[Activity_Arabic] [nvarchar](150) NOT NULL,
	[Activity_English] [nvarchar](150) NOT NULL,
	[DescriptionArabic] [nvarchar](500) NOT NULL,
	[DescriptionEnglish] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_Activities] PRIMARY KEY CLUSTERED 
(
	[Activity_UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [cfg].[ActivityApprovals]    Script Date: 6/25/2026 11:39:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [cfg].[ActivityApprovals](
	[ActivityApproval_UID] [int] IDENTITY(1,1) NOT NULL,
	[ActivityUid] [int] NOT NULL,
	[ApprovalUid] [int] NOT NULL,
	[ExtraProperties] [nvarchar](max) NOT NULL,
	[ConcurrencyStamp] [nvarchar](40) NOT NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatorId] [uniqueidentifier] NULL,
	[LastModificationTime] [datetime2](7) NULL,
	[LastModifierId] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterId] [uniqueidentifier] NULL,
	[DeletionTime] [datetime2](7) NULL,
 CONSTRAINT [PK_ActivityApprovals] PRIMARY KEY CLUSTERED 
(
	[ActivityApproval_UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [cfg].[ActivityGroups]    Script Date: 6/25/2026 11:39:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [cfg].[ActivityGroups](
	[ActivityGroup_UID] [int] IDENTITY(1,1) NOT NULL,
	[BusinessDomainUid] [int] NOT NULL,
	[ExtraProperties] [nvarchar](max) NOT NULL,
	[ConcurrencyStamp] [nvarchar](40) NOT NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatorId] [uniqueidentifier] NULL,
	[LastModificationTime] [datetime2](7) NULL,
	[LastModifierId] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterId] [uniqueidentifier] NULL,
	[DeletionTime] [datetime2](7) NULL,
	[ActivityGroup_Arabic] [nvarchar](150) NOT NULL,
	[ActivityGroup_English] [nvarchar](150) NOT NULL,
	[DescriptionArabic] [nvarchar](500) NOT NULL,
	[DescriptionEnglish] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_ActivityGroups] PRIMARY KEY CLUSTERED 
(
	[ActivityGroup_UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [cfg].[Approvals]    Script Date: 6/25/2026 11:39:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [cfg].[Approvals](
	[Approval_UID] [int] IDENTITY(1,1) NOT NULL,
	[ApprovalTypeUid] [int] NOT NULL,
	[RequesterEntityUid] [int] NULL,
	[SeverityLevelId] [bigint] NOT NULL,
	[IsShowStopper] [bit] NOT NULL,
	[ExtraProperties] [nvarchar](max) NOT NULL,
	[ConcurrencyStamp] [nvarchar](40) NOT NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatorId] [uniqueidentifier] NULL,
	[LastModificationTime] [datetime2](7) NULL,
	[LastModifierId] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterId] [uniqueidentifier] NULL,
	[DeletionTime] [datetime2](7) NULL,
 CONSTRAINT [PK_Approvals] PRIMARY KEY CLUSTERED 
(
	[Approval_UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [cfg].[ApprovalTypes]    Script Date: 6/25/2026 11:39:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [cfg].[ApprovalTypes](
	[ApprovalType_UID] [int] IDENTITY(1,1) NOT NULL,
	[ExtraProperties] [nvarchar](max) NOT NULL,
	[ConcurrencyStamp] [nvarchar](40) NOT NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatorId] [uniqueidentifier] NULL,
	[LastModificationTime] [datetime2](7) NULL,
	[LastModifierId] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterId] [uniqueidentifier] NULL,
	[DeletionTime] [datetime2](7) NULL,
	[ApprovalType_Arabic] [nvarchar](150) NOT NULL,
	[ApprovalType_English] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_ApprovalTypes] PRIMARY KEY CLUSTERED 
(
	[ApprovalType_UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [cfg].[BusinessDomains]    Script Date: 6/25/2026 11:39:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [cfg].[BusinessDomains](
	[BusinessDomain_UID] [int] IDENTITY(1,1) NOT NULL,
	[BusinessDomain_StatusCode] [nvarchar](50) NULL,
	[ExtraProperties] [nvarchar](max) NOT NULL,
	[ConcurrencyStamp] [nvarchar](40) NOT NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatorId] [uniqueidentifier] NULL,
	[LastModificationTime] [datetime2](7) NULL,
	[LastModifierId] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterId] [uniqueidentifier] NULL,
	[DeletionTime] [datetime2](7) NULL,
	[BusinessDomain_Arabic] [nvarchar](150) NOT NULL,
	[BusinessDomain_English] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_BusinessDomains] PRIMARY KEY CLUSTERED 
(
	[BusinessDomain_UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [cfg].[EntityProvidingApprovals]    Script Date: 6/25/2026 11:39:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [cfg].[EntityProvidingApprovals](
	[EntityProvidingApproval_UID] [int] IDENTITY(1,1) NOT NULL,
	[EntityTypeUid] [int] NOT NULL,
	[ParentEntityUid] [int] NULL,
	[ExtraProperties] [nvarchar](max) NOT NULL,
	[ConcurrencyStamp] [nvarchar](40) NOT NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatorId] [uniqueidentifier] NULL,
	[LastModificationTime] [datetime2](7) NULL,
	[LastModifierId] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterId] [uniqueidentifier] NULL,
	[DeletionTime] [datetime2](7) NULL,
	[EntityProvidingApproval_Arabic] [nvarchar](150) NOT NULL,
	[EntityProvidingApproval_English] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_EntityProvidingApprovals] PRIMARY KEY CLUSTERED 
(
	[EntityProvidingApproval_UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [cfg].[EntityTypes]    Script Date: 6/25/2026 11:39:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [cfg].[EntityTypes](
	[EntityType_UID] [int] IDENTITY(1,1) NOT NULL,
	[ExtraProperties] [nvarchar](max) NOT NULL,
	[ConcurrencyStamp] [nvarchar](40) NOT NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatorId] [uniqueidentifier] NULL,
	[LastModificationTime] [datetime2](7) NULL,
	[LastModifierId] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterId] [uniqueidentifier] NULL,
	[DeletionTime] [datetime2](7) NULL,
	[EntityType_Arabic] [nvarchar](150) NOT NULL,
	[EntityType_English] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_EntityTypes] PRIMARY KEY CLUSTERED 
(
	[EntityType_UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [cfg].[LegalFormDefinitions]    Script Date: 6/25/2026 11:39:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [cfg].[LegalFormDefinitions](
	[LegalFormDefinition_UID] [int] IDENTITY(1,1) NOT NULL,
	[LegalFormUid] [int] NOT NULL,
	[ShareholderNationalityUid] [int] NOT NULL,
	[ShareLimitPercent] [decimal](18, 2) NOT NULL,
	[MaxShareholderCount] [int] NOT NULL,
	[RequiresServiceAgent] [bit] NOT NULL,
	[ExtraProperties] [nvarchar](max) NOT NULL,
	[ConcurrencyStamp] [nvarchar](40) NOT NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatorId] [uniqueidentifier] NULL,
	[LastModificationTime] [datetime2](7) NULL,
	[LastModifierId] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterId] [uniqueidentifier] NULL,
	[DeletionTime] [datetime2](7) NULL,
 CONSTRAINT [PK_LegalFormDefinitions] PRIMARY KEY CLUSTERED 
(
	[LegalFormDefinition_UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [cfg].[LegalForms]    Script Date: 6/25/2026 11:39:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [cfg].[LegalForms](
	[LegalForm_UID] [int] IDENTITY(1,1) NOT NULL,
	[ExtraProperties] [nvarchar](max) NOT NULL,
	[ConcurrencyStamp] [nvarchar](40) NOT NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatorId] [uniqueidentifier] NULL,
	[LastModificationTime] [datetime2](7) NULL,
	[LastModifierId] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterId] [uniqueidentifier] NULL,
	[DeletionTime] [datetime2](7) NULL,
	[LegalForm_Arabic] [nvarchar](150) NOT NULL,
	[LegalForm_English] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_LegalForms] PRIMARY KEY CLUSTERED 
(
	[LegalForm_UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [cfg].[Nationalities]    Script Date: 6/25/2026 11:39:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [cfg].[Nationalities](
	[Nationality_UID] [int] IDENTITY(1,1) NOT NULL,
	[ExtraProperties] [nvarchar](max) NOT NULL,
	[ConcurrencyStamp] [nvarchar](40) NOT NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatorId] [uniqueidentifier] NULL,
	[LastModificationTime] [datetime2](7) NULL,
	[LastModifierId] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterId] [uniqueidentifier] NULL,
	[DeletionTime] [datetime2](7) NULL,
	[Nationality_Arabic] [nvarchar](150) NOT NULL,
	[Nationality_English] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Nationalities] PRIMARY KEY CLUSTERED 
(
	[Nationality_UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [cfg].[RequestPurposes]    Script Date: 6/25/2026 11:39:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [cfg].[RequestPurposes](
	[RequestPurpose_UID] [int] IDENTITY(1,1) NOT NULL,
	[ExtraProperties] [nvarchar](max) NOT NULL,
	[ConcurrencyStamp] [nvarchar](40) NOT NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatorId] [uniqueidentifier] NULL,
	[LastModificationTime] [datetime2](7) NULL,
	[LastModifierId] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterId] [uniqueidentifier] NULL,
	[DeletionTime] [datetime2](7) NULL,
	[RequestPurpose_Arabic] [nvarchar](150) NOT NULL,
	[RequestPurpose_English] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_RequestPurposes] PRIMARY KEY CLUSTERED 
(
	[RequestPurpose_UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [cfg].[RestrictedActivityPerNationalities]    Script Date: 6/25/2026 11:39:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [cfg].[RestrictedActivityPerNationalities](
	[RestrictedActivityPerNationality_UID] [int] IDENTITY(1,1) NOT NULL,
	[ActivityUid] [int] NOT NULL,
	[NationalityUid] [int] NOT NULL,
	[VersionNumber] [int] NOT NULL,
	[ExtraProperties] [nvarchar](max) NOT NULL,
	[ConcurrencyStamp] [nvarchar](40) NOT NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatorId] [uniqueidentifier] NULL,
	[LastModificationTime] [datetime2](7) NULL,
	[LastModifierId] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterId] [uniqueidentifier] NULL,
	[DeletionTime] [datetime2](7) NULL,
 CONSTRAINT [PK_RestrictedActivityPerNationalities] PRIMARY KEY CLUSTERED 
(
	[RestrictedActivityPerNationality_UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 6/25/2026 11:39:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_Activities_ActivityGroupUid]    Script Date: 6/25/2026 11:39:38 AM ******/
CREATE NONCLUSTERED INDEX [IX_Activities_ActivityGroupUid] ON [cfg].[Activities]
(
	[ActivityGroupUid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ActivityApprovals_ActivityUid]    Script Date: 6/25/2026 11:39:38 AM ******/
CREATE NONCLUSTERED INDEX [IX_ActivityApprovals_ActivityUid] ON [cfg].[ActivityApprovals]
(
	[ActivityUid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ActivityApprovals_ApprovalUid]    Script Date: 6/25/2026 11:39:38 AM ******/
CREATE NONCLUSTERED INDEX [IX_ActivityApprovals_ApprovalUid] ON [cfg].[ActivityApprovals]
(
	[ApprovalUid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UX_ActivityApprovals_Activity_Approval]    Script Date: 6/25/2026 11:39:38 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UX_ActivityApprovals_Activity_Approval] ON [cfg].[ActivityApprovals]
(
	[ActivityUid] ASC,
	[ApprovalUid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ActivityGroups_BusinessDomainUid]    Script Date: 6/25/2026 11:39:38 AM ******/
CREATE NONCLUSTERED INDEX [IX_ActivityGroups_BusinessDomainUid] ON [cfg].[ActivityGroups]
(
	[BusinessDomainUid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Approvals_ApprovalTypeUid]    Script Date: 6/25/2026 11:39:38 AM ******/
CREATE NONCLUSTERED INDEX [IX_Approvals_ApprovalTypeUid] ON [cfg].[Approvals]
(
	[ApprovalTypeUid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Approvals_RequesterEntityUid]    Script Date: 6/25/2026 11:39:38 AM ******/
CREATE NONCLUSTERED INDEX [IX_Approvals_RequesterEntityUid] ON [cfg].[Approvals]
(
	[RequesterEntityUid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_EntityProvidingApprovals_EntityTypeUid]    Script Date: 6/25/2026 11:39:38 AM ******/
CREATE NONCLUSTERED INDEX [IX_EntityProvidingApprovals_EntityTypeUid] ON [cfg].[EntityProvidingApprovals]
(
	[EntityTypeUid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_EntityProvidingApprovals_ParentEntityUid]    Script Date: 6/25/2026 11:39:38 AM ******/
CREATE NONCLUSTERED INDEX [IX_EntityProvidingApprovals_ParentEntityUid] ON [cfg].[EntityProvidingApprovals]
(
	[ParentEntityUid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_LegalFormDefinitions_LegalFormUid]    Script Date: 6/25/2026 11:39:38 AM ******/
CREATE NONCLUSTERED INDEX [IX_LegalFormDefinitions_LegalFormUid] ON [cfg].[LegalFormDefinitions]
(
	[LegalFormUid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_LegalFormDefinitions_ShareholderNationalityUid]    Script Date: 6/25/2026 11:39:38 AM ******/
CREATE NONCLUSTERED INDEX [IX_LegalFormDefinitions_ShareholderNationalityUid] ON [cfg].[LegalFormDefinitions]
(
	[ShareholderNationalityUid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UX_LegalFormDefinitions_LegalForm_Nationality]    Script Date: 6/25/2026 11:39:38 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UX_LegalFormDefinitions_LegalForm_Nationality] ON [cfg].[LegalFormDefinitions]
(
	[LegalFormUid] ASC,
	[ShareholderNationalityUid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_RestrictedActivityPerNationalities_ActivityUid]    Script Date: 6/25/2026 11:39:38 AM ******/
CREATE NONCLUSTERED INDEX [IX_RestrictedActivityPerNationalities_ActivityUid] ON [cfg].[RestrictedActivityPerNationalities]
(
	[ActivityUid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_RestrictedActivityPerNationalities_NationalityUid]    Script Date: 6/25/2026 11:39:38 AM ******/
CREATE NONCLUSTERED INDEX [IX_RestrictedActivityPerNationalities_NationalityUid] ON [cfg].[RestrictedActivityPerNationalities]
(
	[NationalityUid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UX_RestrictedActivityPerNationalities_Activity_Nationality_Version]    Script Date: 6/25/2026 11:39:38 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UX_RestrictedActivityPerNationalities_Activity_Nationality_Version] ON [cfg].[RestrictedActivityPerNationalities]
(
	[ActivityUid] ASC,
	[NationalityUid] ASC,
	[VersionNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [cfg].[Activities] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [cfg].[Activities] ADD  DEFAULT (N'') FOR [DescriptionArabic]
GO
ALTER TABLE [cfg].[Activities] ADD  DEFAULT (N'') FOR [DescriptionEnglish]
GO
ALTER TABLE [cfg].[ActivityApprovals] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [cfg].[ActivityGroups] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [cfg].[ActivityGroups] ADD  DEFAULT (N'') FOR [DescriptionArabic]
GO
ALTER TABLE [cfg].[ActivityGroups] ADD  DEFAULT (N'') FOR [DescriptionEnglish]
GO
ALTER TABLE [cfg].[Approvals] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [cfg].[ApprovalTypes] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [cfg].[BusinessDomains] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [cfg].[EntityProvidingApprovals] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [cfg].[EntityTypes] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [cfg].[LegalFormDefinitions] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [cfg].[LegalForms] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [cfg].[Nationalities] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [cfg].[RequestPurposes] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [cfg].[RestrictedActivityPerNationalities] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [cfg].[Activities]  WITH CHECK ADD  CONSTRAINT [FK_Activities_ActivityGroups_ActivityGroupUid] FOREIGN KEY([ActivityGroupUid])
REFERENCES [cfg].[ActivityGroups] ([ActivityGroup_UID])
GO
ALTER TABLE [cfg].[Activities] CHECK CONSTRAINT [FK_Activities_ActivityGroups_ActivityGroupUid]
GO
ALTER TABLE [cfg].[ActivityApprovals]  WITH CHECK ADD  CONSTRAINT [FK_ActivityApprovals_Activities_ActivityUid] FOREIGN KEY([ActivityUid])
REFERENCES [cfg].[Activities] ([Activity_UID])
GO
ALTER TABLE [cfg].[ActivityApprovals] CHECK CONSTRAINT [FK_ActivityApprovals_Activities_ActivityUid]
GO
ALTER TABLE [cfg].[ActivityApprovals]  WITH CHECK ADD  CONSTRAINT [FK_ActivityApprovals_Approvals_ApprovalUid] FOREIGN KEY([ApprovalUid])
REFERENCES [cfg].[Approvals] ([Approval_UID])
GO
ALTER TABLE [cfg].[ActivityApprovals] CHECK CONSTRAINT [FK_ActivityApprovals_Approvals_ApprovalUid]
GO
ALTER TABLE [cfg].[ActivityGroups]  WITH CHECK ADD  CONSTRAINT [FK_ActivityGroups_BusinessDomains_BusinessDomainUid] FOREIGN KEY([BusinessDomainUid])
REFERENCES [cfg].[BusinessDomains] ([BusinessDomain_UID])
GO
ALTER TABLE [cfg].[ActivityGroups] CHECK CONSTRAINT [FK_ActivityGroups_BusinessDomains_BusinessDomainUid]
GO
ALTER TABLE [cfg].[Approvals]  WITH CHECK ADD  CONSTRAINT [FK_Approvals_ApprovalTypes_ApprovalTypeUid] FOREIGN KEY([ApprovalTypeUid])
REFERENCES [cfg].[ApprovalTypes] ([ApprovalType_UID])
GO
ALTER TABLE [cfg].[Approvals] CHECK CONSTRAINT [FK_Approvals_ApprovalTypes_ApprovalTypeUid]
GO
ALTER TABLE [cfg].[Approvals]  WITH CHECK ADD  CONSTRAINT [FK_Approvals_EntityProvidingApprovals_RequesterEntityUid] FOREIGN KEY([RequesterEntityUid])
REFERENCES [cfg].[EntityProvidingApprovals] ([EntityProvidingApproval_UID])
GO
ALTER TABLE [cfg].[Approvals] CHECK CONSTRAINT [FK_Approvals_EntityProvidingApprovals_RequesterEntityUid]
GO
ALTER TABLE [cfg].[EntityProvidingApprovals]  WITH CHECK ADD  CONSTRAINT [FK_EntityProvidingApprovals_EntityProvidingApprovals_ParentEntityUid] FOREIGN KEY([ParentEntityUid])
REFERENCES [cfg].[EntityProvidingApprovals] ([EntityProvidingApproval_UID])
GO
ALTER TABLE [cfg].[EntityProvidingApprovals] CHECK CONSTRAINT [FK_EntityProvidingApprovals_EntityProvidingApprovals_ParentEntityUid]
GO
ALTER TABLE [cfg].[EntityProvidingApprovals]  WITH CHECK ADD  CONSTRAINT [FK_EntityProvidingApprovals_EntityTypes_EntityTypeUid] FOREIGN KEY([EntityTypeUid])
REFERENCES [cfg].[EntityTypes] ([EntityType_UID])
GO
ALTER TABLE [cfg].[EntityProvidingApprovals] CHECK CONSTRAINT [FK_EntityProvidingApprovals_EntityTypes_EntityTypeUid]
GO
ALTER TABLE [cfg].[LegalFormDefinitions]  WITH CHECK ADD  CONSTRAINT [FK_LegalFormDefinitions_LegalForms_LegalFormUid] FOREIGN KEY([LegalFormUid])
REFERENCES [cfg].[LegalForms] ([LegalForm_UID])
GO
ALTER TABLE [cfg].[LegalFormDefinitions] CHECK CONSTRAINT [FK_LegalFormDefinitions_LegalForms_LegalFormUid]
GO
ALTER TABLE [cfg].[LegalFormDefinitions]  WITH CHECK ADD  CONSTRAINT [FK_LegalFormDefinitions_Nationalities_ShareholderNationalityUid] FOREIGN KEY([ShareholderNationalityUid])
REFERENCES [cfg].[Nationalities] ([Nationality_UID])
GO
ALTER TABLE [cfg].[LegalFormDefinitions] CHECK CONSTRAINT [FK_LegalFormDefinitions_Nationalities_ShareholderNationalityUid]
GO
ALTER TABLE [cfg].[RestrictedActivityPerNationalities]  WITH CHECK ADD  CONSTRAINT [FK_RestrictedActivityPerNationalities_Activities_ActivityUid] FOREIGN KEY([ActivityUid])
REFERENCES [cfg].[Activities] ([Activity_UID])
GO
ALTER TABLE [cfg].[RestrictedActivityPerNationalities] CHECK CONSTRAINT [FK_RestrictedActivityPerNationalities_Activities_ActivityUid]
GO
ALTER TABLE [cfg].[RestrictedActivityPerNationalities]  WITH CHECK ADD  CONSTRAINT [FK_RestrictedActivityPerNationalities_Nationalities_NationalityUid] FOREIGN KEY([NationalityUid])
REFERENCES [cfg].[Nationalities] ([Nationality_UID])
GO
ALTER TABLE [cfg].[RestrictedActivityPerNationalities] CHECK CONSTRAINT [FK_RestrictedActivityPerNationalities_Nationalities_NationalityUid]
GO
USE [master]
GO
ALTER DATABASE [DED_ConfigService] SET  READ_WRITE 
GO
