CREATE PROCEDURE [dbo].[LoadExcellusClaimsFromStagingTable](
	@claimFileRequestId UNIQUEIDENTIFIER,
	@claimDetailsFileRequestId UNIQUEIDENTIFIER,
	@clientId INT, @lastUpdatedDate DATETIME, 
	@lastUpdatedBy NVARCHAR(255), 
	@createdDate DATETIME, 
	@createdBy NVARCHAR(255))
AS
BEGIN

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;


-- Add claims from the staging table.
-- If the claim has service lines which have ClaimHistoryStage = "REVERSAL", this implies that
-- the version of the claim already exists. Do not create another instance.

INSERT INTO Claim 
	(ClientId, 
	LastUpdatedDate, 
	LastUpdatedBy, 
	CreatedDate, 
	CreatedBy, 
	ClaimNumber, 
	PatientAccountNumber,
	AmountPaid,
	PaidDate,
	Beneficiary_id,
	BillingProvider_id,
	AdmissionDate,
	DischargeDate,
	DischargeStatus,
	TotalCharge,
	FileRequestId,
	AdditionalDataJson)

		SELECT 
			@clientId as ClientId, 
			@lastUpdatedDate as LastUpdatedDate, 
			@lastUpdatedBy as LastUpdatedBy, 
			@createdDate as CreatedDate,
			@createdBy as CreatedBy, 
			ClaimNumber, 
			PatientAccountNumber,
			AmountPaid,
			PaidDate,
			BeneficiaryId,
			BillingProviderId,
			AdmissionDate,
			DischargeDate, 
			DischargeStatus,
			TotalCharges,
			FileRequestId,
			AdditionalDataJson
		FROM ExcellusClaimsStaging  
		WHERE                          -- Only save "FINAL" claims 
			ClaimNumber IN
			(
				SELECT 
					ClaimNumber 
				FROM
					ExcellusClaimsDetailsStaging 
				WHERE
					ClaimHistoryStage = 'FINAL'
					AND FileRequestId = @claimDetailsFileRequestId
			)



--Claim Key is equal to the ClaimId
UPDATE Claim 
SET ClaimKey = ClaimId 
WHERE FileRequestId = @claimFileRequestId;


-- Insert service lines
INSERT INTO ServiceLine 
	(
	Claim_id,
	LineNumber,
	TotalCharges,
	PaidAmount,
	ProcedureCode,
	ModifierCode1,
	Units,
	DateOfServiceStartDate,
	DateOfServiceEndDate,
	AllowedAmount,
	PlaceOfService,
	CopayAmount, 
	DeductibleAmount,
	CoinsuranceAmount, 
	RevenueCode, 
	RevenueDescription, 
	AttendingProvider_id, 
	ModifierCode2, 
	ModifierCode3,
	ModifierCode4, 
	AdditionalDataJson
	)


		SELECT
			c.ClaimId as Claim_id,
			d.LineNumber, 
			d.TotalCharges, 
			d.AmountPaid, 
			d.ProcedureCode, 
			d.ModifierCode1, 
			d.Units,
			d.DateOfServiceStartDate, 
			d.DateOfServiceEndDate, 
			d.AllowedAmount, 
			d.PlaceOfService, 
			d.CopayAmount, 
			d.DeductibleAmount,
			d.CoinsuranceAmount, 
			d.RevenueCode, 
			d.RevenueDescription, 
			d.AttendingProvider, 
			d.ModifierCode2, 
			d.ModifierCode3,
			d.ModifierCode4, 
			d.AdditionalDataJson
		FROM  
			ExcellusClaimsDetailsStaging d, 
			Claim c
		WHERE 
			d.ClaimHistoryStage = 'FINAL' 
			AND c.ClaimNumber = d.ClaimNumber 
			AND c.FileRequestId = @claimFileRequestId


-- Excellus provides some data at the service line level that are mapped to the Claims Repository Claim table
-- It is assumed that these data are all the same for all service lines in the claim
-- Update "claim level" data with data from the first service line

UPDATE c 
SET 
	c.Beneficiary_id = d.BeneficiaryId,
	c.DiagnosticRelatedGroup = d.DiagnosticRelatedGroup,
	c.IcdIndicator = d.IcdIndicator,
	c.AttendingProvider_id = d.AttendingProvider,
	c.AdmittingDiagnosisCode = d.AdmittingDiagnosis,
	c.SeverityOfIllness = d.SeverityOfIllness,
	c.RiskOfMortality = d.RiskOfMortality
FROM 
	Claim c
INNER JOIN 
	ExcellusClaimsDetailsStaging d 
ON
    c.ClaimNumber = d.ClaimNumber
WHERE 
	c.FileRequestId = @claimFileRequestId
	AND d.FileRequestId = @claimDetailsFileRequestId
	

