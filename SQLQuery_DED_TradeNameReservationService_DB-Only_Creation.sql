USE [master]
GO
/****** Object:  Database [DED_TradeNameReservationService]    Script Date: 6/25/2026 11:36:16 AM ******/
CREATE DATABASE [DED_TradeNameReservationService]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DED_TradeNameReservationService', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL17.MSSQLSERVER\MSSQL\DATA\DED_TradeNameReservationService.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DED_TradeNameReservationService_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL17.MSSQLSERVER\MSSQL\DATA\DED_TradeNameReservationService_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DED_TradeNameReservationService] SET COMPATIBILITY_LEVEL = 170
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DED_TradeNameReservationService].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DED_TradeNameReservationService] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DED_TradeNameReservationService] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DED_TradeNameReservationService] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DED_TradeNameReservationService] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DED_TradeNameReservationService] SET ARITHABORT OFF 
GO
ALTER DATABASE [DED_TradeNameReservationService] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DED_TradeNameReservationService] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DED_TradeNameReservationService] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DED_TradeNameReservationService] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DED_TradeNameReservationService] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DED_TradeNameReservationService] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DED_TradeNameReservationService] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DED_TradeNameReservationService] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DED_TradeNameReservationService] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DED_TradeNameReservationService] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DED_TradeNameReservationService] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DED_TradeNameReservationService] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DED_TradeNameReservationService] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DED_TradeNameReservationService] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DED_TradeNameReservationService] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DED_TradeNameReservationService] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [DED_TradeNameReservationService] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DED_TradeNameReservationService] SET RECOVERY FULL 
GO
ALTER DATABASE [DED_TradeNameReservationService] SET  MULTI_USER 
GO
ALTER DATABASE [DED_TradeNameReservationService] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DED_TradeNameReservationService] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DED_TradeNameReservationService] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DED_TradeNameReservationService] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DED_TradeNameReservationService] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DED_TradeNameReservationService] SET OPTIMIZED_LOCKING = OFF 
GO
ALTER DATABASE [DED_TradeNameReservationService] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DED_TradeNameReservationService', N'ON'
GO
ALTER DATABASE [DED_TradeNameReservationService] SET QUERY_STORE = ON
GO
ALTER DATABASE [DED_TradeNameReservationService] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DED_TradeNameReservationService]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 6/25/2026 11:36:17 AM ******/
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
/****** Object:  Table [dbo].[TNR_ActionDefinitions]    Script Date: 6/25/2026 11:36:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TNR_ActionDefinitions](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](64) NOT NULL,
	[NameAr] [nvarchar](256) NOT NULL,
	[NameEn] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_TNR_ActionDefinitions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TNR_EServiceOutcomes]    Script Date: 6/25/2026 11:36:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TNR_EServiceOutcomes](
	[DmsDocumentId] [bigint] NOT NULL,
	[RequestId] [uniqueidentifier] NOT NULL,
	[VersionNumber] [int] NOT NULL,
	[Template] [nvarchar](255) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[DeletedAt] [datetime2](7) NULL,
	[DeletedBy] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
	[StatusCode] [nvarchar](50) NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
 CONSTRAINT [PK_TNR_EServiceOutcomes] PRIMARY KEY CLUSTERED 
(
	[DmsDocumentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TNR_EServiceRejections]    Script Date: 6/25/2026 11:36:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TNR_EServiceRejections](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeUserId] [uniqueidentifier] NOT NULL,
	[RequestId] [uniqueidentifier] NOT NULL,
	[RejectionReasonId] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterId] [uniqueidentifier] NULL,
	[DeletionTime] [datetime2](7) NULL,
 CONSTRAINT [PK_TNR_EServiceRejections] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TNR_EServiceRequests]    Script Date: 6/25/2026 11:36:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TNR_EServiceRequests](
	[Id] [uniqueidentifier] NOT NULL,
	[TenantId] [uniqueidentifier] NULL,
	[EServiceVersionId] [int] NULL,
	[LegalFormId] [int] NULL,
	[RequestPurposeId] [int] NULL,
	[FeeStructureVersionId] [int] NULL,
	[RequestNumber] [bigint] NOT NULL,
	[StatusCode] [nvarchar](50) NULL,
	[ApplicantAccountUniqueUid] [uniqueidentifier] NOT NULL,
	[SubmitterAccountProfileUid] [uniqueidentifier] NULL,
	[AjdedSubmitterEntityUid] [uniqueidentifier] NULL,
	[AjdedAssignedToAccountUniqueUid] [uniqueidentifier] NULL,
	[WorkflowStage] [int] NOT NULL,
	[BusinessName] [nvarchar](512) NULL,
	[BusinessNameAr] [nvarchar](512) NULL,
	[LicenseNumber] [nvarchar](128) NULL,
	[ApplicationNo] [nvarchar](128) NULL,
	[BusinessNameType] [nvarchar](64) NULL,
	[Notes] [nvarchar](2000) NULL,
	[ApplicantMobile] [nvarchar](32) NULL,
	[ApplicantEmail] [nvarchar](256) NULL,
	[RowVersion] [timestamp] NOT NULL,
	[ExtraProperties] [nvarchar](max) NOT NULL,
	[ConcurrencyStamp] [nvarchar](40) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterId] [uniqueidentifier] NULL,
	[DeletionTime] [datetime2](7) NULL,
	[LicenseSource] [nvarchar](64) NULL,
	[TradeNameTemplateId] [int] NULL,
 CONSTRAINT [PK_TNR_EServiceRequests] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TNR_GeneratedTradeNames]    Script Date: 6/25/2026 11:36:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TNR_GeneratedTradeNames](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[RequestId] [uniqueidentifier] NOT NULL,
	[TradeNameTemplateId] [int] NULL,
	[StatusId] [int] NOT NULL,
	[TradeNameValueAr] [nvarchar](255) NULL,
	[TradeNameValueEn] [nvarchar](255) NULL,
	[BusinessName] [nvarchar](255) NULL,
	[PrefixId] [bigint] NULL,
	[SuffixId] [bigint] NULL,
	[IsSelected] [bit] NOT NULL,
	[RowVersion] [timestamp] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterId] [uniqueidentifier] NULL,
	[DeletionTime] [datetime2](7) NULL,
	[DisplayOrder] [int] NOT NULL,
 CONSTRAINT [PK_TNR_GeneratedTradeNames] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TNR_ManagerPermissions]    Script Date: 6/25/2026 11:36:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TNR_ManagerPermissions](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[RequestShareholderId] [bigint] NULL,
	[PermissionId] [int] NULL,
	[RowVersion] [varbinary](max) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterId] [uniqueidentifier] NULL,
	[DeletionTime] [datetime2](7) NULL,
 CONSTRAINT [PK_TNR_ManagerPermissions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TNR_NotificationTemplateDefinitions]    Script Date: 6/25/2026 11:36:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TNR_NotificationTemplateDefinitions](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[NotificationTemplateDefinitionAr] [nvarchar](max) NULL,
	[NotificationTemplateDefinitionEn] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterId] [uniqueidentifier] NULL,
	[DeletionTime] [datetime2](7) NULL,
 CONSTRAINT [PK_TNR_NotificationTemplateDefinitions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TNR_NotificationTemplates]    Script Date: 6/25/2026 11:36:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TNR_NotificationTemplates](
	[Id] [uniqueidentifier] NOT NULL,
	[DmsDocumentId] [bigint] NOT NULL,
	[UmChannelId] [uniqueidentifier] NOT NULL,
	[NotificationTemplateDefinitionId] [bigint] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterId] [uniqueidentifier] NULL,
	[DeletionTime] [datetime2](7) NULL,
 CONSTRAINT [PK_TNR_NotificationTemplates] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TNR_ReceiverLists]    Script Date: 6/25/2026 11:36:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TNR_ReceiverLists](
	[Id] [uniqueidentifier] NOT NULL,
	[ToApplicant] [bit] NULL,
	[ToStakeholder] [bit] NULL,
	[ToSignatory] [bit] NULL,
	[ToSubmitter] [bit] NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterId] [uniqueidentifier] NULL,
	[DeletionTime] [datetime2](7) NULL,
 CONSTRAINT [PK_TNR_ReceiverLists] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TNR_RequestAccessChannels]    Script Date: 6/25/2026 11:36:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TNR_RequestAccessChannels](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[RequestId] [uniqueidentifier] NOT NULL,
	[StartedChannelId] [uniqueidentifier] NULL,
	[CompletedChannelId] [uniqueidentifier] NULL,
	[StatusCode] [nvarchar](50) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterId] [uniqueidentifier] NULL,
	[DeletionTime] [datetime2](7) NULL,
 CONSTRAINT [PK_TNR_RequestAccessChannels] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TNR_RequestActivities]    Script Date: 6/25/2026 11:36:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TNR_RequestActivities](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[RequestId] [uniqueidentifier] NOT NULL,
	[ActivityId] [int] NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterId] [uniqueidentifier] NULL,
	[DeletionTime] [datetime2](7) NULL,
	[IsMainActivity] [bit] NOT NULL,
	[RowVersion] [varbinary](max) NOT NULL,
 CONSTRAINT [PK_TNR_RequestActivities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TNR_RequestEntities]    Script Date: 6/25/2026 11:36:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TNR_RequestEntities](
	[RequestEntityUid] [uniqueidentifier] NOT NULL,
	[RequestId] [uniqueidentifier] NOT NULL,
	[AJDED_EntityUid] [uniqueidentifier] NOT NULL,
	[RoleCode] [nvarchar](50) NOT NULL,
	[IsPrimary] [bit] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterId] [uniqueidentifier] NULL,
	[DeletionTime] [datetime2](7) NULL,
 CONSTRAINT [PK_TNR_RequestEntities] PRIMARY KEY CLUSTERED 
(
	[RequestEntityUid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TNR_RequestKpiValues]    Script Date: 6/25/2026 11:36:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TNR_RequestKpiValues](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[RequestId] [uniqueidentifier] NOT NULL,
	[EServiceKpiId] [int] NOT NULL,
	[Value] [decimal](19, 4) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterId] [uniqueidentifier] NULL,
	[DeletionTime] [datetime2](7) NULL,
 CONSTRAINT [PK_TNR_RequestKpiValues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TNR_RequestNotifications]    Script Date: 6/25/2026 11:36:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TNR_RequestNotifications](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[RequestId] [uniqueidentifier] NOT NULL,
	[Template] [uniqueidentifier] NULL,
	[ReceiverList] [uniqueidentifier] NULL,
	[ChannelCode] [uniqueidentifier] NULL,
	[StepId] [nvarchar](128) NULL,
	[Content] [nvarchar](max) NULL,
	[StatusCode] [nvarchar](50) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterId] [uniqueidentifier] NULL,
	[DeletionTime] [datetime2](7) NULL,
 CONSTRAINT [PK_TNR_RequestNotifications] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TNR_RequestPayments]    Script Date: 6/25/2026 11:36:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TNR_RequestPayments](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[RequestId] [uniqueidentifier] NOT NULL,
	[PaymentInvoiceId] [uniqueidentifier] NULL,
	[PaymentReceiptId] [uniqueidentifier] NULL,
	[PaymentStatusId] [bigint] NOT NULL,
	[PaymentAttemptCount] [int] NOT NULL,
	[PaymentStage] [int] NOT NULL,
	[PaymentChannelCode] [nvarchar](64) NULL,
	[PaymentDate] [datetime2](3) NULL,
	[RowVersion] [timestamp] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterId] [uniqueidentifier] NULL,
	[DeletionTime] [datetime2](7) NULL,
 CONSTRAINT [PK_TNR_RequestPayments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TNR_RequestPurposes]    Script Date: 6/25/2026 11:36:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TNR_RequestPurposes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NameAr] [nvarchar](255) NULL,
	[NameEn] [nvarchar](255) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterId] [uniqueidentifier] NULL,
	[DeletionTime] [datetime2](7) NULL,
 CONSTRAINT [PK_TNR_RequestPurposes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TNR_RequestRequiredApprovals]    Script Date: 6/25/2026 11:36:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TNR_RequestRequiredApprovals](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[RequestId] [uniqueidentifier] NOT NULL,
	[ApprovalId] [int] NOT NULL,
	[ActivityId] [int] NULL,
	[ApprovalTypeId] [int] NOT NULL,
	[ApprovalNameAr] [nvarchar](256) NOT NULL,
	[ApprovalNameEn] [nvarchar](256) NOT NULL,
	[ApprovalMethod] [nvarchar](32) NOT NULL,
	[StatusCode] [nvarchar](32) NOT NULL,
	[IsShowStopper] [bit] NOT NULL,
	[UploadedDocumentId] [bigint] NULL,
	[LastStatusUpdatedAt] [datetime2](7) NULL,
	[Remarks] [nvarchar](1000) NULL,
	[ExternalApproverId] [nvarchar](256) NULL,
	[PartnerNotesServices] [nvarchar](2000) NULL,
	[ApprovalNoPartnerServices] [nvarchar](2000) NULL,
	[ExternalApprovalStatusService] [int] NULL,
	[ExternalApprovalStatusServiceDate] [datetime2](7) NULL,
	[RowVersion] [timestamp] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterId] [uniqueidentifier] NULL,
	[DeletionTime] [datetime2](7) NULL,
 CONSTRAINT [PK_TNR_RequestRequiredApprovals] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TNR_RequestShareholders]    Script Date: 6/25/2026 11:36:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TNR_RequestShareholders](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[RequestId] [uniqueidentifier] NOT NULL,
	[AccountUniqueUid] [uniqueidentifier] NULL,
	[AccountProfileUid] [uniqueidentifier] NULL,
	[NationalityUid] [int] NULL,
	[IsManager] [bit] NOT NULL,
	[RequestorPosition] [nvarchar](128) NULL,
	[RowVersion] [timestamp] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterId] [uniqueidentifier] NULL,
	[DeletionTime] [datetime2](7) NULL,
	[ShareholderCategory] [nvarchar](50) NULL,
	[StatusCode] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TNR_RequestShareholders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TNR_RequestSubmitters]    Script Date: 6/25/2026 11:36:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TNR_RequestSubmitters](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[RequestId] [uniqueidentifier] NOT NULL,
	[AccountUniqueUid] [uniqueidentifier] NULL,
	[AccountProfileUid] [uniqueidentifier] NULL,
	[OnBehalfOfAccountUid] [uniqueidentifier] NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterId] [uniqueidentifier] NULL,
	[DeletionTime] [datetime2](7) NULL,
 CONSTRAINT [PK_TNR_RequestSubmitters] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TNR_Services]    Script Date: 6/25/2026 11:36:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TNR_Services](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NameAr] [nvarchar](256) NOT NULL,
	[NameEn] [nvarchar](256) NOT NULL,
	[Code] [nvarchar](64) NOT NULL,
	[WorkflowId] [nvarchar](128) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[ExtraProperties] [nvarchar](max) NOT NULL,
	[ConcurrencyStamp] [nvarchar](40) NOT NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatorId] [uniqueidentifier] NULL,
	[LastModificationTime] [datetime2](7) NULL,
	[LastModifierId] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterId] [uniqueidentifier] NULL,
	[DeletionTime] [datetime2](7) NULL,
 CONSTRAINT [PK_TNR_Services] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TNR_StepActions]    Script Date: 6/25/2026 11:36:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TNR_StepActions](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[StepId] [bigint] NOT NULL,
	[ActionDefinitionId] [bigint] NOT NULL,
	[NameAr] [nvarchar](256) NOT NULL,
	[NameEn] [nvarchar](256) NOT NULL,
	[WFActionId] [nvarchar](128) NOT NULL,
	[OwnerType] [int] NOT NULL,
 CONSTRAINT [PK_TNR_StepActions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TNR_Steps]    Script Date: 6/25/2026 11:36:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TNR_Steps](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ServiceId] [int] NOT NULL,
	[NameAr] [nvarchar](256) NOT NULL,
	[NameEn] [nvarchar](256) NOT NULL,
	[WFStepCode] [nvarchar](128) NOT NULL,
	[StepCode] [nvarchar](128) NOT NULL,
	[StepNo] [int] NOT NULL,
	[OwnerType] [int] NOT NULL,
 CONSTRAINT [PK_TNR_Steps] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TNR_TNRepository]    Script Date: 6/25/2026 11:36:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TNR_TNRepository](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RequestId] [uniqueidentifier] NOT NULL,
	[EServiceVersionId] [int] NULL,
	[ExpiryDate] [datetime2](7) NULL,
	[ExpiryDuration] [decimal](18, 2) NULL,
	[LegalPrefixAr] [nvarchar](255) NULL,
	[LegalSuffixAr] [nvarchar](255) NULL,
	[BusinessNameAr] [nvarchar](255) NULL,
	[LegalPrefixEn] [nvarchar](255) NULL,
	[BusinessNameEn] [nvarchar](255) NULL,
	[ActivityPrefixAr] [nvarchar](255) NULL,
	[LegalSuffixEn] [nvarchar](255) NULL,
	[ActivityPrefixEn] [nvarchar](255) NULL,
	[TnFullNameAr] [nvarchar](512) NULL,
	[EntityId] [uniqueidentifier] NULL,
	[TnFullNameEn] [nvarchar](512) NULL,
	[LicenseNumber] [nvarchar](128) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterId] [uniqueidentifier] NULL,
	[DeletionTime] [datetime2](7) NULL,
 CONSTRAINT [PK_TNR_TNRepository] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TNR_TNRepositoryTemp]    Script Date: 6/25/2026 11:36:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TNR_TNRepositoryTemp](
	[TNRegisteredID] [int] IDENTITY(1,1) NOT NULL,
	[TnExpiryDate] [datetime2](7) NOT NULL,
	[TnReservationDate] [datetime2](7) NOT NULL,
	[UpdatedBy1] [uniqueidentifier] NULL,
	[TnRegisteredNameAr] [nvarchar](255) NULL,
	[TnRegisteredNameEn] [nvarchar](255) NULL,
	[ActivitiesList] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterId] [uniqueidentifier] NULL,
	[DeletionTime] [datetime2](7) NULL,
 CONSTRAINT [PK_TNR_TNRepositoryTemp] PRIMARY KEY CLUSTERED 
(
	[TNRegisteredID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TNR_TradeNameTemplates]    Script Date: 6/25/2026 11:36:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TNR_TradeNameTemplates](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LegalFormId] [int] NULL,
	[ActivityId] [int] NULL,
	[LegalPrefix] [nvarchar](255) NULL,
	[LegalSuffix] [nvarchar](255) NULL,
	[BusinessName] [nvarchar](255) NULL,
	[LegalPrefixEn] [nvarchar](255) NULL,
	[BusinessNameEn] [nvarchar](255) NULL,
	[Activity] [nvarchar](255) NULL,
	[ActivityPrefixEn] [nvarchar](255) NULL,
	[StatusCode] [bit] NULL,
	[VersionNumber] [int] NULL,
	[IsCustom] [bit] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterId] [uniqueidentifier] NULL,
	[DeletionTime] [datetime2](7) NULL,
 CONSTRAINT [PK_TNR_TradeNameTemplates] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TNR_Transactions]    Script Date: 6/25/2026 11:36:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TNR_Transactions](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[RefNumber] [nvarchar](128) NOT NULL,
	[ServiceId] [int] NOT NULL,
	[OrganizationId] [int] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[EmployeeId] [uniqueidentifier] NULL,
	[StatusId] [bigint] NOT NULL,
	[ProcessInstanceId] [nvarchar](128) NULL,
	[CurrentStepId] [bigint] NULL,
	[IsDraft] [bit] NOT NULL,
	[SerialNumber] [nvarchar](max) NULL,
	[ExtraProperties] [nvarchar](max) NOT NULL,
	[ConcurrencyStamp] [nvarchar](40) NOT NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatorId] [uniqueidentifier] NULL,
	[LastModificationTime] [datetime2](7) NULL,
	[LastModifierId] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterId] [uniqueidentifier] NULL,
	[DeletionTime] [datetime2](7) NULL,
 CONSTRAINT [PK_TNR_Transactions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_TNR_ActionDefinitions_Code]    Script Date: 6/25/2026 11:36:17 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_TNR_ActionDefinitions_Code] ON [dbo].[TNR_ActionDefinitions]
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TNR_EServiceOutcomes_RequestId]    Script Date: 6/25/2026 11:36:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_TNR_EServiceOutcomes_RequestId] ON [dbo].[TNR_EServiceOutcomes]
(
	[RequestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TNR_EServiceRejections_RejectionReasonId]    Script Date: 6/25/2026 11:36:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_TNR_EServiceRejections_RejectionReasonId] ON [dbo].[TNR_EServiceRejections]
(
	[RejectionReasonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TNR_EServiceRejections_RequestId]    Script Date: 6/25/2026 11:36:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_TNR_EServiceRejections_RequestId] ON [dbo].[TNR_EServiceRejections]
(
	[RequestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TNR_EServiceRequests_AjdedAssignedToAccountUniqueUid]    Script Date: 6/25/2026 11:36:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_TNR_EServiceRequests_AjdedAssignedToAccountUniqueUid] ON [dbo].[TNR_EServiceRequests]
(
	[AjdedAssignedToAccountUniqueUid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TNR_EServiceRequests_ApplicantAccountUniqueUid]    Script Date: 6/25/2026 11:36:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_TNR_EServiceRequests_ApplicantAccountUniqueUid] ON [dbo].[TNR_EServiceRequests]
(
	[ApplicantAccountUniqueUid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TNR_EServiceRequests_RequestNumber]    Script Date: 6/25/2026 11:36:17 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_TNR_EServiceRequests_RequestNumber] ON [dbo].[TNR_EServiceRequests]
(
	[RequestNumber] ASC
)
WHERE ([RequestNumber]>(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_TNR_EServiceRequests_StatusCode]    Script Date: 6/25/2026 11:36:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_TNR_EServiceRequests_StatusCode] ON [dbo].[TNR_EServiceRequests]
(
	[StatusCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TNR_GeneratedTradeNames_IsSelected]    Script Date: 6/25/2026 11:36:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_TNR_GeneratedTradeNames_IsSelected] ON [dbo].[TNR_GeneratedTradeNames]
(
	[IsSelected] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TNR_GeneratedTradeNames_RequestId]    Script Date: 6/25/2026 11:36:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_TNR_GeneratedTradeNames_RequestId] ON [dbo].[TNR_GeneratedTradeNames]
(
	[RequestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TNR_GeneratedTradeNames_StatusId]    Script Date: 6/25/2026 11:36:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_TNR_GeneratedTradeNames_StatusId] ON [dbo].[TNR_GeneratedTradeNames]
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TNR_GeneratedTradeNames_TradeNameTemplateId]    Script Date: 6/25/2026 11:36:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_TNR_GeneratedTradeNames_TradeNameTemplateId] ON [dbo].[TNR_GeneratedTradeNames]
(
	[TradeNameTemplateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TNR_ManagerPermissions_RequestShareholderId]    Script Date: 6/25/2026 11:36:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_TNR_ManagerPermissions_RequestShareholderId] ON [dbo].[TNR_ManagerPermissions]
(
	[RequestShareholderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TNR_RequestAccessChannels_RequestId]    Script Date: 6/25/2026 11:36:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_TNR_RequestAccessChannels_RequestId] ON [dbo].[TNR_RequestAccessChannels]
(
	[RequestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TNR_RequestActivities_ActivityId]    Script Date: 6/25/2026 11:36:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_TNR_RequestActivities_ActivityId] ON [dbo].[TNR_RequestActivities]
(
	[ActivityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TNR_RequestActivities_RequestId]    Script Date: 6/25/2026 11:36:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_TNR_RequestActivities_RequestId] ON [dbo].[TNR_RequestActivities]
(
	[RequestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TNR_RequestEntities_AJDED_EntityUid]    Script Date: 6/25/2026 11:36:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_TNR_RequestEntities_AJDED_EntityUid] ON [dbo].[TNR_RequestEntities]
(
	[AJDED_EntityUid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TNR_RequestEntities_RequestId]    Script Date: 6/25/2026 11:36:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_TNR_RequestEntities_RequestId] ON [dbo].[TNR_RequestEntities]
(
	[RequestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TNR_RequestKpiValues_EServiceKpiId]    Script Date: 6/25/2026 11:36:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_TNR_RequestKpiValues_EServiceKpiId] ON [dbo].[TNR_RequestKpiValues]
(
	[EServiceKpiId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TNR_RequestKpiValues_RequestId]    Script Date: 6/25/2026 11:36:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_TNR_RequestKpiValues_RequestId] ON [dbo].[TNR_RequestKpiValues]
(
	[RequestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TNR_RequestNotifications_RequestId]    Script Date: 6/25/2026 11:36:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_TNR_RequestNotifications_RequestId] ON [dbo].[TNR_RequestNotifications]
(
	[RequestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TNR_RequestPayments_PaymentInvoiceId]    Script Date: 6/25/2026 11:36:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_TNR_RequestPayments_PaymentInvoiceId] ON [dbo].[TNR_RequestPayments]
(
	[PaymentInvoiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TNR_RequestPayments_RequestId]    Script Date: 6/25/2026 11:36:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_TNR_RequestPayments_RequestId] ON [dbo].[TNR_RequestPayments]
(
	[RequestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TNR_RequestRequiredApprovals_ApprovalId]    Script Date: 6/25/2026 11:36:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_TNR_RequestRequiredApprovals_ApprovalId] ON [dbo].[TNR_RequestRequiredApprovals]
(
	[ApprovalId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TNR_RequestRequiredApprovals_RequestId]    Script Date: 6/25/2026 11:36:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_TNR_RequestRequiredApprovals_RequestId] ON [dbo].[TNR_RequestRequiredApprovals]
(
	[RequestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_TNR_RequestRequiredApprovals_StatusCode]    Script Date: 6/25/2026 11:36:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_TNR_RequestRequiredApprovals_StatusCode] ON [dbo].[TNR_RequestRequiredApprovals]
(
	[StatusCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TNR_RequestShareholders_AccountUniqueUid]    Script Date: 6/25/2026 11:36:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_TNR_RequestShareholders_AccountUniqueUid] ON [dbo].[TNR_RequestShareholders]
(
	[AccountUniqueUid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TNR_RequestShareholders_RequestId]    Script Date: 6/25/2026 11:36:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_TNR_RequestShareholders_RequestId] ON [dbo].[TNR_RequestShareholders]
(
	[RequestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TNR_RequestSubmitters_RequestId]    Script Date: 6/25/2026 11:36:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_TNR_RequestSubmitters_RequestId] ON [dbo].[TNR_RequestSubmitters]
(
	[RequestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_TNR_Services_Code]    Script Date: 6/25/2026 11:36:17 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_TNR_Services_Code] ON [dbo].[TNR_Services]
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TNR_StepActions_ActionDefinitionId]    Script Date: 6/25/2026 11:36:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_TNR_StepActions_ActionDefinitionId] ON [dbo].[TNR_StepActions]
(
	[ActionDefinitionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TNR_StepActions_StepId]    Script Date: 6/25/2026 11:36:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_TNR_StepActions_StepId] ON [dbo].[TNR_StepActions]
(
	[StepId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TNR_Steps_ServiceId]    Script Date: 6/25/2026 11:36:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_TNR_Steps_ServiceId] ON [dbo].[TNR_Steps]
(
	[ServiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_TNR_Steps_StepCode]    Script Date: 6/25/2026 11:36:17 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_TNR_Steps_StepCode] ON [dbo].[TNR_Steps]
(
	[StepCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TNR_TNRepository_EntityId]    Script Date: 6/25/2026 11:36:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_TNR_TNRepository_EntityId] ON [dbo].[TNR_TNRepository]
(
	[EntityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TNR_TNRepository_RequestId]    Script Date: 6/25/2026 11:36:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_TNR_TNRepository_RequestId] ON [dbo].[TNR_TNRepository]
(
	[RequestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TNR_TradeNameTemplates_ActivityId]    Script Date: 6/25/2026 11:36:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_TNR_TradeNameTemplates_ActivityId] ON [dbo].[TNR_TradeNameTemplates]
(
	[ActivityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TNR_TradeNameTemplates_LegalFormId]    Script Date: 6/25/2026 11:36:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_TNR_TradeNameTemplates_LegalFormId] ON [dbo].[TNR_TradeNameTemplates]
(
	[LegalFormId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TNR_Transactions_CurrentStepId]    Script Date: 6/25/2026 11:36:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_TNR_Transactions_CurrentStepId] ON [dbo].[TNR_Transactions]
(
	[CurrentStepId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TNR_Transactions_OrganizationId]    Script Date: 6/25/2026 11:36:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_TNR_Transactions_OrganizationId] ON [dbo].[TNR_Transactions]
(
	[OrganizationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_TNR_Transactions_ProcessInstanceId]    Script Date: 6/25/2026 11:36:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_TNR_Transactions_ProcessInstanceId] ON [dbo].[TNR_Transactions]
(
	[ProcessInstanceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_TNR_Transactions_RefNumber]    Script Date: 6/25/2026 11:36:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_TNR_Transactions_RefNumber] ON [dbo].[TNR_Transactions]
(
	[RefNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TNR_Transactions_ServiceId]    Script Date: 6/25/2026 11:36:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_TNR_Transactions_ServiceId] ON [dbo].[TNR_Transactions]
(
	[ServiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TNR_Transactions_StatusId]    Script Date: 6/25/2026 11:36:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_TNR_Transactions_StatusId] ON [dbo].[TNR_Transactions]
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TNR_Transactions_UserId]    Script Date: 6/25/2026 11:36:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_TNR_Transactions_UserId] ON [dbo].[TNR_Transactions]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TNR_EServiceOutcomes] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [CreatedAt]
GO
ALTER TABLE [dbo].[TNR_EServiceOutcomes] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[TNR_EServiceRejections] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[TNR_EServiceRequests] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[TNR_GeneratedTradeNames] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[TNR_GeneratedTradeNames] ADD  DEFAULT ((0)) FOR [DisplayOrder]
GO
ALTER TABLE [dbo].[TNR_ManagerPermissions] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[TNR_NotificationTemplateDefinitions] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[TNR_NotificationTemplates] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[TNR_ReceiverLists] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[TNR_RequestAccessChannels] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[TNR_RequestActivities] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[TNR_RequestActivities] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsMainActivity]
GO
ALTER TABLE [dbo].[TNR_RequestActivities] ADD  DEFAULT (0x) FOR [RowVersion]
GO
ALTER TABLE [dbo].[TNR_RequestEntities] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[TNR_RequestKpiValues] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[TNR_RequestNotifications] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[TNR_RequestPayments] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[TNR_RequestPurposes] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[TNR_RequestRequiredApprovals] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[TNR_RequestShareholders] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[TNR_RequestShareholders] ADD  DEFAULT (N'PENDING_CONFIRMATION') FOR [StatusCode]
GO
ALTER TABLE [dbo].[TNR_RequestSubmitters] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[TNR_Services] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[TNR_TNRepository] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[TNR_TNRepositoryTemp] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[TNR_TradeNameTemplates] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[TNR_Transactions] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[TNR_GeneratedTradeNames]  WITH CHECK ADD  CONSTRAINT [FK_TNR_GeneratedTradeNames_TNR_TradeNameTemplates_TradeNameTemplateId] FOREIGN KEY([TradeNameTemplateId])
REFERENCES [dbo].[TNR_TradeNameTemplates] ([Id])
GO
ALTER TABLE [dbo].[TNR_GeneratedTradeNames] CHECK CONSTRAINT [FK_TNR_GeneratedTradeNames_TNR_TradeNameTemplates_TradeNameTemplateId]
GO
ALTER TABLE [dbo].[TNR_ManagerPermissions]  WITH CHECK ADD  CONSTRAINT [FK_TNR_ManagerPermissions_TNR_RequestShareholders_RequestShareholderId] FOREIGN KEY([RequestShareholderId])
REFERENCES [dbo].[TNR_RequestShareholders] ([Id])
GO
ALTER TABLE [dbo].[TNR_ManagerPermissions] CHECK CONSTRAINT [FK_TNR_ManagerPermissions_TNR_RequestShareholders_RequestShareholderId]
GO
ALTER TABLE [dbo].[TNR_StepActions]  WITH CHECK ADD  CONSTRAINT [FK_TNR_StepActions_TNR_ActionDefinitions_ActionDefinitionId] FOREIGN KEY([ActionDefinitionId])
REFERENCES [dbo].[TNR_ActionDefinitions] ([Id])
GO
ALTER TABLE [dbo].[TNR_StepActions] CHECK CONSTRAINT [FK_TNR_StepActions_TNR_ActionDefinitions_ActionDefinitionId]
GO
ALTER TABLE [dbo].[TNR_StepActions]  WITH CHECK ADD  CONSTRAINT [FK_TNR_StepActions_TNR_Steps_StepId] FOREIGN KEY([StepId])
REFERENCES [dbo].[TNR_Steps] ([Id])
GO
ALTER TABLE [dbo].[TNR_StepActions] CHECK CONSTRAINT [FK_TNR_StepActions_TNR_Steps_StepId]
GO
ALTER TABLE [dbo].[TNR_Steps]  WITH CHECK ADD  CONSTRAINT [FK_TNR_Steps_TNR_Services_ServiceId] FOREIGN KEY([ServiceId])
REFERENCES [dbo].[TNR_Services] ([Id])
GO
ALTER TABLE [dbo].[TNR_Steps] CHECK CONSTRAINT [FK_TNR_Steps_TNR_Services_ServiceId]
GO
ALTER TABLE [dbo].[TNR_Transactions]  WITH CHECK ADD  CONSTRAINT [FK_TNR_Transactions_TNR_Services_ServiceId] FOREIGN KEY([ServiceId])
REFERENCES [dbo].[TNR_Services] ([Id])
GO
ALTER TABLE [dbo].[TNR_Transactions] CHECK CONSTRAINT [FK_TNR_Transactions_TNR_Services_ServiceId]
GO
ALTER TABLE [dbo].[TNR_Transactions]  WITH CHECK ADD  CONSTRAINT [FK_TNR_Transactions_TNR_Steps_CurrentStepId] FOREIGN KEY([CurrentStepId])
REFERENCES [dbo].[TNR_Steps] ([Id])
GO
ALTER TABLE [dbo].[TNR_Transactions] CHECK CONSTRAINT [FK_TNR_Transactions_TNR_Steps_CurrentStepId]
GO
USE [master]
GO
ALTER DATABASE [DED_TradeNameReservationService] SET  READ_WRITE 
GO
