
CREATE proc [dbo].[GetMostRecentProviderRecords]
(@fileRequestId as uniqueidentifier, @clientId as INTEGER)
as 
begin
declare @dateProcessed as datetime;

set @dateProcessed = (select dateprocessed from filerequesthistory where filerequestid = @fileRequestId);

select * from

(select max(dateprocessed) as date_processed, max(p.ProviderNumber) as provider_number from filerequesthistory  
inner join provider as p  (NOLOCK)
on p.FileRequestId = filerequesthistory.filerequestid
where dateprocessed <= @dateProcessed
AND (p.ClientId = @clientId OR p.ProviderNumber = '')
group by p.ProviderNumber)
as t1,

(select fr.DateProcessed, pr.* from Filerequesthistory as fr
inner join provider pr (NOLOCK)
on fr.FileRequestId = pr.FileRequestId)
as t2
 
where t1.date_processed = t2.DateProcessed and t1.provider_number = t2.ProviderNumber
end

;