-- Set the claim type by selecting the group of service lines that has the greatest TotalAllowedAmount
-- The ClaimType for the claim should be the ClaimType of this group
-- If within the HighestTotalAmount group the number of distinct ClaimType values is > 1, then the ClaimType should be UNK
--
-- Examples:
-- Line	ClaimType	AllowedAmount
-- 1	IP			100.00
-- 2	IP			100.00
-- 3	OP			201.00				
-- ClaimType would be OP
--
-- Line	ClaimType	AllowedAmount
-- 1	IP			100.00
-- 2	IP			100.00
-- 3	OP			200.00				
-- ClaimType would be UNK, because it is a "tie" between more than one ClaimType having the highest total AllowedAmount
--
-- Also set the form type.
-- When the service lines are type OP or IP, the form type is I.
-- When the service lines are CAR, the form type is P.

UPDATE 
	Claim
SET
	Claim.ClaimType = FinalClaimType.OverallClaimType,
	Claim.FormType = FinalClaimType.FormType
FROM
(
	SELECT
		ClaimNumber,
		TotalAllowedAmount,
		CASE
			WHEN COUNT(ClaimType) > 1 THEN 'UNK' 
			ELSE MAX(ClaimType)
		END as OverallClaimType,
		CASE
			WHEN MAX(ClaimType) IN ('IP', 'OP') THEN 'I'      --Institutional
			WHEN MAX(ClaimType) = 'CAR' THEN 'P'                -- Professional 
			ELSE NULL
		END as FormType
	FROM
		(
		-- Sum the AllowedAmount by ClaimNumber and ClaimType
		SELECT 
			ClaimNumber,
			ClaimType,
			SUM(AllowedAmount) as TotalAllowedAmount,
			MAX(SUM(AllowedAmount)) OVER (PARTITION BY ClaimNumber) as MaxTotalAllowedAmount
		FROM 
			ExcellusClaimsDetailsStaging
		WHERE 
			ClaimHistoryStage = 'FINAL'
			AND FileRequestId = @claimDetailsFileRequestId
		GROUP BY 
			ClaimNumber,
			ClaimType
		) TotalAllowedAmount_GroupedBy_ClaimNumber_and_ClaimType
	WHERE
		TotalAllowedAmount = MaxTotalAllowedAmount
	GROUP BY
		ClaimNumber,
		TotalAllowedAmount
) FinalClaimType
WHERE
	Claim.ClaimNumber = FinalClaimType.ClaimNumber;
 

-- Insert diagnosis codes
-- Excellus provides a primary diagnosis code, and up to 8 additional diagnosis codes on the same line
-- This statement inserts one record in the DiagnosisCode table for each of those columns
-- There is only one Present on Admission flag, and we are assuming it belongs to the admitting diagnosis

INSERT INTO DiagnosisCode (
	ServiceLine_id, 
	Code, 
	Sequence,
	PresentOnAdmission
)
SELECT 
	ServiceLine.ServiceLineId as ServiceLine_id,
	UnpivotedDiagnosisCodes.CodeValue as Code,

	CASE
		WHEN UnpivotedDiagnosisCodes.Code = 'PrincipalDiagnosisCode' THEN 1
		WHEN UnpivotedDiagnosisCodes.Code = 'AdditionalDiagnosis1' THEN 2
		WHEN UnpivotedDiagnosisCodes.Code = 'AdditionalDiagnosis2' THEN 3
		WHEN UnpivotedDiagnosisCodes.Code = 'AdditionalDiagnosis3' THEN 4
		WHEN UnpivotedDiagnosisCodes.Code = 'AdditionalDiagnosis4' THEN 5
		WHEN UnpivotedDiagnosisCodes.Code = 'AdditionalDiagnosis5' THEN 6
		WHEN UnpivotedDiagnosisCodes.Code = 'AdditionalDiagnosis6' THEN 7
		WHEN UnpivotedDiagnosisCodes.Code = 'AdditionalDiagnosis7' THEN 8
		WHEN UnpivotedDiagnosisCodes.Code = 'AdditionalDiagnosis8' THEN 9
	END AS Sequence,
	CASE 
		WHEN UnpivotedDiagnosisCodes.Code = 'PrincipalDiagnosisCode' THEN 
		CASE
			WHEN UnpivotedDiagnosisCodes.PresentOnAdmission = 'Y' THEN 1 ELSE 0
		END
		ELSE NULL
	END
FROM 
	ExcellusClaimsDetailsStaging UNPIVOT
	( 
		CodeValue
			FOR
		Code
			IN
				(PrincipalDiagnosisCode,
				AdditionalDiagnosis1,
				AdditionalDiagnosis2,
				AdditionalDiagnosis3,
				AdditionalDiagnosis4,
				AdditionalDiagnosis5,
				AdditionalDiagnosis6,
				AdditionalDiagnosis7,
				AdditionalDiagnosis8)
	) AS UnpivotedDiagnosisCodes

	LEFT JOIN Claim
		ON UnpivotedDiagnosisCodes.ClaimNumber = Claim.ClaimNumber
	RIGHT JOIN ServiceLine
		ON ServiceLine.Claim_id = Claim.ClaimId 
WHERE
	UnpivotedDiagnosisCodes.ClaimHistoryStage = 'FINAL' 
	AND UnpivotedDiagnosisCodes.LineNumber = ServiceLine.LineNumber
	AND CodeValue IS NOT NULL
	AND UnpivotedDiagnosisCodes.FileRequestId = @claimDetailsFileRequestId;
END