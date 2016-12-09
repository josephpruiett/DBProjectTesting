
CREATE Proc [dbo].[GetDiagnosisCodeDataForOutputFile] (@filerequestid uniqueidentifier)
as 

SELECT 
	Claim.ClientId as ClientId,
	Claim.ClaimKey,
	ServiceLine.ServiceLineId as ServiceLineId,
	DiagnosisCode.Sequence as Sequence,
	DiagnosisCode.Code as DiagnosisCode, 
	DiagnosisCode.PresentOnAdmission as PresentOnAdmission,
	'' as AdditionalDataJson -- There are no additional data for diagnosis codes, but leaving this in until we refactor the outbound file generator because it is expected
FROM DiagnosisCode,
		ServiceLine (NOLOCK), Claim (NOLOCK)
WHERE 
	Claim.FileRequestId = @filerequestid
	AND ServiceLine.ServiceLineId = DiagnosisCode.ServiceLine_id
	AND Claim.ClaimId = ServiceLine.Claim_id
	AND DiagnosisCode.Code IS NOT NULL


;