

CREATE Procedure [dbo].[PopulateExcellusClaimAdmittingDiagnosisFromAdditionalData] (@FileRequestId  UniqueIdentifier)
as 
BEGIN

SELECT 
	c.ClaimId as ClaimId,
	sl.ServiceLineId as ServiceLineId
	
INTO #CLAIM
FROM Claim c inner join ServiceLine sl on ( c.FileRequestId = @FileRequestId and c.ClaimId = sl.Claim_Id )
CREATE UNIQUE CLUSTERED INDEX CL_X1 ON #CLAIM(ServiceLineId)

SELECT 
	c.ClaimId as ClaimId_o,
	CONVERT(nvarchar(255), max(slad.Admitting_Diagnosis)) as Admitting_Diagnosis_o
	--- max(slad.Admitting_Diagnosis) pick one Admitting_Diagnosis ignore nulls
	--- For all practical purposes, Admitting_Diagnosis is same on all service lines
INTO #CLAIM_AdmittingDiagnosis
FROM ServiceLineAdditionalData slad inner join #CLAIM c on ( slad.ServiceLineId = c.ServiceLineId )
GROUP BY c.ClaimId
CREATE UNIQUE CLUSTERED INDEX CL_X2 ON #CLAIM_AdmittingDiagnosis(ClaimId_o)

DROP Table #CLAIM

Update Claim
Set
	AdmittingDiagnosisCode = cad.Admitting_Diagnosis_o
from #CLAIM_AdmittingDiagnosis cad
where
	Claim.ClaimId = cad.ClaimId_o

DROP Table #CLAIM_AdmittingDiagnosis

END

;