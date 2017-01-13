﻿CREATE PROCEDURE [dbo].[usp_DAILY_AUDIT_DB_BACK_UP] AS 
BEGIN 

DECLARE @SQL NVARCHAR(MAX)
;WITH DBS AS (

SELECT 'APAudit' as DB       ,REPLACE(REPLACE(REPLACE(CONVERT(VARCHAR(50),GETDATE(),120),' ',''),':',''),'-','') DATESTAMP    UNION 
SELECT 'APShared'          ,REPLACE(REPLACE(REPLACE(CONVERT(VARCHAR(50),GETDATE(),120),' ',''),':',''),'-','')             UNION 
--SELECT 'APMedia'           ,REPLACE(REPLACE(REPLACE(CONVERT(VARCHAR(50),GETDATE(),120),' ',''),':',''),'-','')             UNION 
SELECT 'APSSNSSB'          ,REPLACE(REPLACE(REPLACE(CONVERT(VARCHAR(50),GETDATE(),120),' ',''),':',''),'-','')             UNION 
SELECT 'IONSSB'                    ,REPLACE(REPLACE(REPLACE(CONVERT(VARCHAR(50),GETDATE(),120),' ',''),':',''),'-','')
) 

SELECT @SQL = 
STUFF( (
SELECT REPLACE(REPLACE(
'---' + CHAR(10) + 
'BACKUP DATABASE $DB$ TO DISK = ''\\lv-pdsqlbi01\ExcellusPickup\DB_Backups\$DATESTAMP$_$DB$.BAK''   WITH FORMAT,COMPRESSION;'
,'$DB$',DB),'$DATESTAMP$',DATESTAMP)
FROM DBS
FOR XML PATH('')), 1, 1, '')

PRINT @SQL
EXECUTE SP_EXECUTESQL @SQL

END
