
CREATE PROCEDURE RunExcellusSelectionBatchValidations
	@InputFile varchar(200), --Identified_DRG_20161212.txt
	@Batchname varchar(200),
	@ContractName varchar(200),
	@ClientName varchar(200),
	@BatchnameApConvention varchar(200),
	@ClaimType varchar(10) --DME for DME, IP for DRG, OP for OP?
	
AS
BEGIN

	SELECT 'Loading Selection file from RE'
	DECLARE @InputFilePath varchar(500) 
	SET @InputFilePath  = '\\lv-pdsqlbi01\ExcellusPickup\SelectionFiles\' + @InputFile
	
	SELECT @InputFilePath
		
	EXEC IOclaimsrepo.dbo.LoadSelectionFile @InputFilePath
	
	SELECT 'Total number of Target claims' 
	select count(distinct claim_key) from RESC_Excellus_Selection where batch_key = @Batchname
	
	SELECT 'Total number of Ref claims' 
	select count(distinct REF_CLAIM1_KEY) from RESC_Excellus_Selection where batch_key = @Batchname
	
	SELECT 'Claims with missing bene record - WARN: only considers target claims, not the ref claims'
	select distinct ClaimNumber from IOClaimsRepo.dbo.claim with (nolock) where claimnumber in (
		select distinct claim_key from RESC_Excellus_Selection where batch_key = @Batchname
	) and Beneficiary_id = 1
	
	SELECT 'Audit concepts that are not defined in AP'	
	SELECT distinct VULNERABILITY1_ID FROM  RESC_Excellus_Selection where batch_key = @Batchname and 
	VULNERABILITY1_ID not in (Select distinct clientIssueId from NewAuditPlatform.dbo.IssueAssignment)
	
	SELECT 'RESC File Output'
	--TODO: need to parameterize for DME/DRG/Contract

	SELECT Distinct
	CASE_ID,
	'C' as AUDIT_TYPE, -- 'A' for Automated, 'C' for complex
	@ContractName as CONTRACT_ID,
	CLAIM_KEY as CLAIM_KEY,
	@ClientName as CLIENT_ID,
	CLAIM_KEY as CLAIM_ID,
	'1' AS LINE_NUMBER, --TODO: need to be able to pass this in as empty
	'2' as REC_LINE_STATUS,
	'' AS REC_HCPCS ,
	'' AS REC_MOD1 ,
	'' AS REC_MOD2 ,
	'' AS REC_MOD3 ,
	'' AS REC_MOD4 ,
	'' AS REC_UNITS ,
	'' AS REC_PCT ,
	 VULNERABILITY1_ID ,
	VULNERABILITY1_REASON,
	'' AS VULNERABILITY1_SCORE ,
	'' AS VULNERABILITY2_ID ,
	'' AS VULNERABILITY2_REASON,
	'' AS VULNERABILITY2_SCORE ,
	'' AS VULNERABILITY3_ID ,
	'' AS VULNERABILITY3_REASON,
	'' AS VULNERABILITY3_SCORE ,
	'' AS VULNERABILITY4_ID ,
	'' AS VULNERABILITY4_REASON,
	'' AS VULNERABILITY4_SCORE ,
	'' AS VULNERABILITY5_ID ,
	'' AS VULNERABILITY5_REASON,
	'' AS VULNERABILITY5_SCORE ,
	@ClaimType as CLAIM_TYPE , --IP instead of DME
	'' AS REF_CLAIM1_ID, -- TODO: Check excel. could not find ref claims
	'' AS REF_CLAIM1_KEY,
	'' AS REF_CLAIM1_LINE,
	'' AS REF_CLAIM2_ID ,
	'' AS REF_CLAIM2_KEY ,
	'' AS REF_CLAIM2_LINE ,
	'' AS REF_CLAIM3_ID ,
	'' AS REF_CLAIM3_KEY ,
	'' AS REF_CLAIM3_LINE ,
	'' AS REF_CLAIM4_ID ,
	'' AS REF_CLAIM4_KEY ,
	'' AS REF_CLAIM4_LINE ,
	'' AS REF_CLAIM5_ID ,
	'' AS REF_CLAIM5_KEY ,
	'' AS REF_CLAIM5_LINE ,
	--Batch_name as BATCH_KEY , 
	@BatchnameApConvention as BATCH_KEY ,
	Batch_date as BATCH_DATE ,
	'D' as RECLINESTATUS,
	LOB_TYPE as LOB_TYPE

	from RESC_Excellus_Selection where  batch_key = @Batchname	
	
	
	SELECT 'Generating Subset Fileset BCP commands...'
	DECLARE @RC int
	DECLARE @CLAIMS_TO_EXPORT xml
	DECLARE @FILE_PREFIX varchar(100) = @BatchnameApConvention
	DECLARE @FILE_PATH varchar(100) = '\\lv-pdsqlbi01\ExcellusPickup\Subsets'


	SET @CLAIMS_TO_EXPORT = 
	(
		SELECT * FROM ( 
		SELECT DISTINCT
		[DataDate],[Claim_Number],[Source_Adjustment_Number]
		 
		FROM [ExcellusRaw].[dbo].[ClaimMaster]
		where	concat([Claim_Number],[Source_Adjustment_Number]) in 
		(

			select  distinct claimnumber 
			from IOClaimsRepo.dbo.claim with (nolock) where claimnumber in
			(
				select distinct claim_key from RESC_Excellus_Selection where batch_key = @Batchname				
			) 
			and Beneficiary_id <> 1 
		)
		
		) AS ClaimMaster FOR XML AUTO
	) 

	SELECT @CLAIMS_TO_EXPORT

	EXECUTE @RC = [ExcellusRaw].[dbo].[usp_ExportFilesFromExcellusSampleData] 
	   @CLAIMS_TO_EXPORT
	  ,@FILE_PREFIX
	  ,@FILE_PATH
	
	

END
