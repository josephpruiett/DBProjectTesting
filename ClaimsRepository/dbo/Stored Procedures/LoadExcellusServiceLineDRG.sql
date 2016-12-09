

CREATE PROCEDURE [dbo].[LoadExcellusServiceLineDRG] (@DataDate VARCHAR(6), @FileName VARCHAR(500))
AS

BEGIN

SET NOCOUNT ON 

DECLARE @FileRequestId UNIQUEIDENTIFIER
DECLARE @SQL NVARCHAR(1000)

  ;WITH X as (
  /*THE DATABASENAMES FOR THE IO_PORTAL DB BELOW NED TO BE CHANGED*/

  SELECT A.[Id] as FileID
      ,[ClientId]
      ,[FileName]
	  ,REPLACE(LEFT(CONVERT(VARCHAR(255),DATEADD(MONTH,1,CONVERT(DATETIME,RTRIM(LTRIM(
	  REPLACE(REPLACE(REPLACE(REPLACE([FileName],'Excellus Claims','')  ,'.txt','')  ,'-','')  ,'_','')
	  )) + '01',102)),102),7),'.','') as DataDate 
	  ,B.LastRequestId
       FROM [IOPortal].[dbo].[IoFile] A 
			INNER JOIN 
			[IOPortal].[dbo].[IoJob] B on A.ID = B.File_Id
  WHERE ClientID = 3 and FileName like '%Claims%'
  ) 
  Select @FileRequestId = [LastRequestId] 
  FROM X
  WHERE DataDate = @DataDate








  SET @SQL = '
	SELECT 
	RTRIM(LTRIM(Claim_Number)) +  RTRIM(LTRIM(SRC_APPL_ADJ_SQNC_NBR)) as ClaimRepoClaimNumber,
	CONVERT(NVARCHAR(255),CONVERT(INT,Claim_Line_Number)) as  ClaimRepoClaimLineNumber,  
	*
	FROM  OPENROWSET(BULK  '+ CHAR(39) +  @FILENAME + CHAR(39) +',
	FORMATFILE=''\\lv-dvhumsql01\C\TEMP\ExcellusDrgStageFormat.fmt''     
	) 
	as t1
		WHERE Claim_History_stage = ''FINAL'''

TRUNCATE TABLE ExcellusClaimsDetailsDRGStaging
INSERT ExcellusClaimsDetailsDRGStaging 
EXEC sp_executesql @SQL

		 

SELECT

B.ClaimID
,B.ClaimNumber as ClaimRepoClaimNumber
,A.[ServiceLineId]
,C.Claim_Line_Number 
,C.PlanID
,C.PlanID_Name
,C.Business_Category_Code
,C.Business_Category_Description
,C.Medicare_Facility_Number_BLNG_PROV
,C.HCRA_BLNG_PROV
,C.Medicare_Facility_Number_SRVCNG_PROV
,C.HCRA_SRVCNG_PROV
,C.Micro_Image_ID
,C.SCCF_Number
,C.Plan_Code
,C.Plan_Code_home
,C.Additional_Diagnosis_9
,C.Additional_Diagnosis_10
,C.Additional_Diagnosis_11
,C.Additional_Diagnosis_12
,C.Additional_Diagnosis_13
,C.Additional_Diagnosis_14
,C.Additional_Diagnosis_15
,C.Additional_Diagnosis_16
,C.Additional_Diagnosis_17
,C.Additional_Diagnosis_18
,C.Additional_Diagnosis_19
,C.Additional_Diagnosis_20
,C.Additional_Diagnosis_21
,C.Additional_Diagnosis_22
,C.Additional_Diagnosis_23
,C.Additional_Diagnosis_24
,C.Additional_proc_code_6
,C.Additional_proc_code_7
,C.Additional_proc_code_8
,C.Additional_proc_code_9
,C.Additional_proc_code_10
,C.Additional_proc_code_11
,C.Additional_proc_code_12
,C.Additional_proc_code_13
,C.Additional_proc_code_14
,C.Additional_proc_code_15
,C.Additional_proc_code_16
,C.Additional_proc_code_17
,C.Additional_proc_code_18
,C.Additional_proc_code_19
,C.Additional_proc_code_20
,C.Additional_proc_code_21
,C.Additional_proc_code_22
,C.Additional_proc_code_23
,C.Additional_proc_code_24
,C.Additional_proc_code_25
, C.PTNT_ACNT_NBR

INTO #FINAL

from serviceLine A INNER JOIN Claim B on A.Claim_Id = B.ClaimID 
INNER JOIN ExcellusClaimsDetailsDRGStaging C ON B.ClaimNumber = C.ClaimRepoClaimNumber and A.LineNumber  = C.ClaimRepoClaimLineNumber 


INSERT ServiceLineDRG (
		 [ServiceLineId]
		,[PlanID]
		,[PlanID_Name]
		,[Business_Category_Code]
		,[Business_Category_Description]
		,[Medicare_Facility_Number_BLNG_PROV]
		,[HCRA_BLNG_PROV]
		,[Medicare_Facility_Number_SRVCNG_PROV]
		,[HCRA_SRVCNG_PROV]
		,[Micro_Image_ID]
		,[SCCF_Number]
		,[Plan_Code]
		,[Plan_Code_home]
		,[Additional_Diagnosis_9]
		,[Additional_Diagnosis_10]
		,[Additional_Diagnosis_11]
		,[Additional_Diagnosis_12]
		,[Additional_Diagnosis_13]
		,[Additional_Diagnosis_14]
		,[Additional_Diagnosis_15]
		,[Additional_Diagnosis_16]
		,[Additional_Diagnosis_17]
		,[Additional_Diagnosis_18]
		,[Additional_Diagnosis_19]
		,[Additional_Diagnosis_20]
		,[Additional_Diagnosis_21]
		,[Additional_Diagnosis_22]
		,[Additional_Diagnosis_23]
		,[Additional_Diagnosis_24]
		,[Additional_proc_code_6]
		,[Additional_proc_code_7]
		,[Additional_proc_code_8]
		,[Additional_proc_code_9]
		,[Additional_proc_code_10]
		,[Additional_proc_code_11]
		,[Additional_proc_code_12]
		,[Additional_proc_code_13]
		,[Additional_proc_code_14]
		,[Additional_proc_code_15]
		,[Additional_proc_code_16]
		,[Additional_proc_code_17]
		,[Additional_proc_code_18]
		,[Additional_proc_code_19]
		,[Additional_proc_code_20]
		,[Additional_proc_code_21]
		,[Additional_proc_code_22]
		,[Additional_proc_code_23]
		,[Additional_proc_code_24]
		,[Additional_proc_code_25]
		,[PTNT_ACNT_NBR]
)


SELECT 
		 [ServiceLineId]
		,[PlanID]
		,[PlanID_Name]
		,[Business_Category_Code]
		,[Business_Category_Description]
		,[Medicare_Facility_Number_BLNG_PROV]
		,[HCRA_BLNG_PROV]
		,[Medicare_Facility_Number_SRVCNG_PROV]
		,[HCRA_SRVCNG_PROV]
		,[Micro_Image_ID]
		,[SCCF_Number]
		,[Plan_Code]
		,[Plan_Code_home]
		,[Additional_Diagnosis_9]
		,[Additional_Diagnosis_10]
		,[Additional_Diagnosis_11]
		,[Additional_Diagnosis_12]
		,[Additional_Diagnosis_13]
		,[Additional_Diagnosis_14]
		,[Additional_Diagnosis_15]
		,[Additional_Diagnosis_16]
		,[Additional_Diagnosis_17]
		,[Additional_Diagnosis_18]
		,[Additional_Diagnosis_19]
		,[Additional_Diagnosis_20]
		,[Additional_Diagnosis_21]
		,[Additional_Diagnosis_22]
		,[Additional_Diagnosis_23]
		,[Additional_Diagnosis_24]
		,[Additional_proc_code_6]
		,[Additional_proc_code_7]
		,[Additional_proc_code_8]
		,[Additional_proc_code_9]
		,[Additional_proc_code_10]
		,[Additional_proc_code_11]
		,[Additional_proc_code_12]
		,[Additional_proc_code_13]
		,[Additional_proc_code_14]
		,[Additional_proc_code_15]
		,[Additional_proc_code_16]
		,[Additional_proc_code_17]
		,[Additional_proc_code_18]
		,[Additional_proc_code_19]
		,[Additional_proc_code_20]
		,[Additional_proc_code_21]
		,[Additional_proc_code_22]
		,[Additional_proc_code_23]
		,[Additional_proc_code_24]
		,[Additional_proc_code_25]
		,[PTNT_ACNT_NBR]
 FROM #FINAL


DROP TABLE #FINAL

END 


;