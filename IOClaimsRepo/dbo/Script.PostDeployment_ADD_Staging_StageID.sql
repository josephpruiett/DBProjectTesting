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
BEGIN

		IF NOT EXISTS (SELECT COLUMN_NAME FROM [$(DatabaseName)].[INFORMATION_SCHEMA].[COLUMNS] WHERE TABLE_NAME = 'Beneficiary'  	AND COLUMN_NAME = 'STAGING_StageID')
		BEGIN
		ALTER TABLE [$(DatabaseName)].[dbo].[Beneficiary] ADD [STAGING_StageID] INT NULL
		END
		IF NOT EXISTS (SELECT COLUMN_NAME FROM [$(DatabaseName)].[INFORMATION_SCHEMA].[COLUMNS] WHERE TABLE_NAME = 'Claim'			AND COLUMN_NAME = 'STAGING_StageID')
		BEGIN
		ALTER TABLE [$(DatabaseName)].[dbo].[Claim] ADD [STAGING_StageID] INT NULL
		END
		IF NOT EXISTS (SELECT COLUMN_NAME FROM [$(DatabaseName)].[INFORMATION_SCHEMA].[COLUMNS] WHERE TABLE_NAME = 'InsuredParty'		AND COLUMN_NAME = 'STAGING_StageID')
		BEGIN
		ALTER TABLE [$(DatabaseName)].[dbo].[InsuredParty] ADD [STAGING_StageID] INT NULL
		END
		IF NOT EXISTS (SELECT COLUMN_NAME FROM [IOClaimsRepo].[INFORMATION_SCHEMA].[COLUMNS] WHERE TABLE_NAME = 'Payer'			AND COLUMN_NAME = 'STAGING_StageID')
		BEGIN
		ALTER TABLE [IOClaimsRepo].[dbo].[Payer] ADD [STAGING_StageID] INT NULL
		END
		IF NOT EXISTS (SELECT COLUMN_NAME FROM [$(DatabaseName)].[INFORMATION_SCHEMA].[COLUMNS] WHERE TABLE_NAME = 'Provider'			AND COLUMN_NAME = 'STAGING_StageID')
		BEGIN
		ALTER TABLE [$(DatabaseName)].[dbo].[Provider] ADD [STAGING_StageID] INT NULL
		END
		IF NOT EXISTS (SELECT COLUMN_NAME FROM [$(DatabaseName)].[INFORMATION_SCHEMA].[COLUMNS] WHERE TABLE_NAME = 'ServiceLine'		AND COLUMN_NAME = 'STAGING_StageID')
		BEGIN
		ALTER TABLE [$(DatabaseName)].[dbo].[ServiceLine] ADD [STAGING_StageID] INT NULL
		END

END
