CREATE proc [dbo].[GetMostRecentBeneficiaryRecords]
(@fileRequestId AS UNIQUEIDENTIFIER,
@clientId INTEGER)
AS 
BEGIN

DECLARE @dateProcessed AS DATETIME;

SET @dateProcessed = 
(
	SELECT DateProcessed 
	FROM FileRequestHistory 
	WHERE FileRequestId = @fileRequestId
);


WITH Beneficiary_OrderedBy_FileRequestDate as
(
	SELECT b.*, frh.DateProcessed 
	FROM Beneficiary b (NOLOCK)
	INNER JOIN FileRequestHistory frh (NOLOCK)
	ON b.FileRequestId = frh.FileRequestId
	WHERE frh.DateProcessed <= @dateProcessed
	AND b.ClientId = @clientId
),

Beneficiary_PartitionedBy_MBR_LOB_CD AS
(
SELECT 
	ROW_NUMBER() OVER 
	(
		PARTITION BY BeneficiaryIdentifier, MBR_LOB_CD 
		ORDER BY DateProcessed DESC, 
		MBR_ELIG_CNCL_DT DESC
	) as Rank, 
	* 
FROM Beneficiary_OrderedBy_FileRequestDate 
)

SELECT BeneficiaryId, BeneficiaryIdentifier, MBR_LOB_CD, DateProcessed 
FROM Beneficiary_PartitionedBy_MBR_LOB_CD 
WHERE Rank = 1



UNION ALL


-- unassigned beneficiary
SELECT 
	b.BeneficiaryId, b.BeneficiaryIdentifier, b.MBR_LOB_CD, 
	frh.DateProcessed
FROM 
	Beneficiary b,
	FileRequestHistory frh
WHERE 
	ClientId = 0
	AND BeneficiaryIdentifier = ''
	AND b.FileRequestId = frh.FileRequestId;

END
;