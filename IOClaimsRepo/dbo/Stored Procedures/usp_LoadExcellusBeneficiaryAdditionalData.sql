



CREATE Procedure [dbo].[usp_LoadExcellusBeneficiaryAdditionalData] ( @DataDate Varchar(7), @FileRequestId  UniqueIdentifier)

as 

BEGIN


IF OBJECT_ID('dbo.BeneficiaryAdditionalDataStage', 'U') IS NOT NULL 
BEGIN
DROP TABLE [$(DatabaseName)].[dbo].[BeneficiaryAdditionalDataStage]
END






SELECT 
CONVERT(VARCHAR(20),Unique_ID)  AS [BeneficiaryIdentifier]
,File_Type
,Suffix 
,Social_Security_Number 
,CONVERT(VARCHAR(3)	,Dependent_Number ) as Dependent_Number
,CONVERT(VARCHAR(30)	,Contract_holders_ID ) as Contract_holders_ID
,Address_Line_3 
,Insurance_Company_Unique_ID 
,Member_group_number 
,Member_sub_group 
,Member_group_name 
,Funding_Arrangment 
,Member_line_of_business 
,Member_Effective_Date 
,CONVERT(DATETIME	,Member_Termination_Date ) as Member_Termination_Date
,Subscriber_First_Name 
,Subscriber_Middle_Initial 
,Subscriber_Last_Name 
,Subscriber_Date_of_Birth 
,Subscriber_Gender 
,Subscriber_SSN 
,Subscriber_Number 
,Rating_Region 
,COB_primary 
,COB_PrimaryType 
,COB_suspect 
,COB_SecondaryType 
,Mem_Cobra_Indicator 
,Mem_Medicare_Number 
,mem_medicaid_number 
,Mem_Retirement_Ind 
,src_appl_code 
,legacy_src_appl_code 
,legacy_group_id 
,legacy_subgrp_id 
,legacy_subr_id 
,legacy_dep_no 
,MJR_RISK_CLS_CODE 
,MJR_RISK_CLS_NAME 
,Patient_Relationship_Code 
,Patient_Relationship_Description 
INTO [$(DatabaseName)].[dbo].BeneficiaryAdditionalDataStage
	FROM [$(ExcellusRaw)].[dbo].[Member] 
WHERE datadate = @DataDate  

CREATE CLUSTERED INDEX CL_X ON [$(DatabaseName)].[dbo].[BeneficiaryAdditionalDataStage] ([BeneficiaryIdentifier],[Dependent_Number],[Contract_holders_ID],[Member_Termination_Date])







SELECT 

[BeneficiaryID],
CONVERT(VARCHAR(20),[BeneficiaryIdentifier]) as Unique_ID,
CONVERT(VARCHAR(3)	,	NULLIF(REPLACE(REPLACE(REPLACE(SUBSTRING(AdditionalDataJson,CHARINDEX('"Dependent Number"',AdditionalDataJson), ISNULL(CHARINDEX('"Contract holder''s ID"',AdditionalDataJson)- CHARINDEX('"Dependent Number"',AdditionalDataJson)-1 , LEN(AdditionalDataJson)-CHARINDEX('"Dependent Number"',AdditionalDataJson))),'"Dependent Number"'':',''),'"',''),'Dependent Number:','')			,''))							
		AS [Dependent_Number],
CONVERT(VARCHAR(30)	,	NULLIF(REPLACE(REPLACE(REPLACE(SUBSTRING(AdditionalDataJson,CHARINDEX('"Contract holder''s ID"',AdditionalDataJson), ISNULL(CHARINDEX('"Address Line 3"',AdditionalDataJson)- CHARINDEX('"Contract holder''s ID"',AdditionalDataJson)-1 , LEN(AdditionalDataJson)-CHARINDEX('"Contract holder''s ID"',AdditionalDataJson))),'"Contract holder''s ID"'':',''),'"',''),'Contract holder''s ID:','')		,''))			
		AS [Contract_holders_ID],
CONVERT(DATETIME	,	NULLIF(REPLACE(REPLACE(REPLACE(SUBSTRING(AdditionalDataJson,CHARINDEX('"Member Termination Date"',AdditionalDataJson), ISNULL(CHARINDEX('"Subscriber First Name"',AdditionalDataJson)- CHARINDEX('"Member Termination Date"',AdditionalDataJson)-1 , LEN(AdditionalDataJson)-CHARINDEX('"Member Termination Date"',AdditionalDataJson))),'"Member Termination Date"'':'	,''),'"',''),'Member Termination Date:',''),'')) 
		AS [Member_Termination_Date]
INTO #BENE 
FROM [dbo].[Beneficiary] where [FileRequestId] = @FileRequestId and [BeneficiaryID] <>1

CREATE CLUSTERED INDEX CL_X ON #BENE([Unique_ID],[Dependent_Number],[Contract_holders_ID],[Member_Termination_Date]);


