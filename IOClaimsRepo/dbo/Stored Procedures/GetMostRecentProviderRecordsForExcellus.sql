
CREATE proc [dbo].[GetMostRecentProviderRecordsForExcellus]
(@fileRequestId uniqueidentifier,
@clientId INTEGER)
AS 
BEGIN



DECLARE @dateProcessed AS DATETIME = 
	(SELECT DateProcessed FROM FileRequestHistory WHERE FileRequestId = @fileRequestId);


SELECT *
FROM (
	SELECT
		ProviderId,
		ProviderNumber,
		ROW_NUMBER() OVER 
		(
			PARTITION BY ProviderNumber 
			ORDER BY DateProcessed DESC,

			-- Within a given file, select the provider record with greatest OriginalLineNumber
			OriginalLineNumber DESC 
		) AS RecordOrder
	FROM 
		(
			SELECT frh.DateProcessed, p.* 
			FROM FileRequestHistory AS frh
			INNER JOIN Provider p (NOLOCK)
			ON frh.FileRequestId = p.FileRequestId
			WHERE ClientId = @clientId
		)  AS Provider_FileRequestHistory_join 
	WHERE
		DateProcessed <= @dateProcessed
	) AS Providers_ordered_by_DateProcessed_then_by_OriginalLineNumber
WHERE 
	Providers_ordered_by_DateProcessed_then_by_OriginalLineNumber.RecordOrder = 1 



UNION ALL

-- "Unassigned" provider
SELECT 
	ProviderId,
	ProviderNumber,
	RecordOrder = 1
FROM
	Provider
WHERE
	ClientId = 0
	AND ProviderNumber = '';


END
