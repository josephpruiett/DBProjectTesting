CREATE proc [dbo].[GetMostRecentBeneficiaryRecordsForExcellus]
(@fileRequestId UNIQUEIDENTIFIER,
@clientId INTEGER)
AS 
BEGIN

DECLARE @dateProcessed AS DATETIME = (SELECT DateProcessed FROM FileRequestHistory WHERE FileRequestId = @fileRequestId);




SELECT 
	b.BeneficiaryId, 
	b.BeneficiaryIdentifier, 
	b.AdditionalDataJson
FROM
	Beneficiary b (NOLOCK)
INNER JOIN
	FileRequestHistory frh (NOLOCK)
ON 
	b.FileRequestId = frh.FileRequestId
WHERE 
	frh.DateProcessed <= @dateProcessed
	AND b.ClientId = @clientId
	AND b.BeneficiaryIdentifier <> ''

UNION ALL

-- "unassigned" beneficiary
SELECT 
	BeneficiaryId, 
	BeneficiaryIdentifier, 
	AdditionalDataJson
FROM
	Beneficiary
WHERE
	ClientId = 0
	AND BeneficiaryIdentifier = '';

END