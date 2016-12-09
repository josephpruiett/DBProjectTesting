
CREATE PROCEDURE [dbo].[UpdateClaimMedicalFacilityNumberFromServiceLineAdditionalData](
	@claimMasterFileRequestId UNIQUEIDENTIFIER)
AS
BEGIN

-- Update the Claim table with the Medicare Facility Number for both the billing and attending provider
-- This data comes from Excellus fields on ServiceLineAdditionalData 

UPDATE
    Claim
SET
    Claim.BillingProviderMedicareFacilityNumber = ServiceLineAdditionalData.Medicare_Facility_Number_BLNG_PROV,
    Claim.AttendingProviderMedicareFacilityNumber = ServiceLineAdditionalData.Medicare_Facility_Number_SRVCNG_PROV
FROM
    Claim 
	INNER JOIN ServiceLine 
		ON Claim.ClaimId = ServiceLine.Claim_id
	INNER JOIN ServiceLineAdditionalData 
		ON ServiceLine.ServiceLineId = ServiceLineAdditionalData.ServiceLineId
WHERE
	ServiceLineAdditionalData.Medicare_Facility_Number_BLNG_PROV IS NOT NULL
	OR ServiceLineAdditionalData.Medicare_Facility_Number_SRVCNG_PROV IS NOT NULL
    AND Claim.FileRequestId = @claimMasterFileRequestId

END

;