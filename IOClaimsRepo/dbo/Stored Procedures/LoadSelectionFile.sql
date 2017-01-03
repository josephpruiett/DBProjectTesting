
CREATE PROCEDURE LoadSelectionFile
	@InputFilePath varchar(500)
AS
BEGIN
	
	DECLARE @ErrorFilePath varchar(500) = @InputFilePath+ '.error'
	
	-- Bulk load input provider contact list file : expecting a TAB delimited file
	DECLARE @sql NVARCHAR(4000) = 'BULK INSERT IOClaimsRepo.dbo.RESC_Excellus_Selection FROM ''' + @InputFilePath 
					+ ''' WITH ( FIRSTROW = ' + CONVERT(varchar(2), 2)
					+ ', FIELDTERMINATOR =''\t'', ROWTERMINATOR =''\n'' '
					+ ', ERRORFILE = ''' + @ErrorFilePath
					+ ''', TABLOCK '
					+ ' )';
	EXEC(@sql);
	
END
