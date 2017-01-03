
CREATE Procedure [dbo].[spl_LoadExcellusProcedureCodeFromIOtoAP] (
	@BatchKey  nvarchar(255), 
	@IOClientId int, 
	@APClientId int,
	@ProcCodeDateDefault varchar(10) = '01/01/1900',
	@ProcCodeDateDefaultFormat int = 101
) as 
BEGIN

PRINT 'Selecting existing AP claims from ProcedureCode table for bactckey - ' + @BatchKey
select max(p.Claim_Id) as AP_Claim_id, max(c.ClaimNumber) as ClaimNumber
into #ap_proccode_claim_numbers
from APAudit.dbo.ProcedureCode p
INNER JOIN APAudit.dbo.Claim c 
ON (
	p.Claim_Id = c.Id 
	and c.ClientId = @APClientId and 
	c.BatchKey = @BatchKey
)
group by p.Claim_Id

PRINT 'Selecting corresponding IO claims'
select c.ClaimId as IO_Claim_Id, c.ClaimNumber as ClaimNumber, 
	p.AP_Claim_id, c.IcdIndicator
into #claimsrepo_claim_ids
from #ap_proccode_claim_numbers p
INNER JOIN IOClaimsRepo.dbo.Claim c 
ON ( 
	p.ClaimNumber = c.ClaimNumber
	-- and c.ClientId = @IOClientId -- need index
)

PRINT 'Selecting corresponding IO claims servicelines'
select s.ServiceLineId, c.ClaimNumber, 
	s.Claim_id as IO_Claim_Id, c.AP_Claim_id, c.IcdIndicator
into #claimsrepo_service_line_ids
from #claimsrepo_claim_ids c
INNER JOIN IOClaimsRepo.dbo.ServiceLine s ON c.IO_Claim_Id = s.Claim_id
where s.LineNumber = 1 -- use the diagnosis codes from the first service line

DROP TABLE #ap_proccode_claim_numbers;
DROP TABLE #claimsrepo_claim_ids;

BEGIN TRANSACTION;

select *
into #ap_proc_codes
from [APAudit].[dbo].[ProcedureCode] p

PRINT 'Deleting existing Procedure codes in AP for all claims in bactckey - ' + @BatchKey
DELETE p
FROM #ap_proc_codes p INNER JOIN #claimsrepo_service_line_ids c
ON (
	p.Claim_Id = c.AP_Claim_id
)

PRINT 'Inserting corresponding IO Diagnosis codes into AP Diagnosis with ICD formatting'
INSERT INTO #ap_proc_codes
           ([Code]
           ,[CreatedDate]
           ,[CreatedBy]
           ,[LastUpdatedDate]
           ,[LastUpdatedBy]
           ,[Claim_Id]
           ,[Sequence]
           ,[Date])
SELECT
	--iop.Code,
	CASE
		WHEN iop.Code is null or LTRIM(RTRIM(iop.Code)) = '' THEN iop.Code
		WHEN (c.IcdIndicator is null or LTRIM(RTRIM(c.IcdIndicator)) = '' or c.IcdIndicator = '9') 
			and (LEN(LTRIM(RTRIM(iop.Code))) < 3 or LEN(LTRIM(RTRIM(iop.Code))) > 4)
		THEN iop.Code
		WHEN (c.IcdIndicator is null or LTRIM(RTRIM(c.IcdIndicator)) = '' or c.IcdIndicator = '9') 
			and not (LEN(LTRIM(RTRIM(iop.Code))) < 3 or LEN(LTRIM(RTRIM(iop.Code))) > 4)
		THEN STUFF(LTRIM(RTRIM(iop.Code)), 3, 0, '.')
		ELSE iop.Code
	END,
	CURRENT_TIMESTAMP,
	'sysload',
	CURRENT_TIMESTAMP,
	'sysload',
	c.AP_Claim_id,
	iop.Sequence,
	CONVERT(datetime, @ProcCodeDateDefault, @ProcCodeDateDefaultFormat)
FROM #claimsrepo_service_line_ids c INNER JOIN IOClaimsRepo.dbo.ProcedureCode iop
ON (
	c.ServiceLineId = iop.ServiceLine_id
)

select * from #ap_proc_codes;

select * from 
#ap_proc_codes a left outer join [APAudit].[dbo].[ProcedureCode] p
on a.Claim_Id = p.Claim_Id and a.Code = p.Code
where p.Code is null;

select * from 
#ap_proc_codes a right outer join [APAudit].[dbo].[ProcedureCode] p
on a.Claim_Id = p.Claim_Id and a.Code = p.Code
where a.Code is null;

drop table #ap_proc_codes;

COMMIT;

drop table #claimsrepo_service_line_ids;

END