SELECT 
			A.[BeneficiaryId]	
			,A.Unique_ID												
		   ,3 as [ClientID]			
		   ,B.[File_Type]
           ,B.[Suffix]
           ,B.[Social_Security_Number]
           ,B.[Dependent_Number]
           ,B.[Contract_holders_ID]
           ,B.[Address_Line_3]
           ,B.[Insurance_Company_Unique_ID]
           ,B.[Member_group_number]
           ,B.[Member_sub_group]
           ,B.[Member_group_name]
           ,B.[Funding_Arrangment]
           ,B.[Member_line_of_business]
           ,B.[Member_Effective_Date]
           ,B.[Member_Termination_Date]
           ,B.[Subscriber_First_Name]
           ,B.[Subscriber_Middle_Initial]
           ,B.[Subscriber_Last_Name]
           ,B.[Subscriber_Date_of_Birth]
           ,B.[Subscriber_Gender]
           ,B.[Subscriber_SSN]
           ,B.[Subscriber_Number]
           ,B.[Rating_Region]
           ,B.[COB_primary]
           ,B.[COB_PrimaryType]
           ,B.[COB_suspect]
           ,B.[COB_SecondaryType]
           ,B.[Mem_Cobra_Indicator]
           ,B.[Mem_Medicare_Number]
           ,B.[mem_medicaid_number]
           ,B.[Mem_Retirement_Ind]
           ,B.[src_appl_code]
           ,B.[legacy_src_appl_code]
           ,B.[legacy_group_id]
           ,B.[legacy_subgrp_id]
           ,B.[legacy_subr_id]
           ,B.[legacy_dep_no]
           ,B.[MJR_RISK_CLS_CODE]
           ,B.[MJR_RISK_CLS_NAME]
           ,B.[Patient_Relationship_Code]
           ,B.[Patient_Relationship_Description]
INTO #INTERMEDIATE
FROM 

#BENE A  
INNER JOIN [$(DatabaseName)].[dbo].[BeneficiaryAdditionalDataStage] B  ON A.Unique_ID = B.[BeneficiaryIdentifier] and A.[Dependent_Number] = B.[Dependent_Number] and A.[Contract_holders_ID] = B.[Contract_holders_ID]


CREATE CLUSTERED INDEX CL_X ON #INTERMEDIATE([BeneficiaryId],[UNIQUE_ID],[Dependent_Number],[Contract_holders_ID],[Member_Termination_Date]);


SELECT A.* INTO #FINAL FROM #INTERMEDIATE A INNER JOIN (

SELECT [BeneficiaryId],[UNique_ID],[Dependent_Number],[Contract_holders_ID],MAX([Member_Termination_Date]) [Member_Termination_Date] FROM #INTERMEDIATE 
GROUP BY  [BeneficiaryId],[UNique_ID],[Dependent_Number],[Contract_holders_ID]
) as B on A.[BeneficiaryId] = B.[BeneficiaryId] and A.[UNique_ID] = B.[UNique_ID] and A.[Contract_holders_ID] = B.[Contract_holders_ID] and A.[Member_Termination_Date] = B.[Member_Termination_Date]



INSERT INTO [$(DatabaseName)].[dbo].[BeneficiaryAdditionalData]
           ([BeneficiaryId]
           ,[ClientID]
           ,[File_Type]
           ,[Suffix]
           ,[Social_Security_Number]
           ,[Dependent_Number]
           ,[Contract_holders_ID]
           ,[Address_Line_3]
           ,[Insurance_Company_Unique_ID]
           ,[Member_group_number]
           ,[Member_sub_group]
           ,[Member_group_name]
           ,[Funding_Arrangment]
           ,[Member_line_of_business]
           ,[Member_Effective_Date]
           ,[Member_Termination_Date]
           ,[Subscriber_First_Name]
           ,[Subscriber_Middle_Initial]
           ,[Subscriber_Last_Name]
           ,[Subscriber_Date_of_Birth]
           ,[Subscriber_Gender]
           ,[Subscriber_SSN]
           ,[Subscriber_Number]
           ,[Rating_Region]
           ,[COB_primary]
           ,[COB_PrimaryType]
           ,[COB_suspect]
           ,[COB_SecondaryType]
           ,[Mem_Cobra_Indicator]
           ,[Mem_Medicare_Number]
           ,[mem_medicaid_number]
           ,[Mem_Retirement_Ind]
           ,[src_appl_code]
           ,[legacy_src_appl_code]
           ,[legacy_group_id]
           ,[legacy_subgrp_id]
           ,[legacy_subr_id]
           ,[legacy_dep_no]
           ,[MJR_RISK_CLS_CODE]
           ,[MJR_RISK_CLS_NAME]
           ,[Patient_Relationship_Code]
           ,[Patient_Relationship_Description])

SELECT 
			[BeneficiaryId]													
		   ,3 as [ClientID]			
		   ,[File_Type]
           ,[Suffix]
           ,[Social_Security_Number]
           ,[Dependent_Number]
           ,[Contract_holders_ID]
           ,[Address_Line_3]
           ,[Insurance_Company_Unique_ID]
           ,[Member_group_number]
           ,[Member_sub_group]
           ,[Member_group_name]
           ,[Funding_Arrangment]
           ,[Member_line_of_business]
           ,[Member_Effective_Date]
           ,[Member_Termination_Date]
           ,[Subscriber_First_Name]
           ,[Subscriber_Middle_Initial]
           ,[Subscriber_Last_Name]
           ,[Subscriber_Date_of_Birth]
           ,[Subscriber_Gender]
           ,[Subscriber_SSN]
           ,[Subscriber_Number]
           ,[Rating_Region]
           ,[COB_primary]
           ,[COB_PrimaryType]
           ,[COB_suspect]
           ,[COB_SecondaryType]
           ,[Mem_Cobra_Indicator]
           ,[Mem_Medicare_Number]
           ,[mem_medicaid_number]
           ,[Mem_Retirement_Ind]
           ,[src_appl_code]
           ,[legacy_src_appl_code]
           ,[legacy_group_id]
           ,[legacy_subgrp_id]
           ,[legacy_subr_id]
           ,[legacy_dep_no]
           ,[MJR_RISK_CLS_CODE]
           ,[MJR_RISK_CLS_NAME]
           ,[Patient_Relationship_Code]
           ,[Patient_Relationship_Description]

		   FROM #FINAL

DROP TABLE #FINAL
DROP TABLE #INTERMEDIATE
DROP TABLE #BENE
DROP TABLE [$(DatabaseName)].[dbo].[BeneficiaryAdditionalDataStage]
END



