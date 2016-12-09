CREATE PROCEDURE PopulateAdditionalDataJsonForExcellus

--@ClaimFRID uniqueidentifier,
--@ServiceLineFRID uniqueidentifier,
--@BeneficiaryFRID uniqueidentifier,
--@ProviderFRID uniqueidentifier

AS 

BEGIN

	UPDATE A Set AdditionalDataJSON = B.AdditionalDataJSON FROM [Claim] A INNER JOIN (
	SELECT Claimid, REPLACE('{'+
	'"File Type":"'+ISNULL(CONVERT(VARCHAR(255),[File_Type]),'null')+'"'
	+','+'"Member ID":"'+ISNULL(CONVERT(VARCHAR(255),[Member_ID]),'null')+'"'
	+','+'"Drug Claim":"'+ISNULL(CONVERT(VARCHAR(255),[Drug_Claim]),'null')+'"'
	+','+'"Insurance Company Unique ID":"'+ISNULL(CONVERT(VARCHAR(255),[Insurance_Company_Unique_ID]),'null')+'"'
	+','+'"Prescribing Physician Provider ID":"'+ISNULL(CONVERT(VARCHAR(255),[Prescribing_Physician_Provider_ID]),'null')+'"'
	+','+'"Total Claim allowed amount":"'+ISNULL(CONVERT(VARCHAR(255),[Total_Claim_allowed_amount]),'null')+'"'
	+','+'"Total Other carrier paid amt":"'+ISNULL(CONVERT(VARCHAR(255),[Total_Other_carrier_paid_amt]),'null')+'"'
	+','+'"Total Claim member liability":"'+ISNULL(CONVERT(VARCHAR(255),[Total_Claim_member_liability]),'null')+'"'
	+','+'"Bill Type":"'+ISNULL(CONVERT(VARCHAR(255),[Bill_Type]),'null')+'"'
	+','+'"Total Copayment Amt":"'+ISNULL(CONVERT(VARCHAR(255),[Total_Copayment_Amt]),'null')+'"'
	+','+'"Total Deductible Amt":"'+ISNULL(CONVERT(VARCHAR(255),[Total_Deductible_Amt]),'null')+'"'
	+','+'"Total Coinsurance Amt":"'+ISNULL(CONVERT(VARCHAR(255),[Total_Coinsurance_Amt]),'null')+'"'
	+','+'"Home Host Ind":"'+ISNULL(CONVERT(VARCHAR(255),[Home_Host_Ind]),'null')+'"'
	+','+'"Billing Provider Tax id":"'+ISNULL(CONVERT(VARCHAR(255),[Billing_Provider_Tax_id]),'null')+'"'
	+','+'"Bad Debt Amt":"'+ISNULL(CONVERT(VARCHAR(255),[Bad_Debt_Amt]),'null')+'"'
	+','+'"Withheld Amt":"'+ISNULL(CONVERT(VARCHAR(255),[Withheld_Amt]),'null')+'"'
	+','+'"Admission Date":"'+ISNULL(CONVERT(VARCHAR(255),[Admission_Date]),'null')+'"'
	+','+'"Patient Status Desc":"'+ISNULL(CONVERT(VARCHAR(255),[Patient_Status_Desc]),'null')+'"'
	+','+'"Src_appl_code":"'+ISNULL(CONVERT(VARCHAR(255),[Src_appl_code]),'null')+'"'
	+','+'"Source Adjustment Number":"'+ISNULL(CONVERT(VARCHAR(255),[Source_Adjustment_Number]),'null')+'"'
	+'}'
	,'"null"','null') as AdditionalDataJSON
	FROM ClaimAdditionalData ) AS B ON A.ClaimID = B.ClaimID WHERE A.ClientId = 3 --Excellus

	UPDATE A Set AdditionalDataJSON = B.AdditionalDataJSON FROM [ServiceLine] A INNER JOIN (
	SELECT  ServiceLineid, REPLACE('{'+
	'"File Type":"'+ISNULL(CONVERT(VARCHAR(255),[File_Type]),'null')+'"'
	+','+'"Claim Adjustment Number":"'+ISNULL(CONVERT(VARCHAR(255),[Claim_Adjustment_Number]),'null')+'"'
	+','+'"Drug line":"'+ISNULL(CONVERT(VARCHAR(255),[Drug_line]),'null')+'"'
	+','+'"CPT4 Procedure code Description":"'+ISNULL(CONVERT(VARCHAR(255),[CPT4_Procedure_code_Description]),'null')+'"'
	+','+'"Insurance Company Unique ID":"'+ISNULL(CONVERT(VARCHAR(255),[Insurance_Company_Unique_ID]),'null')+'"'
	+','+'"Unique ID":"'+ISNULL(CONVERT(VARCHAR(255),[Unique_ID]),'null')+'"'
	+','+'"Contract holder''s ID":"'+ISNULL(CONVERT(VARCHAR(255),[Contract_holders_ID]),'null')+'"'
	+','+'"Dependent Number":"'+ISNULL(CONVERT(VARCHAR(255),[Dependent_Number]),'null')+'"'
	+','+'"Other carrier paid amt":"'+ISNULL(CONVERT(VARCHAR(255),[Other_carrier_paid_amt]),'null')+'"'
	+','+'"Claim Member Liability":"'+ISNULL(CONVERT(VARCHAR(255),[Claim_Member_Liability]),'null')+'"'
	+','+'"Claim Paid Date":"'+ISNULL(CONVERT(VARCHAR(255),[Claim_Paid_Date]),'null')+'"'
	+','+'"Admitting Diagnosis":"'+ISNULL(CONVERT(VARCHAR(255),[Admitting_Diagnosis]),'null')+'"'
	+','+'"Additional proc code1":"'+ISNULL(CONVERT(VARCHAR(255),[Additional_proc_code_1]),'null')+'"'
	+','+'"Additional proc code 2":"'+ISNULL(CONVERT(VARCHAR(255),[Additional_proc_code_2]),'null')+'"'
	+','+'"Additional proc code 3":"'+ISNULL(CONVERT(VARCHAR(255),[Additional_proc_code_3]),'null')+'"'
	+','+'"Additional proc code 4":"'+ISNULL(CONVERT(VARCHAR(255),[Additional_proc_code_4]),'null')+'"'
	+','+'"Additional proc code 5":"'+ISNULL(CONVERT(VARCHAR(255),[Additional_proc_code_5]),'null')+'"'
	+','+'"Place of Service Desc":"'+ISNULL(CONVERT(VARCHAR(255),[Place_of_Service_Desc]),'null')+'"'
	+','+'"Hosp Med Ind":"'+ISNULL(CONVERT(VARCHAR(255),[Hosp_Med_Ind]),'null')+'"'
	+','+'"Home Grown Code":"'+ISNULL(CONVERT(VARCHAR(255),[Home_Grown_Code]),'null')+'"'
	+','+'"Home Grown Codee Desc":"'+ISNULL(CONVERT(VARCHAR(255),[Home_Grown_Code_Desc]),'null')+'"'
	+','+'"HCPCS Code":"'+ISNULL(CONVERT(VARCHAR(255),[HCPCS_Code]),'null')+'"'
	+','+'"HCPCS Desc":"'+ISNULL(CONVERT(VARCHAR(255),[HCPCS_Desc]),'null')+'"'
	+','+'"Type of Service Code":"'+ISNULL(CONVERT(VARCHAR(255),[Type_of_Service_Code]),'null')+'"'
	+','+'"Type of Service Desc":"'+ISNULL(CONVERT(VARCHAR(255),[Type_of_Service_Desc]),'null')+'"'
	+','+'"Par Code":"'+ISNULL(CONVERT(VARCHAR(255),[Par_Code]),'null')+'"'
	+','+'"Par Desc":"'+ISNULL(CONVERT(VARCHAR(255),[Par_Desc]),'null')+'"'
	+','+'"Servicing Provider Tax Id":"'+ISNULL(CONVERT(VARCHAR(255),[Servicing_Provider_Tax_Id]),'null')+'"'
	+','+'"Adjustment_Indicator":"'+ISNULL(CONVERT(VARCHAR(255),[Adjustment_Indicator]),'null')+'"'
	+','+'"Agreement ID":"'+ISNULL(CONVERT(VARCHAR(255),[Agreement_ID]),'null')+'"'
	+','+'"Authorization_Code":"'+ISNULL(CONVERT(VARCHAR(255),[Authorization_Code]),'null')+'"'
	+','+'"CLHP_Birth_Wgt":"'+ISNULL(CONVERT(VARCHAR(255),[CLHP_Birth_Wgt]),'null')+'"'
	+','+'"Frequency":"'+ISNULL(CONVERT(VARCHAR(255),[Frequency]),'null')+'"'
	+','+'"MEDICAL_RECNO":"'+ISNULL(CONVERT(VARCHAR(255),[MEDICAL_RECNO]),'null')+'"'
	+','+'"Medicare_DRG_Code":"'+ISNULL(CONVERT(VARCHAR(255),[Medicare_DRG_Code]),'null')+'"'
	+','+'"Mem_Cobra_Indicator":"'+ISNULL(CONVERT(VARCHAR(255),[Mem_Cobra_Indicator]),'null')+'"'
	+','+'"Mem_Medicare_Number":"'+ISNULL(CONVERT(VARCHAR(255),[Mem_Medicare_Number]),'null')+'"'
	+','+'"Mem_Phone":"'+ISNULL(CONVERT(VARCHAR(255),[Mem_Phone]),'null')+'"'
	+','+'"Mem_Retirement_Ind":"'+ISNULL(CONVERT(VARCHAR(255),[Mem_Retirement_Ind]),'null')+'"'
	+','+'"Rule":"'+ISNULL(CONVERT(VARCHAR(255),[Rule]),'null')+'"'
	+','+'"Service Pricing":"'+ISNULL(CONVERT(VARCHAR(255),[Service_Pricing]),'null')+'"'
	+','+'"Unit_Days_Allowed":"'+ISNULL(CONVERT(VARCHAR(255),[Unit_Days_Allowed]),'null')+'"'
	+','+'"DSALW_CODE":"'+ISNULL(CONVERT(VARCHAR(255),[DSALW_CODE]),'null')+'"'
	+','+'"DSALW_CODE_DESC":"'+ISNULL(CONVERT(VARCHAR(255),[DSALW_CODE_DESC]),'null')+'"'
	+','+'"ADJ_EXPLN_CODE":"'+ISNULL(CONVERT(VARCHAR(255),[ADJ_EXPLN_CODE]),'null')+'"'
	+','+'"ADJ_EXPLN_CODE_DESC":"'+ISNULL(CONVERT(VARCHAR(255),[ADJ_EXPLN_CODE_DESC]),'null')+'"'
	+','+'"Network Indicator (Par/Non-Par) System":"'+ISNULL(CONVERT(VARCHAR(255),[Network_Indicator_Par_Non_Par_System]),'null')+'"'
	+','+'"Claim Type":"'+ISNULL(CONVERT(VARCHAR(255),[Claim_Type]),'null')+'"'
	+','+'"Claim Received Date":"'+ISNULL(CONVERT(VARCHAR(255),[Claim_Received_Date]),'null')+'"'
	+','+'"Payee Code":"'+ISNULL(CONVERT(VARCHAR(255),[Payee_Code]),'null')+'"'
	+','+'"COB  NAME":"'+ISNULL(CONVERT(VARCHAR(255),[COB_NAME]),'null')+'"'
	+','+'"Src_appl_code":"'+ISNULL(CONVERT(VARCHAR(255),[SRC_APPL_CODE]),'null')+'"'
	+','+'"SRC_APPL_ADJ_SQNC_NBR":"'+ISNULL(CONVERT(VARCHAR(255),[SRC_APPL_ADJ_SQNC_NBR]),'null')+'"'
	+','+'"GRP_SGMNT_CODE":"'+ISNULL(CONVERT(VARCHAR(255),[GRP_SGMNT_CODE]),'null')+'"'
	+','+'"GRP_SGMNT_CODE_DESC":"'+ISNULL(CONVERT(VARCHAR(255),[GRP_SGMNT_CODE_DESC]),'null')+'"'
	+','+'"FAC_TYPE_CODE":"'+ISNULL(CONVERT(VARCHAR(255),[FAC_TYPE_CODE]),'null')+'"'
	+','+'"FAC_TYPE_CODE_NAME":"'+ISNULL(CONVERT(VARCHAR(255),[FAC_TYPE_CODE_NAME]),'null')+'"'
	+','+'"BSNS_SGMNT":"'+ISNULL(CONVERT(VARCHAR(255),[BSNS_SGMNT]),'null')+'"'
	+','+'"PROD_CAT_NAME":"'+ISNULL(CONVERT(VARCHAR(255),[PROD_CAT_NAME]),'null')+'"'
	+','+'"DRG_SYS_ID":"'+ISNULL(CONVERT(VARCHAR(255),[DRG_SYS_ID]),'null')+'"'
	+','+'"SOI":"'+ISNULL(CONVERT(VARCHAR(255),[SOI]),'null')+'"'
	+','+'"ROM":"'+ISNULL(CONVERT(VARCHAR(255),[ROM]),'null')+'"'
	+','+'"ITS_Srvc_Prov_Name":"'+ISNULL(CONVERT(VARCHAR(255),[ITS_Srvc_Prov_Name]),'null')+'"'
	+','+'"ITS_Srvc_Prov_NPI":"'+ISNULL(CONVERT(VARCHAR(255),[ITS_Srvc_Prov_NPI]),'null')+'"'
	+','+'"ITS_Srvc_Prov_Zip_Code":"'+ISNULL(CONVERT(VARCHAR(255),[ITS_Srvc_Prov_Zip_Code]),'null')+'"'
	+','+'"ITS_Srvc_Prov_Specialty_Code":"'+ISNULL(CONVERT(VARCHAR(255),[ITS_Srvc_Prov_Specialty_Code]),'null')+'"'
	+','+'"ITS_Srvc_Prov_Specialty_Desc":"'+ISNULL(CONVERT(VARCHAR(255),[ITS_Srvc_Prov_Specialty_Desc]),'null')+'"'
	+','+'"ITS_Srvc_Prov_Type_Code":"'+ISNULL(CONVERT(VARCHAR(255),[ITS_Srvc_Prov_Type_Code]),'null')+'"'
	+','+'"ITS_Srvc_Prov_Type_Desc":"'+ISNULL(CONVERT(VARCHAR(255),[ITS_Srvc_Prov_Type_Desc]),'null')+'"'
	+','+'"ITS_Srvc_Prov_Host_Plan_Code":"'+ISNULL(CONVERT(VARCHAR(255),[ITS_Srvc_Prov_Host_Plan_Code]),'null')+'"'
	+','+'"ITS_Srvc_Prov_Host_Plan_Name":"'+ISNULL(CONVERT(VARCHAR(255),[ITS_Srvc_Prov_Host_Plan_Name]),'null')+'"'
	+','+'"ITS_Srvc_Prov_Host_Plan_ID":"'+ISNULL(CONVERT(VARCHAR(255),[ITS_Srvc_Prov_Host_Plan_ID]),'null')+'"'
	+','+'"ITS_Bill_Prov_Tax_ID":"'+ISNULL(CONVERT(VARCHAR(255),[ITS_Bill_Prov_Tax_ID]),'null')+'"'
	+','+'"ITS_Bill_Prov_Name":"'+ISNULL(CONVERT(VARCHAR(255),[ITS_Bill_Prov_Name]),'null')+'"'
	+','+'"ITS_Bill_Prov_NPI":"'+ISNULL(CONVERT(VARCHAR(255),[ITS_Bill_Prov_NPI]),'null')+'"'
	+','+'"ITS_Bill_Prov_Host_Plan_Code":"'+ISNULL(CONVERT(VARCHAR(255),[ITS_Bill_Prov_Host_Plan_Code]),'null')+'"'
	+','+'"ITS_Bill_Prov_Host_Plan_Name":"'+ISNULL(CONVERT(VARCHAR(255),[ITS_Bill_Prov_Host_Plan_Name]),'null')+'"'
	+','+'"ITS_Bill_Prov_Host_Plan_Id":"'+ISNULL(CONVERT(VARCHAR(255),[ITS_Bill_Prov_Host_Plan_Id]),'null')+'"'
	+','+'"ITS_Bill_Prov_Address_1":"'+ISNULL(CONVERT(VARCHAR(255),[ITS_Bill_Prov_Address_1]),'null')+'"'
	+','+'"ITS_Bill_Prov_Address_2":"'+ISNULL(CONVERT(VARCHAR(255),[ITS_Bill_Prov_Address_2]),'null')+'"'
	+','+'"ITS_Bill_Prov_City_Name":"'+ISNULL(CONVERT(VARCHAR(255),[ITS_Bill_Prov_City_Name]),'null')+'"'
	+','+'"ITS_Bill_Prov_State_Code":"'+ISNULL(CONVERT(VARCHAR(255),[ITS_Bill_Prov_State_Code]),'null')+'"'
	+','+'"ITS_Bill_Prov_Zip_Code":"'+ISNULL(CONVERT(VARCHAR(255),[ITS_Bill_Prov_Zip_Code]),'null')+'"'
	+','+'"class of risk":"'+ISNULL(CONVERT(VARCHAR(255),[class_of_risk]),'null')+'"'
	+','+'"risk cat name":"'+ISNULL(CONVERT(VARCHAR(255),[risk_cat_name]),'null')+'"'
	+','+'"funding arrangement":"'+ISNULL(CONVERT(VARCHAR(255),[funding_arrangement]),'null')+'"'
	+','+'"Product ID":"'+ISNULL(CONVERT(VARCHAR(255),[Product_ID]),'null')+'"'
	+','+'"Product Desc":"'+ISNULL(CONVERT(VARCHAR(255),[Product_Desc]),'null')+'"'
	+','+'"Payer ID":"'+ISNULL(CONVERT(VARCHAR(255),[Payer_ID]),'null')+'"'
	+','+'"Payer Name":"'+ISNULL(CONVERT(VARCHAR(255),[Payer_Name]),'null')+'"'
	+','+'"HCRA_SURCHARGE_AMT":"'+ISNULL(CONVERT(VARCHAR(255),[HCRA_Surcharge_Amount] ),'null')+'"'
	+','+'"RISK_WITHHOLD_AMT":"'+ISNULL(CONVERT(VARCHAR(255),[Risk_Withhold_Amount] ),'null')+'"'
	+','+'"Discharge Status":"'+ISNULL(CONVERT(VARCHAR(255),[Discharge_Status]),'null')+'"'
	+','+'"Patient Relationship Code":"'+ISNULL(CONVERT(VARCHAR(255),[Patient_Relationship_Code]),'null')+'"'
	+','+'"Patient Relationship Desc":"'+ISNULL(CONVERT(VARCHAR(255),[Patient_Relationship_Desc]),'null')+'"'
	+'}'
	,'"null"','null') as AdditionalDataJSON
	FROM ServiceLineAdditionalData ) AS B ON A.ServiceLineID = B.ServiceLineID 
	WHERE A.Claim_ID in (SELECT ClaimId from Claim A  WHERE A.ClientId = 3) --Excellus










	UPDATE A Set AdditionalDataJSON = B.AdditionalDataJSON FROM [Beneficiary] A INNER JOIN (
	SELECT Beneficiaryid, REPLACE('{'+
	'"File Type":"'+ISNULL(CONVERT(VARCHAR(255),[File_Type]),'null')+'"'
	+','+'"Suffix":"'+ISNULL(CONVERT(VARCHAR(255),[Suffix]),'null')+'"'
	+','+'"Social Security Number":"'+ISNULL(CONVERT(VARCHAR(255),[Social_Security_Number]),'null')+'"'
	+','+'"Dependent Number":"'+ISNULL(CONVERT(VARCHAR(255),[Dependent_Number]),'null')+'"'
	+','+'"Contract holder''s ID":"'+ISNULL(CONVERT(VARCHAR(255),[Contract_holders_ID]),'null')+'"'
	+','+'"Address Line 3":"'+ISNULL(CONVERT(VARCHAR(255),[Address_Line_3]),'null')+'"'
	+','+'"Insurance Company Unique ID":"'+ISNULL(CONVERT(VARCHAR(255),[Insurance_Company_Unique_ID]),'null')+'"'
	+','+'"Member group number":"'+ISNULL(CONVERT(VARCHAR(255),[Member_group_number]),'null')+'"'
	+','+'"Member sub group":"'+ISNULL(CONVERT(VARCHAR(255),[Member_sub_group]),'null')+'"'
	+','+'"Member group name":"'+ISNULL(CONVERT(VARCHAR(255),[Member_group_name]),'null')+'"'
	+','+'"Funding Arrangment":"'+ISNULL(CONVERT(VARCHAR(255),[Funding_Arrangment]),'null')+'"'
	+','+'"Member line of business":"'+ISNULL(CONVERT(VARCHAR(255),[Member_line_of_business]),'null')+'"'
	+','+'"Member Effective Date":"'+ISNULL(CONVERT(VARCHAR(255),[Member_Effective_Date]),'null')+'"'
	+','+'"Member Termination Date":"'+ISNULL(CONVERT(VARCHAR(255),[Member_Termination_Date]),'null')+'"'
	+','+'"Subscriber First Name":"'+ISNULL(CONVERT(VARCHAR(255),[Subscriber_First_Name]),'null')+'"'
	+','+'"Subscriber Middle Initial":"'+ISNULL(CONVERT(VARCHAR(255),[Subscriber_Middle_Initial]),'null')+'"'
	+','+'"Subscriber Last Name":"'+ISNULL(CONVERT(VARCHAR(255),[Subscriber_Last_Name]),'null')+'"'
	+','+'"Subscriber Date of Birth":"'+ISNULL(CONVERT(VARCHAR(255),[Subscriber_Date_of_Birth]),'null')+'"'
	+','+'"Subscriber Gender":"'+ISNULL(CONVERT(VARCHAR(255),[Subscriber_Gender]),'null')+'"'
	+','+'"Subscriber SSN":"'+ISNULL(CONVERT(VARCHAR(255),[Subscriber_SSN]),'null')+'"'
	+','+'"Subscriber Number":"'+ISNULL(CONVERT(VARCHAR(255),[Subscriber_Number]),'null')+'"'
	+','+'"Rating Region":"'+ISNULL(CONVERT(VARCHAR(255),[Rating_Region]),'null')+'"'
	+','+'"COB primary":"'+ISNULL(CONVERT(VARCHAR(255),[COB_primary]),'null')+'"'
	+','+'"COB PrimaryType ":"'+ISNULL(CONVERT(VARCHAR(255),[COB_PrimaryType]),'null')+'"'
	+','+'"COB suspect":"'+ISNULL(CONVERT(VARCHAR(255),[COB_suspect]),'null')+'"'
	+','+'"COB SecondaryType":"'+ISNULL(CONVERT(VARCHAR(255),[COB_SecondaryType]),'null')+'"'
	+','+'"Mem_Cobra_Indicator":"'+ISNULL(CONVERT(VARCHAR(255),[Mem_Cobra_Indicator]),'null')+'"'
	+','+'"Mem_Medicare_Number":"'+ISNULL(CONVERT(VARCHAR(255),[Mem_Medicare_Number]),'null')+'"'
	+','+'"mem_medicaid_number":"'+ISNULL(CONVERT(VARCHAR(255),[mem_medicaid_number]),'null')+'"'
	+','+'"Mem_Retirement_Ind":"'+ISNULL(CONVERT(VARCHAR(255),[Mem_Retirement_Ind]),'null')+'"'
	+','+'"src_appl_code":"'+ISNULL(CONVERT(VARCHAR(255),[src_appl_code]),'null')+'"'
	+','+'"legacy src appl code":"'+ISNULL(CONVERT(VARCHAR(255),[legacy_src_appl_code]),'null')+'"'
	+','+'"legacy group id":"'+ISNULL(CONVERT(VARCHAR(255),[legacy_group_id]),'null')+'"'
	+','+'"legacy subgrp id":"'+ISNULL(CONVERT(VARCHAR(255),[legacy_subgrp_id]),'null')+'"'
	+','+'"legacy subr id":"'+ISNULL(CONVERT(VARCHAR(255),[legacy_subr_id]),'null')+'"'
	+','+'"legacy dep no":"'+ISNULL(CONVERT(VARCHAR(255),[legacy_dep_no]),'null')+'"'
	+','+'"MJR_RISK_CLS_CODE":"'+ISNULL(CONVERT(VARCHAR(255),[MJR_RISK_CLS_CODE]),'null')+'"'
	+','+'"MJR_RISK_CLS_NAME":"'+ISNULL(CONVERT(VARCHAR(255),[MJR_RISK_CLS_NAME]),'null')+'"'
	+','+'"Patient Relationship Code":"'+ISNULL(CONVERT(VARCHAR(255),[Patient_Relationship_Code]),'null')+'"'
	+','+'"Patient Relationship Desc":"'+ISNULL(CONVERT(VARCHAR(255),[Patient_Relationship_Description]),'null')+'"'
	+'}'
	,'"null"','null') as AdditionalDataJSON
	FROM BeneficiaryAdditionalData ) AS B ON A.BeneficiaryID = B.BeneficiaryID WHERE A.ClientId = 3 --Excellus





	UPDATE A Set AdditionalDataJSON = B.AdditionalDataJSON FROM [Provider] A INNER JOIN (
	SELECT Providerid, REPLACE('{'+
	'"File Type":"'+ISNULL(CONVERT(VARCHAR(255),[File_Type]),'null')+'"'
	+','+'"Filler 1":"'+ISNULL(CONVERT(VARCHAR(255),[Filler_1]),'null')+'"'
	+','+'"Filler 2":"'+ISNULL(CONVERT(VARCHAR(255),[Filler_2]),'null')+'"'
	+','+'"Address 3":"'+ISNULL(CONVERT(VARCHAR(255),[Address_3]),'null')+'"'
	+','+'"Insurance Company Unique ID":"'+ISNULL(CONVERT(VARCHAR(255),[Insurance_Company_Unique_ID]),'null')+'"'
	+','+'"Specialty Code":"'+ISNULL(CONVERT(VARCHAR(255),[Specialty_Code]),'null')+'"'
	+','+'"Specialty Description":"'+ISNULL(CONVERT(VARCHAR(255),[Specialty_Description]),'null')+'"'
	+','+'"SRC_APPL_CODE":"'+ISNULL(CONVERT(VARCHAR(255),[SRC_APPL_CODE]),'null')+'"'
	+','+'"PROV_ENTITY_CODE":"'+ISNULL(CONVERT(VARCHAR(255),[PROV_ENTITY_CODE]),'null')+'"'
	+','+'"PROV_ENTITY_DESCRIPTION":"'+ISNULL(CONVERT(VARCHAR(255),[PROV_ENTITY_DESCRIPTION]),'null')+'"'
	+','+'"PROV_TYPE_DESCRIPTION":"'+ISNULL(CONVERT(VARCHAR(255),[PROV_TYPE_DESCRIPTION]),'null')+'"'
	+','+'"PROV_NYS_SPECIALTY_CODE":"'+ISNULL(CONVERT(VARCHAR(255),[PROV_NYS_SPECIALTY_CODE]),'null')+'"'
	+','+'"PROV_NYS_SPECIALTY_DESCRIPTION":"'+ISNULL(CONVERT(VARCHAR(255),[PROV_NYS_SPECIALTY_DESCRIPTION]),'null')+'"'
	+'}'
	,'"null"','null') as AdditionalDataJSON
	FROM ProviderAdditionalData ) AS B ON A.ProviderID = B.ProviderID WHERE A.ClientId = 3 --Excellus

	END

;