﻿
CREATE PROCEDURE [dbo].[GetExcellusFindingFileData] (  @ClaimNumber NVARCHAR(255) , @ClientID INT)
AS
DECLARE @ClaimID INT
DECLARE @ServiceLineID INT
SELECT @ClaimID=[ClaimID]
FROM [dbo].[Claim]  WITH (NOLOCK) 
WHERE 
       ClientId = @ClientId and
       ClaimNumber = @ClaimNumber
SELECT TOP 1 @ServiceLineID=ServiceLineID
FROM ServiceLine  WITH (NOLOCK) WHERE
       Claim_ID = @ClaimID
 
SELECT
@ClaimNumber as ClaimNumber
,BAD.Member_group_number
,BAD.Subscriber_Middle_Initial
,BAD.Subscriber_Number
,BAD.Contract_holders_ID
,BAD.[Dependent_Number]
,BAD.Mem_Medicare_Number as HICN
,(SELECT TOP 1 SCCF_Number FROM [ServiceLineAdditionalData]  WITH (NOLOCK) where ServiceLIneID =  @ServiceLineID) as SCCF_Number
,CAD.[Home_Host_Ind]
,CAD.Member_ID
,(SELECT TOP 1 Contract_holders_ID FROM [ServiceLineAdditionalData]  WITH (NOLOCK) where ServiceLIneID =  @ServiceLineID) as SL_Contract_holders_ID
FROM [Claim] C WITH (NOLOCK) LEFT JOIN [ClaimAdditionalData] CAD ON C.ClaimId = CAD.ClaimID
LEFT JOIN [BeneficiaryAdditionalData] BAD WITH (NOLOCK) ON C.Beneficiary_id = BAD.BeneficiaryId
WHERE C.ClaimID = @ClaimID
