﻿/*
Deployment script for StudentRegistrationDB

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "StudentRegistrationDB"
:setvar DefaultFilePrefix "StudentRegistrationDB"
:setvar DefaultDataPath "C:\Users\Michael Hrybyk\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\"
:setvar DefaultLogPath "C:\Users\Michael Hrybyk\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [master];


GO

IF (DB_ID(N'$(DatabaseName)') IS NOT NULL) 
BEGIN
    ALTER DATABASE [$(DatabaseName)]
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [$(DatabaseName)];
END

GO
PRINT N'Creating $(DatabaseName)...'
GO
CREATE DATABASE [$(DatabaseName)]
    ON 
    PRIMARY(NAME = [$(DatabaseName)], FILENAME = N'$(DefaultDataPath)$(DefaultFilePrefix)_Primary.mdf')
    LOG ON (NAME = [$(DatabaseName)_log], FILENAME = N'$(DefaultLogPath)$(DefaultFilePrefix)_Primary.ldf') COLLATE SQL_Latin1_General_CP1_CI_AS
GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CLOSE OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
USE [$(DatabaseName)];


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS ON,
                ANSI_PADDING ON,
                ANSI_WARNINGS ON,
                ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                NUMERIC_ROUNDABORT OFF,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL,
                CURSOR_CLOSE_ON_COMMIT OFF,
                AUTO_CREATE_STATISTICS ON,
                AUTO_SHRINK OFF,
                AUTO_UPDATE_STATISTICS ON,
                RECURSIVE_TRIGGERS OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ALLOW_SNAPSHOT_ISOLATION OFF;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET READ_COMMITTED_SNAPSHOT OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_UPDATE_STATISTICS_ASYNC OFF,
                PAGE_VERIFY NONE,
                DATE_CORRELATION_OPTIMIZATION OFF,
                DISABLE_BROKER,
                PARAMETERIZATION SIMPLE,
                SUPPLEMENTAL_LOGGING OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET TRUSTWORTHY OFF,
        DB_CHAINING OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'The database settings cannot be modified. You must be a SysAdmin to apply these settings.';
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET HONOR_BROKER_PRIORITY OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'The database settings cannot be modified. You must be a SysAdmin to apply these settings.';
    END


GO
ALTER DATABASE [$(DatabaseName)]
    SET TARGET_RECOVERY_TIME = 0 SECONDS 
    WITH ROLLBACK IMMEDIATE;


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET FILESTREAM(NON_TRANSACTED_ACCESS = OFF),
                CONTAINMENT = NONE 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CREATE_STATISTICS ON(INCREMENTAL = OFF),
                MEMORY_OPTIMIZED_ELEVATE_TO_SNAPSHOT = OFF,
                DELAYED_DURABILITY = DISABLED 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE (QUERY_CAPTURE_MODE = ALL, DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_PLANS_PER_QUERY = 200, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 367), MAX_STORAGE_SIZE_MB = 100) 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE = OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
    END


GO
IF fulltextserviceproperty(N'IsFulltextInstalled') = 1
    EXECUTE sp_fulltext_database 'enable';


GO
PRINT N'Creating [dbo].[Courses]...';


GO
CREATE TABLE [dbo].[Courses] (
    [CourseId]     INT           IDENTITY (1, 1) NOT NULL,
    [CourseNumber] INT           NOT NULL,
    [DepartmentId] INT           NOT NULL,
    [CourseName]   NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED ([CourseId] ASC),
    CONSTRAINT [UN_Courses] UNIQUE NONCLUSTERED ([CourseNumber] ASC, [DepartmentId] ASC)
);


GO
PRINT N'Creating [dbo].[Courses].[IX_CourseNumber_DepartmentId]...';


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_CourseNumber_DepartmentId]
    ON [dbo].[Courses]([CourseNumber] ASC, [DepartmentId] ASC);


GO
PRINT N'Creating [dbo].[Departments]...';


GO
CREATE TABLE [dbo].[Departments] (
    [DepartmentId]   INT           IDENTITY (1, 1) NOT NULL,
    [DepartmentCode] NVARCHAR (10) NOT NULL,
    [DepartmentName] NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED ([DepartmentId] ASC)
);


GO
PRINT N'Creating [dbo].[Departments].[IX_DepartmentCode]...';


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_DepartmentCode]
    ON [dbo].[Departments]([DepartmentCode] ASC);


GO
PRINT N'Creating [dbo].[StudentCourses]...';


GO
CREATE TABLE [dbo].[StudentCourses] (
    [CourseId]  INT NOT NULL,
    [StudentId] INT NOT NULL,
    CONSTRAINT [PK_StudentCourses] PRIMARY KEY CLUSTERED ([CourseId] ASC, [StudentId] ASC)
);


GO
PRINT N'Creating [dbo].[StudentCourses].[IX_CourseId]...';


GO
CREATE NONCLUSTERED INDEX [IX_CourseId]
    ON [dbo].[StudentCourses]([CourseId] ASC);


GO
PRINT N'Creating [dbo].[StudentCourses].[IX_StudentId]...';


GO
CREATE NONCLUSTERED INDEX [IX_StudentId]
    ON [dbo].[StudentCourses]([StudentId] ASC);


GO
PRINT N'Creating [dbo].[Students]...';


GO
CREATE TABLE [dbo].[Students] (
    [StudentId]        INT           IDENTITY (1, 1) NOT NULL,
    [StudentFirstName] NVARCHAR (50) NOT NULL,
    [StudentLastName]  NVARCHAR (50) NOT NULL,
    [DepartmentId]     INT           NULL,
    CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED ([StudentId] ASC)
);


GO
PRINT N'Creating [dbo].[Students].[IX_DepartmentId]...';


GO
CREATE NONCLUSTERED INDEX [IX_DepartmentId]
    ON [dbo].[Students]([DepartmentId] ASC);


GO
PRINT N'Creating [dbo].[FK_Courses_Departments_DepartmentId]...';


GO
ALTER TABLE [dbo].[Courses]
    ADD CONSTRAINT [FK_Courses_Departments_DepartmentId] FOREIGN KEY ([DepartmentId]) REFERENCES [dbo].[Departments] ([DepartmentId]) ON DELETE CASCADE;


GO
PRINT N'Creating [dbo].[FK_StudentCourses_Courses_CourseId]...';


GO
ALTER TABLE [dbo].[StudentCourses]
    ADD CONSTRAINT [FK_StudentCourses_Courses_CourseId] FOREIGN KEY ([CourseId]) REFERENCES [dbo].[Courses] ([CourseId]) ON DELETE CASCADE;


GO
PRINT N'Creating [dbo].[FK_StudentCourses_Students_StudentId]...';


GO
ALTER TABLE [dbo].[StudentCourses]
    ADD CONSTRAINT [FK_StudentCourses_Students_StudentId] FOREIGN KEY ([StudentId]) REFERENCES [dbo].[Students] ([StudentId]) ON DELETE CASCADE;


GO
PRINT N'Creating [dbo].[FK_Students_Departments_DepartmentId]...';


GO
ALTER TABLE [dbo].[Students]
    ADD CONSTRAINT [FK_Students_Departments_DepartmentId] FOREIGN KEY ([DepartmentId]) REFERENCES [dbo].[Departments] ([DepartmentId]);


GO
/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

SET IDENTITY_INSERT [dbo].[Departments] ON
INSERT INTO [dbo].[Departments] ([DepartmentId], [DepartmentCode], [DepartmentName]) VALUES (1, N'CSIS', N'Computing Studies')
INSERT INTO [dbo].[Departments] ([DepartmentId], [DepartmentCode], [DepartmentName]) VALUES (2, N'ACCT', N'Accounting')
INSERT INTO [dbo].[Departments] ([DepartmentId], [DepartmentCode], [DepartmentName]) VALUES (3, N'MKTG', N'Marketing')
INSERT INTO [dbo].[Departments] ([DepartmentId], [DepartmentCode], [DepartmentName]) VALUES (4, N'FINC', N'Finance')
SET IDENTITY_INSERT [dbo].[Departments] OFF
GO

SET IDENTITY_INSERT [dbo].[Students] ON
INSERT INTO [dbo].[Students] ([StudentId], [StudentFirstName], [StudentLastName], [DepartmentId]) VALUES (1, N'Svetlana', N'Rostov', 1)
INSERT INTO [dbo].[Students] ([StudentId], [StudentFirstName], [StudentLastName], [DepartmentId]) VALUES (2, N'Claire', N'Bloome', 2)
INSERT INTO [dbo].[Students] ([StudentId], [StudentFirstName], [StudentLastName], [DepartmentId]) VALUES (3, N'Sven', N'Baertschi', 2)
INSERT INTO [dbo].[Students] ([StudentId], [StudentFirstName], [StudentLastName], [DepartmentId]) VALUES (4, N'Cesar', N'Chavez', 4)
INSERT INTO [dbo].[Students] ([StudentId], [StudentFirstName], [StudentLastName], [DepartmentId]) VALUES (5, N'Debra', N'Manning', 1)
INSERT INTO [dbo].[Students] ([StudentId], [StudentFirstName], [StudentLastName], [DepartmentId]) VALUES (6, N'Fadi', N'Hadari', 2)
INSERT INTO [dbo].[Students] ([StudentId], [StudentFirstName], [StudentLastName], [DepartmentId]) VALUES (7, N'Hanyeng', N'Fen', 2)
INSERT INTO [dbo].[Students] ([StudentId], [StudentFirstName], [StudentLastName], [DepartmentId]) VALUES (8, N'Hugo', N'Victor', 4)
INSERT INTO [dbo].[Students] ([StudentId], [StudentFirstName], [StudentLastName], [DepartmentId]) VALUES (9, N'Lance', N'Armstrong', 2)
INSERT INTO [dbo].[Students] ([StudentId], [StudentFirstName], [StudentLastName], [DepartmentId]) VALUES (10, N'Terry', N'Matthews', 1)
INSERT INTO [dbo].[Students] ([StudentId], [StudentFirstName], [StudentLastName], [DepartmentId]) VALUES (11, N'Eugene', N'Fei', 4)
INSERT INTO [dbo].[Students] ([StudentId], [StudentFirstName], [StudentLastName], [DepartmentId]) VALUES (12, N'Michael', N'Thorson', 1)
INSERT INTO [dbo].[Students] ([StudentId], [StudentFirstName], [StudentLastName], [DepartmentId]) VALUES (13, N'Simon', N'Li', 1)
SET IDENTITY_INSERT [dbo].[Students] OFF
GO

SET IDENTITY_INSERT [dbo].[Courses] ON
INSERT INTO [dbo].[Courses] ([CourseId], [CourseNumber], [DepartmentId], [CourseName]) VALUES (1, 101, 1, N'Programming I')
INSERT INTO [dbo].[Courses] ([CourseId], [CourseNumber], [DepartmentId], [CourseName]) VALUES (2, 102, 1, N'Programming II')
INSERT INTO [dbo].[Courses] ([CourseId], [CourseNumber], [DepartmentId], [CourseName]) VALUES (3, 101, 2, N'Accounting I')
INSERT INTO [dbo].[Courses] ([CourseId], [CourseNumber], [DepartmentId], [CourseName]) VALUES (4, 102, 2, N'Accounting II')
INSERT INTO [dbo].[Courses] ([CourseId], [CourseNumber], [DepartmentId], [CourseName]) VALUES (5, 101, 4, N'Corporate Finance')
SET IDENTITY_INSERT [dbo].[Courses] OFF
GO

INSERT INTO [dbo].[StudentCourses] ([CourseId], [StudentId]) VALUES (1, 1)
INSERT INTO [dbo].[StudentCourses] ([CourseId], [StudentId]) VALUES (2, 1)
INSERT INTO [dbo].[StudentCourses] ([CourseId], [StudentId]) VALUES (5, 1)
INSERT INTO [dbo].[StudentCourses] ([CourseId], [StudentId]) VALUES (1, 2)
INSERT INTO [dbo].[StudentCourses] ([CourseId], [StudentId]) VALUES (3, 3)
GO

GO
DECLARE @VarDecimalSupported AS BIT;

SELECT @VarDecimalSupported = 0;

IF ((ServerProperty(N'EngineEdition') = 3)
    AND (((@@microsoftversion / power(2, 24) = 9)
          AND (@@microsoftversion & 0xffff >= 3024))
         OR ((@@microsoftversion / power(2, 24) = 10)
             AND (@@microsoftversion & 0xffff >= 1600))))
    SELECT @VarDecimalSupported = 1;

IF (@VarDecimalSupported > 0)
    BEGIN
        EXECUTE sp_db_vardecimal_storage_format N'$(DatabaseName)', 'ON';
    END


GO
PRINT N'Update complete.';


GO
