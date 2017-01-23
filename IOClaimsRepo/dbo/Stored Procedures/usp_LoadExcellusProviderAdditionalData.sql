



CREATE Procedure [dbo].[usp_LoadExcellusProviderAdditionalData] ( @DataDate Varchar(7), @FileRequestId  UniqueIdentifier)

as 

BEGIN


IF OBJECT_ID('dbo.ProviderAdditionalDataStage', 'U') IS NOT NULL 
BEGIN
DROP TABLE [dbo].[ProviderAdditionalDataStage]
END






SELECT 
Provider_ID  AS [ProviderNumber]
,ROW_NUMBER() OVER(Partition by Provider_ID ORDER BY Provider_ID) as OriginalLineNumber
,File_Type
,Filler_1 
,Filler_2
,Provider_Name  AS [Name]
,Address_1  AS [Address1]
,Address_2  AS [Address2]
,Address_3 
,City  AS [City]
,State  AS [State]
,Zip_Code  AS [ZipCode]
,Tax_ID  AS [FederalTaxIdNumber]
,Phone_Number  AS [Phone]
,Insurance_Company_Unique_ID 
,NPI  AS [NPI]
,Specialty_Code 
,Specialty_Description 
,SRC_APPL_CODE 
,PROV_ENTITY_CODE 
,PROV_ENTITY_DESCRIPTION 
,PROV_TYPE_CODE  AS [ProviderType]
,PROV_TYPE_DESCRIPTION 
,PROV_NYS_SPECIALTY_CODE 
,PROV_NYS_SPECIALTY_DESCRIPTION 
	
INTO [$(DatabaseName)].[dbo].[ProviderAdditionalDataStage]
FROM [$(ExcellusRaw)].[dbo].[Provider] 
WHERE datadate = @DataDate   


CREATE UNIQUE CLUSTERED INDEX CL_X ON [$(DatabaseName)].[dbo].[ProviderAdditionalDataStage] ( [ProviderNumber],[OriginalLineNumber])


SELECT 
[ProviderId],
ROW_NUMBER() OVER(Partition by [ProviderNumber] ORDER BY [ProviderNumber]) as OriginalLineNumber,
[ProviderNumber]
INTO #PROVIDER
FROM [dbo].[Provider] where [FileRequestId] =@FileRequestId

CREATE UNIQUE CLUSTERED INDEX CL_X ON #PROVIDER([ProviderNumber],OriginalLineNumber)







INSERT INTO [dbo].[ProviderAdditionalData]
           ([ProviderId]
			,[ClientID]
			,File_Type
			,Filler_1 
			,Filler_2
           	,Address_3 
			,Insurance_Company_Unique_ID 
			,Specialty_Code 
			,Specialty_Description 
			,SRC_APPL_CODE 
			,PROV_ENTITY_CODE 
			,PROV_ENTITY_DESCRIPTION 
			,PROV_TYPE_DESCRIPTION 
			,PROV_NYS_SPECIALTY_CODE 
			,PROV_NYS_SPECIALTY_DESCRIPTION 
			)






SELECT 
			A.[ProviderId]													
		   ,3 as [ClientID]			
			,File_Type
			,Filler_1 
			,Filler_2
           	,Address_3 
			,Insurance_Company_Unique_ID 
			,Specialty_Code 
			,Specialty_Description 
			,SRC_APPL_CODE 
			,PROV_ENTITY_CODE 
			,PROV_ENTITY_DESCRIPTION 
			,PROV_TYPE_DESCRIPTION 
			,PROV_NYS_SPECIALTY_CODE 
			,PROV_NYS_SPECIALTY_DESCRIPTION 

FROM 
#PROVIDER A  
INNER JOIN ProviderAdditionalDataStage B  ON A.[ProviderNumber] = B.[ProviderNumber] And A.[OriginalLineNumber] = B.[OriginalLineNumber]




DROP TABLE #PROVIDER
--DROP TABLE ProviderAdditionalDataStage
END



