﻿/*
Deployment script for Ch7SharedDatabase

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "Ch7SharedDatabase"
:setvar DefaultFilePrefix "Ch7SharedDatabase"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\"

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
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL 
            WITH ROLLBACK IMMEDIATE;
        
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET PAGE_VERIFY NONE 
            WITH ROLLBACK IMMEDIATE;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Rename refactoring operation with key e3ad0f09-0b05-4b5e-8843-78a46d0bdaa5 is skipped, element [dbo].[Artist].[Id] (SqlSimpleColumn) will not be renamed to UserId';


GO
PRINT N'Rename refactoring operation with key ca67eee0-6342-4f1c-8c38-e6af1d2310a6 is skipped, element [dbo].[Artist].[CreateDate] (SqlSimpleColumn) will not be renamed to ProfileCreateDate';


GO
PRINT N'Creating [dbo].[Artist]...';


GO
CREATE TABLE [dbo].[Artist] (
    [UserId]              INT           NOT NULL,
    [ArtistDisplayName]   VARCHAR (50)  NOT NULL,
    [Bio]                 VARCHAR (255) NULL,
    [MusicalInfluences]   VARCHAR (255) NULL,
    [Country]             VARCHAR (50)  NULL,
    [Provence]            VARCHAR (50)  NULL,
    [ProfileCreateDate]   SMALLDATETIME NOT NULL,
    [WebSite]             VARCHAR (255) NULL,
    [ProfilePrivacyLevel] TINYINT       NOT NULL,
    [ContactPrivacyLevel] TINYINT       NOT NULL,
    [ProfileViews]        BIGINT        NOT NULL,
    [ProfileLastViewDate] SMALLDATETIME NULL,
    [Rating]              TINYINT       NULL,
    PRIMARY KEY CLUSTERED ([UserId] ASC)
);


GO
PRINT N'Creating Default Constraint on [dbo].[Artist]....';


GO
ALTER TABLE [dbo].[Artist]
    ADD DEFAULT getdate() FOR [ProfileCreateDate];


GO
PRINT N'Creating Default Constraint on [dbo].[Artist]....';


GO
ALTER TABLE [dbo].[Artist]
    ADD DEFAULT 0 FOR [ProfilePrivacyLevel];


GO
PRINT N'Creating Default Constraint on [dbo].[Artist]....';


GO
ALTER TABLE [dbo].[Artist]
    ADD DEFAULT 0 FOR [ContactPrivacyLevel];


GO
PRINT N'Creating Default Constraint on [dbo].[Artist]....';


GO
ALTER TABLE [dbo].[Artist]
    ADD DEFAULT 0 FOR [ProfileViews];


GO
PRINT N'Creating Default Constraint on [dbo].[Artist]....';


GO
ALTER TABLE [dbo].[Artist]
    ADD DEFAULT 3 FOR [Rating];


GO
-- Refactoring step to update target server with deployed transaction logs

IF OBJECT_ID(N'dbo.__RefactorLog') IS NULL
BEGIN
    CREATE TABLE [dbo].[__RefactorLog] (OperationKey UNIQUEIDENTIFIER NOT NULL PRIMARY KEY)
    EXEC sp_addextendedproperty N'microsoft_database_tools_support', N'refactoring log', N'schema', N'dbo', N'table', N'__RefactorLog'
END
GO
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'e3ad0f09-0b05-4b5e-8843-78a46d0bdaa5')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('e3ad0f09-0b05-4b5e-8843-78a46d0bdaa5')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'ca67eee0-6342-4f1c-8c38-e6af1d2310a6')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('ca67eee0-6342-4f1c-8c38-e6af1d2310a6')

GO

GO
PRINT N'Update complete.'
GO
