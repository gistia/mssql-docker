/*
 Navicat Premium Data Transfer

 Source Server         : Local
 Source Server Type    : SQL Server
 Source Server Version : 14000100
 Source Host           : localhost
 Source Database       : cis
 Source Schema         : dbo

 Target Server Type    : SQL Server
 Target Server Version : 14000100
 File Encoding         : utf-8

 Date: 03/23/2017 00:51:07 AM
*/

-- ----------------------------
--  Table structure for Agencies
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo].[Agencies]') AND type IN ('U'))
	DROP TABLE [dbo].[Agencies]
GO
CREATE TABLE [dbo].[Agencies] (
	[ID] int IDENTITY(1,1) NOT NULL,
	[Name] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[County] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Logo] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Region] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[State] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Contact] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Address] varchar(512) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Phone] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Email] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
ON [PRIMARY]
GO

-- ----------------------------
--  Table structure for Businesses
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo].[Businesses]') AND type IN ('U'))
	DROP TABLE [dbo].[Businesses]
GO
CREATE TABLE [dbo].[Businesses] (
	[ID] int NOT NULL,
	[AgencyID] int NULL,
	[Name] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[DBA] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BEAN] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Address] varchar(512) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Latitude] float(53) NULL,
	[Longitude] float(53) NULL,
	[Owner] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Contact] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Phone] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Website] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Email] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
ON [PRIMARY]
GO

-- ----------------------------
--  Table structure for Inspections
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo].[Inspections]') AND type IN ('U'))
	DROP TABLE [dbo].[Inspections]
GO
CREATE TABLE [dbo].[Inspections] (
	[ID] int IDENTITY(1,1) NOT NULL,
	[InspectionTemplateID] int NULL,
	[Number] int NULL,
	[ScheduledDate] datetime2(0) NULL,
	[InspectionDate] datetime2(0) NULL,
	[InspectorID] int NULL,
	[Announced] int NULL,
	[CreatedAt] datetime2(0) NULL,
	[CreatedBy] int NULL,
	[LockedAt] datetime2(0) NULL,
	[LockedBy] int NULL
)
ON [PRIMARY]
GO

-- ----------------------------
--  Table structure for InspectionTemplates
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo].[InspectionTemplates]') AND type IN ('U'))
	DROP TABLE [dbo].[InspectionTemplates]
GO
CREATE TABLE [dbo].[InspectionTemplates] (
	[ID] int NOT NULL,
	[Name] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreatedBy] int NULL,
	[CreatedOn] datetime2(0) NULL
)
ON [PRIMARY]
GO

-- ----------------------------
--  Table structure for Users
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo].[Users]') AND type IN ('U'))
	DROP TABLE [dbo].[Users]
GO
CREATE TABLE [dbo].[Users] (
	[ID] int IDENTITY(1,1) NOT NULL,
	[Email] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Name] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Designation] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PasswordHash] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PasswordSalt] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
ON [PRIMARY]
GO


-- ----------------------------
--  Primary key structure for table Agencies
-- ----------------------------
ALTER TABLE [dbo].[Agencies] ADD
	CONSTRAINT [PK__Agencies__3214EC27AB101289] PRIMARY KEY CLUSTERED ([ID])
	WITH (PAD_INDEX = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON)
	ON [default]
GO

-- ----------------------------
--  Primary key structure for table Businesses
-- ----------------------------
ALTER TABLE [dbo].[Businesses] ADD
	CONSTRAINT [PK__Business__3214EC27829D5E1A] PRIMARY KEY CLUSTERED ([ID])
	WITH (PAD_INDEX = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON)
	ON [default]
GO

-- ----------------------------
--  Primary key structure for table Inspections
-- ----------------------------
ALTER TABLE [dbo].[Inspections] ADD
	CONSTRAINT [PK__Inspecti__3214EC27B500C33A] PRIMARY KEY CLUSTERED ([ID])
	WITH (PAD_INDEX = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON)
	ON [default]
GO

-- ----------------------------
--  Primary key structure for table InspectionTemplates
-- ----------------------------
ALTER TABLE [dbo].[InspectionTemplates] ADD
	CONSTRAINT [PK__Inspecti__3214EC277B48676D] PRIMARY KEY CLUSTERED ([ID])
	WITH (PAD_INDEX = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON)
	ON [default]
GO

-- ----------------------------
--  Primary key structure for table Users
-- ----------------------------
ALTER TABLE [dbo].[Users] ADD
	CONSTRAINT [PK__Users__1788CCAC3BFF601C] PRIMARY KEY CLUSTERED ([ID])
	WITH (PAD_INDEX = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON)
	ON [default]
GO

-- ----------------------------
--  Foreign keys structure for table Businesses
-- ----------------------------
ALTER TABLE [dbo].[Businesses] ADD
	CONSTRAINT [Businesses_Agency] FOREIGN KEY ([AgencyID]) REFERENCES [dbo].[Agencies] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
--  Foreign keys structure for table Inspections
-- ----------------------------
ALTER TABLE [dbo].[Inspections] ADD
	CONSTRAINT [Inspection_CreaterBy_User] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT [Inspection_LockedBy_User] FOREIGN KEY ([LockedBy]) REFERENCES [dbo].[Users] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT [Inspection_Inspector_User] FOREIGN KEY ([InspectorID]) REFERENCES [dbo].[Users] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
--  Options for table Agencies
-- ----------------------------
ALTER TABLE [dbo].[Agencies] SET (LOCK_ESCALATION = TABLE)
GO
DBCC CHECKIDENT ('[dbo].[Agencies]', RESEED, 1)
GO

-- ----------------------------
--  Options for table Businesses
-- ----------------------------
ALTER TABLE [dbo].[Businesses] SET (LOCK_ESCALATION = TABLE)
GO

-- ----------------------------
--  Options for table Inspections
-- ----------------------------
ALTER TABLE [dbo].[Inspections] SET (LOCK_ESCALATION = TABLE)
GO
DBCC CHECKIDENT ('[dbo].[Inspections]', RESEED, 1)
GO

-- ----------------------------
--  Options for table InspectionTemplates
-- ----------------------------
ALTER TABLE [dbo].[InspectionTemplates] SET (LOCK_ESCALATION = TABLE)
GO

-- ----------------------------
--  Options for table Users
-- ----------------------------
ALTER TABLE [dbo].[Users] SET (LOCK_ESCALATION = TABLE)
GO
DBCC CHECKIDENT ('[dbo].[Users]', RESEED, 1)
GO

