
CREATE Proc [dbo].[GetClaimsDataForOutputFile] (@filerequestid uniqueidentifier)
as 
DECLARE @unassignedBeneficiaryId INTEGER = 
(SELECT 1 FROM Beneficiary WHERE FileRequestId = '00000000-0000-0000-0000-000000000000' AND ClientId = 0 AND BeneficiaryIdentifier = '');

DECLARE @unassignedProviderId INTEGER =
(SELECT 1 FROM PROVIDER WHERE FileRequestId = '00000000-0000-0000-0000-000000000000' AND ClientId = 0 and ProviderNumber = '');

SELECT
	C.ClaimKey As ClaimKey,
	SL.LineNumber As LineNumber,
	SL.PlaceOfService As PlaceOfService,
	SL.ProcedureCode As ProcedureCode,
	SL.DateOfServiceStartDate As DateOfServiceStartDate,
	SL.DateOfServiceEndDate As DateOfServiceEndDate,
	SL.Units As Units,
	SL.TotalCharges As TotalLineCharges,
	SL.ModifierCode1 As ModifierCode1,
	SL.ModifierCode2 As ModifierCode2,
	SL.ModifierCode3 As ModifierCode3,
	SL.ModifierCode4 As ModifierCode4,

	BeneficiaryId =
	CASE
		WHEN C.Beneficiary_id = @unassignedBeneficiaryId THEN NULL
		ELSE C.Beneficiary_id
	END,
	BeneficiaryIdentifier = B.BeneficiaryIdentifier,


	-- If the attending provider id is not associated on the claim level, 
	-- then select the attending provider id associated with the service line 
	AttendingProviderId = 
    CASE
		WHEN ISNULL(C.AttendingProvider_id, @unassignedProviderId) = @unassignedProviderId THEN 
		CASE
			WHEN SL.AttendingProvider_id = @unassignedProviderId THEN NULL
			ELSE SL.AttendingProvider_id
		END				
		ELSE C.AttendingProvider_id
	END, 

	-- If the attending provider is not associated on the claim level, 
	-- then select the attending provider associated with the service line 
	AttendingProviderNumber = 
	CASE
		WHEN ISNULL(C.AttendingProvider_id, @unassignedProviderId) = @unassignedProviderId THEN SL_AP.ProviderNumber
		ELSE C_AP.ProviderNumber
	END,
	

	BillingProviderId = 
    CASE
		WHEN C.BillingProvider_id = @unassignedProviderId THEN NULL
		ELSE C.BillingProvider_id
	END, 
	BillingProviderNumber = BP.ProviderNumber,
	C.ClientId As ClientId,
	C.AdmissionDate As AdmissionDate,
	C.DischargeDate As DischargeDate,
	SL.UnitsAllowed As UnitsAllowed,
	SL.AllowedAmount As AllowedAmount,
	SL.CopayAmount As CopayAmount, 
	SL.CoinsuranceAmount As CoinsuranceAmount,
	SL.DeductibleAmount As DeductibleAmount,
	SL.PaidAmount As PaidAmount,
	C.PaidDate as PaidDate,
	C.DischargeStatus as DischargeStatus,
	C.FormType As FormType,
	C.ClaimNumber As ClaimNumber,
	SL.ServiceLineId As ServiceLineId,
	SL.RevenueCode As RevenueCode,
	SL.RevenueDescription As RevenueDescription,
	C.IcdIndicator as IcdIndicator,
	C.PatientAccountNumber as PatientAccountNumber,
	C.DiagnosticRelatedGroup as DiagnosticRelatedGroup,

	 --Combine JSON arrays from Claims.AdditionalDataJson and ServicefLine.AdditionalDataJson
	 --When Claims.AdditionalDataJson is null or empty, then only include ServiceLine.AdditionalDataJson elements
	 --This is super slow
	AdditionalDataJson = 
	CASE 
		WHEN (C.AdditionalDataJson is null or C.AdditionalDataJson = '') THEN SL.AdditionalDataJson
		ELSE '{' + replace(replace(C.AdditionalDataJson + ',' + SL.AdditionalDataJson, '{', ''), '}','') + '}'
	END
	 
	
FROM
	ServiceLine SL (NOLOCK)
INNER JOIN Claim C (NOLOCK)
	ON SL.Claim_id=C.ClaimId
LEFT JOIN Provider C_AP(NOLOCK)
	ON C_AP.ProviderId=C.AttendingProvider_id
LEFT JOIN Provider SL_AP(NOLOCK)
	ON SL_AP.ProviderId=SL.AttendingProvider_id
LEFT JOIN Provider BP(NOLOCK)
	ON BP.ProviderId=C.BillingProvider_id
LEFT JOIN Beneficiary B(NOLOCK)
	ON B.BeneficiaryId = C.Beneficiary_id



WHERE
	C.FileRequestId = @FileRequestId


;