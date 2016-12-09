CREATE VIEW ExcellusFindingFileFields 

AS

SELECT DISTINCT 
		
		C.ClaimNumber
	   ,BAD.Member_group_number
	   ,BAD.Contract_holders_ID
	   ,BAD.[Dependent_Number]
	   --,B.HICN
	   ,BAD.Mem_Medicare_Number as HICN
      ,SLAD.SCCF_Number      
	  ,CAD.[Home_Host_Ind]
	  ,CAD.Member_ID
	  ,SLAD.Contract_holders_ID as SL_Contract_holders_ID

FROM 

[dbo].Claim C

left outer join [dbo].ServiceLine SL with (nolock)  on SL.Claim_id = C.ClaimId
left outer join [dbo].Beneficiary B  with (nolock) on B.BeneficiaryId = C.Beneficiary_Id
left outer join [dbo].[BeneficiaryAdditionalData] BAD  with (nolock) on BAD.BeneficiaryId = B.BeneficiaryId
left outer join [dbo].[ClaimAdditionalData] CAD  with (nolock) on CAD.ClaimID = C.ClaimId
left outer join [dbo].ServiceLineAdditionalData SLAD  with (nolock) on SL.ServiceLineId = SLAD.ServiceLineID

where C.Claimnumber in (SELECT distinct ClaimKey from [dbo].SelectedClaims with (nolock))
