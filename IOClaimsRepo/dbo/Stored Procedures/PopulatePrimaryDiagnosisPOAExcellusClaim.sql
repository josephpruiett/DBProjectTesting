


CREATE Procedure [dbo].[PopulatePrimaryDiagnosisPOAExcellusClaim] 
(@datadate varchar(7), @FileRequestId  UniqueIdentifier)
as 
BEGIN

select SUBSTRING(ioc.ClaimNumber, 1, 10) as ioc_clmnum, 
SUBSTRING(ioc.ClaimNumber, 11, 2) as ioc_srcnbr,
convert(int, iosl.LineNumber) as iosl_line_num,
iod.DiagnosisCodeId
into #tmp_claim_diag
from IOClaimsRepo.dbo.Claim ioc
inner join IOClaimsRepo.dbo.ServiceLine iosl
on (
ioc.FileRequestId = @FileRequestId
and iosl.Claim_id = ioc.ClaimId
)
inner join IOClaimsRepo.dbo.DiagnosisCode iod
on (
iod.ServiceLine_id = iosl.ServiceLineId
and iod.Sequence = 1 -- affect only primary diagnosis code on all lines
)

select vcd.Present_on_Admission_Code as poa,
clm.DiagnosisCodeId as iod_dig_id
into #tmp_clm_raw_join
from ExcellusRaw.dbo.VW_ClaimDetails vcd
inner join #tmp_claim_diag clm 
on (
vcd.Claim_History_Stage = 'FINAL'
and DataDate = @datadate
and vcd.Claim_Number = clm.ioc_clmnum
and vcd.SRC_APPL_ADJ_SQNC_NBR = clm.ioc_srcnbr
and convert(int, vcd.Claim_Line_Number) = clm.iosl_line_num
)

drop table #tmp_claim_diag

CREATE UNIQUE CLUSTERED INDEX CL_X1 ON #tmp_clm_raw_join(iod_dig_id)

update iod
set iod.PresentOnAdmission = poa.poa
from IOClaimsRepo.dbo.DiagnosisCode iod
inner join #tmp_clm_raw_join poa
on iod.DiagnosisCodeId = poa.iod_dig_id

drop table #tmp_clm_raw_join

END


