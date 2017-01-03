

Create Procedure [dbo].[PopulateExcellusClaimAdmissionDateFromAdditionalData] (@FileRequestId  UniqueIdentifier)
as 
BEGIN

SELECT 
	ClaimId
INTO #CLAIM
FROM Claim where [FileRequestId] = @FileRequestId
CREATE UNIQUE CLUSTERED INDEX CL_X1 ON #CLAIM(ClaimId)

SELECT 
	cad.ClaimId as ClaimId_o,
	CONVERT(datetime, cad.Admission_Date, 112) as Admission_Date_o
	--- 112 = yyyymmdd
INTO #CLAIM_AdmissionDate
FROM ClaimAdditionalData cad inner join #CLAIM c on ( cad.ClaimId = c.ClaimId )
CREATE UNIQUE CLUSTERED INDEX CL_X2 ON #CLAIM_AdmissionDate(ClaimId_o)

DROP Table #CLAIM

Update Claim
Set
	AdmissionDate = cad.Admission_Date_o
from #CLAIM_AdmissionDate cad
where
	Claim.ClaimId = cad.ClaimId_o

DROP Table #CLAIM_AdmissionDate

END


