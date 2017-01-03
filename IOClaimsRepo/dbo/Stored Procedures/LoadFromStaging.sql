CREATE PROCEDURE [dbo].[LoadFromStaging](
	@fileRequestId UNIQUEIDENTIFIER, 
	@clientId INT, @lastUpdatedDate DATETIME, 
	@lastUpdatedBy NVARCHAR(255), 
	@createdDate DATETIME, 
	@createdBy NVARCHAR(255))
AS
BEGIN
	INSERT INTO Claim 
		(ClientId, 
		LastUpdatedDate, 
		LastUpdatedBy, 
		CreatedDate, 
		CreatedBy, 
		ClaimNumber, 
		PrincipalDiagnosisCode, 
		Beneficiary_id, 
		AttendingProvider_id,
		BillingProvider_id, 
		AdmissionDate, 
		DischargeDate, 
		FormType, 
		ClaimType,
		PaidDate,
		DischargeStatus,
		DiagnosticRelatedGroup,
		PatientAccountNumber,
		IcdIndicator,
		FileRequestId)



			SELECT 
				@clientId, 
				@lastUpdatedDate, 
				@lastUpdatedBy, 
				@createdDate, 
				@createdBy, 
				ClaimNumber, 
				PrincipalDiagnosisCode,
				BeneficiaryId,
				AttendingProviderId, 
				BillingProviderId, 
				AdmissionDate, 
				DischargeDate, 
				FormType, 
				ClaimType,
				PaidDate, 
				DischargeStatus,
				DiagnosticRelatedGroup,
				PatientAccountNumber,
				IcdIndicator,
				FileRequestId
			FROM (
			SELECT
				ROW_NUMBER() OVER 
				(
					PARTITION BY ClaimNumber 
					ORDER BY LineNumber ASC 
				) as idx, 
				* 
			FROM ClaimsStaging (NOLOCK)
			WHERE FileRequestId = @fileRequestId
			)  as r
			WHERE r.idx = 1;





	UPDATE Claim SET ClaimKey = ClaimId
		WHERE FileRequestId = @fileRequestId;

	INSERT INTO ServiceLine (
		Claim_id, 
		LineNumber, 
		BillingProvider_id,
		AttendingProvider_id, 
		DateOfServiceStartDate, 
		DateOfServiceEndDate, 
		PlaceOfService, 
		ProcedureCode,  
		ModifierCode1,  
		ModifierCode2,  
		ModifierCode3,  
		ModifierCode4, 
		Units, 
		UnitsAllowed, 
		TotalCharges, 
		AdditionalDataJson,
		AllowedAmount,  
		CopayAmount,
		CoinsuranceAmount,
		DeductibleAmount,
		PaidAmount
	)
		
			SELECT c.ClaimId as Claim_id, 
				staged.LineNumber,
				staged.BillingProviderId,
				staged.AttendingProviderId, 
				staged.DateOfServiceStartDate, 
				staged.DateOfServiceEndDate, 
				staged.PlaceOfService,  
				staged.ProcedureCode, 
				staged.ModifierCode1, 
				staged.ModifierCode2, 
				staged.ModifierCode3, 
				staged.ModifierCode4, 
				staged.Units, 
				staged.UnitsAllowed,
				staged.TotalCharges,
				staged.AdditionalDataJson,
				staged.AllowedAmount,
				staged.CopayAmount,
				staged.CoinsuranceAmount,
				staged.DeductibleAmount,
				staged.PaidAmount

			FROM ClaimsStaging AS staged (NOLOCK)
			INNER JOIN Claim AS c (NOLOCK)
			ON c.ClaimNumber = staged.ClaimNumber
			WHERE staged.FileRequestId = @fileRequestId;




		-- Cambia provides Primary, Secondary, and Tertiary diagnosis codes on the service lines
		-- This statement inserts one record in the DiagnosisCode table for each of those columns

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
					WHEN UnpivotedDiagnosisCodes.FormType <> 'P' THEN
					CASE
						WHEN UnpivotedDiagnosisCodes.Code = 'PrincipalDiagnosisCode' THEN 1
						WHEN UnpivotedDiagnosisCodes.Code = 'SecondaryDiagnosisCode' THEN 2
						WHEN UnpivotedDiagnosisCodes.Code = 'TertiaryDiagnosisCode' THEN 3
					END
				END AS Sequence,
				CASE
					WHEN UnpivotedDiagnosisCodes.FormType <> 'P' THEN
					CASE
						WHEN UnpivotedDiagnosisCodes.Code = 'PrincipalDiagnosisCode' THEN CASE WHEN PrincipalDiagnosisCodePresentOnAdmission='Y' THEN 1 ELSE 0 END
						WHEN UnpivotedDiagnosisCodes.Code = 'SecondaryDiagnosisCode' THEN CASE WHEN SecondaryDiagnosisCodePresentOnAdmission='Y' THEN 1 ELSE 0 END
						WHEN UnpivotedDiagnosisCodes.Code = 'TertiaryDiagnosisCode' THEN CASE WHEN TertiaryDiagnosisCodePresentOnAdmission='Y' THEN 1 ELSE 0 END
					END
				END AS PresentOnAdmission
			FROM 
				ClaimsStaging UNPIVOT
				( 
					CodeValue
					FOR
					Code
					IN
						(PrincipalDiagnosisCode,
						SecondaryDiagnosisCode,
						TertiaryDiagnosisCode)
				) AS UnpivotedDiagnosisCodes

				LEFT JOIN Claim (NOLOCK)
					ON UnpivotedDiagnosisCodes.ClaimNumber = Claim.ClaimNumber
				RIGHT JOIN ServiceLine (NOLOCK)
					ON ServiceLine.Claim_id = Claim.ClaimId 
			WHERE
				UnpivotedDiagnosisCodes.LineNumber = ServiceLine.LineNumber
				AND ISNULL(NULLIF(RTRIM(LTRIM(CodeValue)), ''), '') <> ''
				AND UnpivotedDiagnosisCodes.FileRequestId = @fileRequestId;



END