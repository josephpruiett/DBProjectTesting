

CREATE Procedure [dbo].[PopulateExcellusProcedureCodeAdditionalData] (@FileRequestId  UniqueIdentifier)
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
	inner join ProcedureCode dc on ( cl.ServiceLineId = dc.ServiceLine_id )
CREATE CLUSTERED INDEX CL_X2 ON #CURRENTCODES(ServiceLineId, Seq)

INSERT INTO ProcedureCode (
	ServiceLine_id, 
	Code, 
	Sequence
)
SELECT NewCodes.ServiceLine_id as ServiceLine_id,
	NewCodes.Code as Code, 
	NewCodes.[Sequence] as [Sequence]
FROM
(select
  Unpvt.clServiceLineId as ServiceLine_id,
  Unpvt.CodeValue as Code,
  CASE
    WHEN Unpvt.Code = 'Additional_proc_code_1' THEN 1    
    WHEN Unpvt.Code = 'Additional_proc_code_2' THEN 2
    WHEN Unpvt.Code = 'Additional_proc_code_3' THEN 3
    WHEN Unpvt.Code = 'Additional_proc_code_4' THEN 4
    WHEN Unpvt.Code = 'Additional_proc_code_5' THEN 5  
    WHEN Unpvt.Code = 'Additional_proc_code_6' THEN 6
    WHEN Unpvt.Code = 'Additional_proc_code_7' THEN 7
    WHEN Unpvt.Code = 'Additional_proc_code_8' THEN 8
    WHEN Unpvt.Code = 'Additional_proc_code_9' THEN 9
    WHEN Unpvt.Code = 'Additional_proc_code_10' THEN 10
    WHEN Unpvt.Code = 'Additional_proc_code_11' THEN 11
    WHEN Unpvt.Code = 'Additional_proc_code_12' THEN 12
    WHEN Unpvt.Code = 'Additional_proc_code_13' THEN 13
    WHEN Unpvt.Code = 'Additional_proc_code_14' THEN 14
    WHEN Unpvt.Code = 'Additional_proc_code_15' THEN 15
    WHEN Unpvt.Code = 'Additional_proc_code_16' THEN 16
    WHEN Unpvt.Code = 'Additional_proc_code_17' THEN 17
    WHEN Unpvt.Code = 'Additional_proc_code_18' THEN 18
    WHEN Unpvt.Code = 'Additional_proc_code_19' THEN 19
    WHEN Unpvt.Code = 'Additional_proc_code_20' THEN 20
    WHEN Unpvt.Code = 'Additional_proc_code_21' THEN 21
    WHEN Unpvt.Code = 'Additional_proc_code_22' THEN 22
    WHEN Unpvt.Code = 'Additional_proc_code_23' THEN 23
    WHEN Unpvt.Code = 'Additional_proc_code_24' THEN 24
    WHEN Unpvt.Code = 'Additional_proc_code_25' THEN 25
  END AS [Sequence]
FROM (
  select cl.ServiceLineId as clServiceLineId,
  ad.ServiceLineID as adServiceLineId, 
  ad.Additional_proc_code_1 as Additional_proc_code_1,
  ad.Additional_proc_code_2 as Additional_proc_code_2, ad.Additional_proc_code_3 as Additional_proc_code_3, 
  ad.Additional_proc_code_4 as Additional_proc_code_4, ad.Additional_proc_code_5 as Additional_proc_code_5,
  drg.ServiceLineId as  drgServiceLineId,
  drg.Additional_proc_code_6 as Additional_proc_code_6, drg.Additional_proc_code_7 as Additional_proc_code_7,
  drg.Additional_proc_code_8 as Additional_proc_code_8, drg.Additional_proc_code_9 as Additional_proc_code_9,
  drg.Additional_proc_code_10 as Additional_proc_code_10, drg.Additional_proc_code_11 as Additional_proc_code_11,
  drg.Additional_proc_code_12 as Additional_proc_code_12, drg.Additional_proc_code_13 as Additional_proc_code_13,
  drg.Additional_proc_code_14 as Additional_proc_code_14, drg.Additional_proc_code_15 as Additional_proc_code_15,
  drg.Additional_proc_code_16 as Additional_proc_code_16, drg.Additional_proc_code_17 as Additional_proc_code_17,
  drg.Additional_proc_code_18 as Additional_proc_code_18, drg.Additional_proc_code_19 as Additional_proc_code_19,
  drg.Additional_proc_code_20 as Additional_proc_code_20, drg.Additional_proc_code_21 as Additional_proc_code_21,
  drg.Additional_proc_code_22 as Additional_proc_code_22, drg.Additional_proc_code_23 as Additional_proc_code_23,
  drg.Additional_proc_code_24 as Additional_proc_code_24, drg.Additional_proc_code_25 as Additional_proc_code_25
  from #CLAIMLINE cl 
  left outer join ServiceLineAdditionalData ad on ( cl.ServiceLineId = ad.ServiceLineId ) 
  left outer join ServiceLineDRG drg on ( cl.ServiceLineId = drg.ServiceLineId )
) AS allcodes unpivot ( 
  CodeValue For Code IN (
    allcodes.Additional_proc_code_1,
    allcodes.Additional_proc_code_2,
    allcodes.Additional_proc_code_3,
    allcodes.Additional_proc_code_4,
    allcodes.Additional_proc_code_5,  
    allcodes.Additional_proc_code_6,
    allcodes.Additional_proc_code_7,
    allcodes.Additional_proc_code_8,
    allcodes.Additional_proc_code_9,
    allcodes.Additional_proc_code_10,
    allcodes.Additional_proc_code_11,
    allcodes.Additional_proc_code_12,
    allcodes.Additional_proc_code_13,
    allcodes.Additional_proc_code_14,
    allcodes.Additional_proc_code_15,
    allcodes.Additional_proc_code_16,
    allcodes.Additional_proc_code_17,
    allcodes.Additional_proc_code_18,
    allcodes.Additional_proc_code_19,
    allcodes.Additional_proc_code_20,
    allcodes.Additional_proc_code_21,
    allcodes.Additional_proc_code_22,
    allcodes.Additional_proc_code_23,
    allcodes.Additional_proc_code_24,
    allcodes.Additional_proc_code_25
    )
) AS Unpvt
) AS NewCodes left outer join #CURRENTCODES cc on ( NewCodes.ServiceLine_id = cc.ServiceLineId and NewCodes.[Sequence] = cc.Seq )
WHERE cc.ServiceLineId is null

DROP Table #CLAIMLINE
DROP Table #CURRENTCODES

END


;