



CREATE Procedure [dbo].[usp_LoadExcellusClaimAdditionalData] ( @DataDate Varchar(7), @FileRequestId  UniqueIdentifier)

as 

BEGIN


IF OBJECT_ID('dbo.ClaimAdditionalDataStage', 'U') IS NOT NULL 
BEGIN
DROP TABLE [$(DatabaseName)].[dbo].[ClaimAdditionalDataStage]
END






SELECT 
	CONVERT(NVARCHAR(255),RTRIM(LTRIM(Claim_Number)) +  RTRIM(LTRIM(Source_Adjustment_Number)))
				as ClaimRepoClaimNumber	
,[File_Type]
,Member_ID 
,Drug_Claim 
,Date_of_Payment  AS [PaidDate]
,Insurance_Company_Unique_ID 
,Prescribing_Physician_Provider_ID 
,Total_Claim_allowed_amount 
,Total_Other_carrier_paid_amt 
,Total_Claim_member_liability 
,Bill_Type 
,Total_Copayment_Amt 
,Total_Deductible_Amt 
,Total_Coinsurance_Amt 
,Home_Host_Ind 
,Billing_Provider_Tax_id 
,Bad_Debt_Amt 
,Withheld_Amt 
,Admission_Date 
,Patient_Status_Desc 
,Src_appl_code 
,Source_Adjustment_Number 
INTO [$(DatabaseName)].[dbo].[ClaimAdditionalDataStage]
	FROM [$(ExcellusRaw)].[dbo].[ClaimMaster] 
WHERE datadate = @DataDate   

CREATE CLUSTERED INDEX CL_X ON [$(DatabaseName)].[dbo].[ClaimAdditionalDataStage] (ClaimRepoClaimNumber)


SELECT 
ClaimId,
ClaimNumber
INTO #CLAIM
FROM Claim where [FileRequestId] = @FileRequestId
CREATE UNIQUE CLUSTERED INDEX CL_X ON #CLAIM(ClaimId)





INSERT INTO [$(DatabaseName)].[dbo].[ClaimAdditionalData]
           ([ClaimID]
           ,[ClientID]
           ,[File_Type]
           ,[Member_ID]
           ,[Drug_Claim]
           ,[Insurance_Company_Unique_ID]
           ,[Prescribing_Physician_Provider_ID]
           ,[Total_Claim_allowed_amount]
           ,[Total_Other_carrier_paid_amt]
           ,[Total_Claim_member_liability]
           ,[Bill_Type]
           ,[Total_Copayment_Amt]
           ,[Total_Deductible_Amt]
           ,[Total_Coinsurance_Amt]
           ,[Home_Host_Ind]
           ,[Billing_Provider_Tax_id]
           ,[Bad_Debt_Amt]
           ,[Withheld_Amt]
           ,[Admission_Date]
           ,[Patient_Status_Desc]
           ,[Src_appl_code]
           ,[Source_Adjustment_Number])


SELECT 
A.[ClaimID]													
,3 as [ClientID]			
,[File_Type]										
,Member_ID 
,Drug_Claim 
,Insurance_Company_Unique_ID 
,Prescribing_Physician_Provider_ID 
,Total_Claim_allowed_amount 
,Total_Other_carrier_paid_amt 
,Total_Claim_member_liability 
,Bill_Type 
,Total_Copayment_Amt 
,Total_Deductible_Amt 
,Total_Coinsurance_Amt 
,Home_Host_Ind 
,Billing_Provider_Tax_id 
,Bad_Debt_Amt 
,Withheld_Amt 
,Admission_Date 
,Patient_Status_Desc 
,Src_appl_code 
,Source_Adjustment_Number 


FROM 
#CLAIM A  
INNER JOIN [$(DatabaseName)].[dbo].[ClaimAdditionalDataStage] B  ON A.ClaimNumber = B.ClaimRepoClaimNumber 




DROP TABLE #CLAIM
DROP TABLE [$(DatabaseName)].[dbo].[ClaimAdditionalDataStage]
END



