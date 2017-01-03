

CREATE Procedure [dbo].[PopulateExcellusClaimDRGAdditonalDiagAdditionalData] (@FileRequestId  UniqueIdentifier)
as 
BEGIN

-- Idempotent - multiple runs have same end state on DiagnosisCodes i.e. no duplicates (ServiceLineId, Seq)
SELECT 
	sl.ServiceLineId as ServiceLineId	
INTO #CLAIMLINE
FROM Claim c 
	inner join ServiceLine sl on ( c.FileRequestId = @FileRequestId and c.ClaimId = sl.Claim_Id )
CREATE UNIQUE CLUSTERED INDEX CL_X1 ON #CLAIMLINE(ServiceLineId)

SELECT 
	cl.ServiceLineId as ServiceLineId,
	dc.[Sequence] as Seq
	
INTO #CURRENTCODES
FROM #CLAIMLINE cl
	inner join DiagnosisCode dc on ( cl.ServiceLineId = dc.ServiceLine_id )
CREATE UNIQUE CLUSTERED INDEX CL_X1 ON #CURRENTCODES(ServiceLineId, Seq)

INSERT INTO DiagnosisCode (
	ServiceLine_id, 
	Code, 
	Sequence,
	PresentOnAdmission
)
SELECT NewCodes.ServiceLine_id as ServiceLine_id,
	NewCodes.Code as Code, 
	NewCodes.[Sequence] as [Sequence], 
	NewCodes.PresentOnAdmission as PresentOnAdmission
FROM
(SELECT 
	Unpvt.ServiceLineId as ServiceLine_id,
	Unpvt.CodeValue as Code,

	CASE
		WHEN Unpvt.Code = 'Additional_Diagnosis_9' THEN 10
		WHEN Unpvt.Code = 'Additional_Diagnosis_10' THEN 11
		WHEN Unpvt.Code = 'Additional_Diagnosis_11' THEN 12
		WHEN Unpvt.Code = 'Additional_Diagnosis_12' THEN 13
		WHEN Unpvt.Code = 'Additional_Diagnosis_13' THEN 14
		WHEN Unpvt.Code = 'Additional_Diagnosis_14' THEN 15
		WHEN Unpvt.Code = 'Additional_Diagnosis_15' THEN 16
		WHEN Unpvt.Code = 'Additional_Diagnosis_16' THEN 17
		WHEN Unpvt.Code = 'Additional_Diagnosis_17' THEN 18
		WHEN Unpvt.Code = 'Additional_Diagnosis_18' THEN 19
		WHEN Unpvt.Code = 'Additional_Diagnosis_19' THEN 20
		WHEN Unpvt.Code = 'Additional_Diagnosis_20' THEN 21
		WHEN Unpvt.Code = 'Additional_Diagnosis_21' THEN 22
		WHEN Unpvt.Code = 'Additional_Diagnosis_22' THEN 23
		WHEN Unpvt.Code = 'Additional_Diagnosis_23' THEN 24
		WHEN Unpvt.Code = 'Additional_Diagnosis_24' THEN 25
	END AS [Sequence],
	NULL AS PresentOnAdmission
FROM ServiceLineDRG unpivot
  ( CodeValue 
	For
	Code IN
		(Additional_Diagnosis_9,
		Additional_Diagnosis_10,
		Additional_Diagnosis_11,
		Additional_Diagnosis_12,
		Additional_Diagnosis_13,
		Additional_Diagnosis_14,
		Additional_Diagnosis_15,
		Additional_Diagnosis_16,
		Additional_Diagnosis_17,
		Additional_Diagnosis_18,
		Additional_Diagnosis_19,
		Additional_Diagnosis_20,
		Additional_Diagnosis_21,
		Additional_Diagnosis_22,
		Additional_Diagnosis_23,
		Additional_Diagnosis_24)
  ) AS Unpvt inner join #CLAIMLINE cl on ( cl.ServiceLineId = Unpvt.ServiceLineId )
) AS NewCodes left outer join #CURRENTCODES cc on ( NewCodes.ServiceLine_id = cc.ServiceLineId and NewCodes.[Sequence] = cc.Seq )
WHERE cc.ServiceLineId is null

DROP Table #CLAIMLINE
DROP Table #CURRENTCODES

END


