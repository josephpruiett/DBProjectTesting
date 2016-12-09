﻿CREATE TABLE [dbo].[ServiceLineAdditionalData] (
    [ServiceLineID]                          INT                                   NOT NULL,
    [ClientID]                               INT                                   NOT NULL,
    [AdditionalData_Columnset]               XML COLUMN_SET FOR ALL_SPARSE_COLUMNS,
    [File_Type]                              VARCHAR (2) SPARSE                    NULL,
    [Claim_Adjustment_Number]                VARCHAR (8) SPARSE                    NULL,
    [Drug_line]                              VARCHAR (1) SPARSE                    NULL,
    [CPT4_Procedure_code_Description]        VARCHAR (255) SPARSE                  NULL,
    [Insurance_Company_Unique_ID]            VARCHAR (7) SPARSE                    NULL,
    [Unique_ID]                              VARCHAR (20) SPARSE                   NULL,
    [Contract_holders_ID]                    VARCHAR (30) SPARSE                   NULL,
    [Dependent_Number]                       VARCHAR (3) SPARSE                    NULL,
    [Other_carrier_paid_amt]                 MONEY SPARSE                          NULL,
    [Claim_Member_Liability]                 MONEY SPARSE                          NULL,
    [Claim_Paid_Date]                        DATETIME SPARSE                       NULL,
    [Admitting_Diagnosis]                    VARCHAR (7) SPARSE                    NULL,
    [Additional_proc_code_1]                 VARCHAR (20) SPARSE                   NULL,
    [Additional_proc_code_2]                 VARCHAR (20) SPARSE                   NULL,
    [Additional_proc_code_3]                 VARCHAR (20) SPARSE                   NULL,
    [Additional_proc_code_4]                 VARCHAR (20) SPARSE                   NULL,
    [Additional_proc_code_5]                 VARCHAR (20) SPARSE                   NULL,
    [Place_of_Service_Desc]                  VARCHAR (255) SPARSE                  NULL,
    [Hosp_Med_Ind]                           VARCHAR (4) SPARSE                    NULL,
    [Home_Grown_Code]                        VARCHAR (9) SPARSE                    NULL,
    [Home_Grown_Code_Desc]                   VARCHAR (250) SPARSE                  NULL,
    [HCPCS_Code]                             VARCHAR (9) SPARSE                    NULL,
    [HCPCS_Desc]                             VARCHAR (200) SPARSE                  NULL,
    [Type_of_Service_Code]                   VARCHAR (4) SPARSE                    NULL,
    [Type_of_Service_Desc]                   VARCHAR (70) SPARSE                   NULL,
    [Par_Code]                               VARCHAR (1) SPARSE                    NULL,
    [Par_Desc]                               VARCHAR (75) SPARSE                   NULL,
    [Servicing_Provider_Tax_Id]              VARCHAR (18) SPARSE                   NULL,
    [Adjustment_Indicator]                   VARCHAR (70) SPARSE                   NULL,
    [Agreement_ID]                           VARCHAR (30) SPARSE                   NULL,
    [Authorization_Code]                     VARCHAR (18) SPARSE                   NULL,
    [CLHP_Birth_Wgt]                         DECIMAL (19, 2) SPARSE                NULL,
    [Frequency]                              VARCHAR (20) SPARSE                   NULL,
    [MEDICAL_RECNO]                          VARCHAR (17) SPARSE                   NULL,
    [Medicare_DRG_Code]                      VARCHAR (3) SPARSE                    NULL,
    [Mem_Cobra_Indicator]                    VARCHAR (1) SPARSE                    NULL,
    [Mem_Medicare_Number]                    VARCHAR (12) SPARSE                   NULL,
    [Mem_Phone]                              VARCHAR (30) SPARSE                   NULL,
    [Mem_Retirement_Ind]                     VARCHAR (1) SPARSE                    NULL,
    [Rule]                                   VARCHAR (4) SPARSE                    NULL,
    [Service_Pricing]                        VARCHAR (4) SPARSE                    NULL,
    [Unit_Days_Allowed]                      MONEY SPARSE                          NULL,
    [DSALW_CODE]                             VARCHAR (20) SPARSE                   NULL,
    [DSALW_CODE_DESC]                        VARCHAR (255) SPARSE                  NULL,
    [ADJ_EXPLN_CODE]                         VARCHAR (20) SPARSE                   NULL,
    [ADJ_EXPLN_CODE_DESC]                    VARCHAR (255) SPARSE                  NULL,
    [Network_Indicator_Par_Non_Par_System]   VARCHAR (75) SPARSE                   NULL,
    [Claim_Type]                             VARCHAR (75) SPARSE                   NULL,
    [Claim_Received_Date]                    DATETIME SPARSE                       NULL,
    [Payee_Code]                             VARCHAR (75) SPARSE                   NULL,
    [COB_NAME]                               VARCHAR (75) SPARSE                   NULL,
    [SRC_APPL_CODE]                          VARCHAR (20) SPARSE                   NULL,
    [SRC_APPL_ADJ_SQNC_NBR]                  VARCHAR (5) SPARSE                    NULL,
    [GRP_SGMNT_CODE]                         VARCHAR (4) SPARSE                    NULL,
    [GRP_SGMNT_CODE_DESC]                    VARCHAR (255) SPARSE                  NULL,
    [FAC_TYPE_CODE]                          VARCHAR (20) SPARSE                   NULL,
    [FAC_TYPE_CODE_NAME]                     VARCHAR (255) SPARSE                  NULL,
    [BSNS_SGMNT]                             VARCHAR (255) SPARSE                  NULL,
    [PROD_CAT_NAME]                          VARCHAR (255) SPARSE                  NULL,
    [DRG_SYS_ID]                             VARCHAR (20) SPARSE                   NULL,
    [SOI]                                    VARCHAR (4) SPARSE                    NULL,
    [ROM]                                    VARCHAR (4) SPARSE                    NULL,
    [ITS_Srvc_Prov_Name]                     VARCHAR (155) SPARSE                  NULL,
    [ITS_Srvc_Prov_NPI]                      VARCHAR (10) SPARSE                   NULL,
    [ITS_Srvc_Prov_Zip_Code]                 VARCHAR (15) SPARSE                   NULL,
    [ITS_Srvc_Prov_Specialty_Code]           VARCHAR (4) SPARSE                    NULL,
    [ITS_Srvc_Prov_Specialty_Desc]           VARCHAR (70) SPARSE                   NULL,
    [ITS_Srvc_Prov_Type_Code]                VARCHAR (4) SPARSE                    NULL,
    [ITS_Srvc_Prov_Type_Desc]                VARCHAR (70) SPARSE                   NULL,
    [ITS_Srvc_Prov_Host_Plan_Code]           VARCHAR (4) SPARSE                    NULL,
    [ITS_Srvc_Prov_Host_Plan_Name]           VARCHAR (70) SPARSE                   NULL,
    [ITS_Srvc_Prov_Host_Plan_ID]             VARCHAR (18) SPARSE                   NULL,
    [ITS_Bill_Prov_Tax_ID]                   VARCHAR (9) SPARSE                    NULL,
    [ITS_Bill_Prov_Name]                     VARCHAR (155) SPARSE                  NULL,
    [ITS_Bill_Prov_NPI]                      VARCHAR (10) SPARSE                   NULL,
    [ITS_Bill_Prov_Host_Plan_Code]           VARCHAR (4) SPARSE                    NULL,
    [ITS_Bill_Prov_Host_Plan_Name]           VARCHAR (70) SPARSE                   NULL,
    [ITS_Bill_Prov_Host_Plan_Id]             VARCHAR (18) SPARSE                   NULL,
    [ITS_Bill_Prov_Address_1]                VARCHAR (100) SPARSE                  NULL,
    [ITS_Bill_Prov_Address_2]                VARCHAR (100) SPARSE                  NULL,
    [ITS_Bill_Prov_City_Name]                VARCHAR (60) SPARSE                   NULL,
    [ITS_Bill_Prov_State_Code]               VARCHAR (4) SPARSE                    NULL,
    [ITS_Bill_Prov_Zip_Code]                 VARCHAR (15) SPARSE                   NULL,
    [class_of_risk]                          VARCHAR (20) SPARSE                   NULL,
    [risk_cat_name]                          VARCHAR (100) SPARSE                  NULL,
    [funding_arrangement]                    VARCHAR (255) SPARSE                  NULL,
    [Product_ID]                             VARCHAR (8) SPARSE                    NULL,
    [Product_Desc]                           VARCHAR (70) SPARSE                   NULL,
    [Payer_ID]                               VARCHAR (20) SPARSE                   NULL,
    [Payer_Name]                             VARCHAR (255) SPARSE                  NULL,
    [Patient_Relationship_Code]              VARCHAR (20) SPARSE                   NULL,
    [Patient_Relationship_Desc]              VARCHAR (255) SPARSE                  NULL,
    [Discharge_Status]                       VARCHAR (20) SPARSE                   NULL,
    [HCRA_Surcharge_Amount]                  MONEY SPARSE                          NULL,
    [Risk_Withhold_Amount]                   MONEY SPARSE                          NULL,
    [PlanID]                                 VARCHAR (8) SPARSE                    NULL,
    [PlanID_Name]                            VARCHAR (255) SPARSE                  NULL,
    [Business_Category_Code]                 VARCHAR (4) SPARSE                    NULL,
    [Business_Category_Description]          VARCHAR (255) SPARSE                  NULL,
    [Medicare_Facility_Number_BLNG_PROV]     VARCHAR (15) SPARSE                   NULL,
    [HCRA_BLNG_PROV]                         VARCHAR (4) SPARSE                    NULL,
    [Medicare_Facility_Number_SRVCNG_PROV]   VARCHAR (15) SPARSE                   NULL,
    [HCRA_SRVCNG_PROV]                       VARCHAR (4) SPARSE                    NULL,
    [Micro_Image_ID]                         VARCHAR (50) SPARSE                   NULL,
    [SCCF_Number]                            VARCHAR (17) SPARSE                   NULL,
    [Plan_Code]                              VARCHAR (4) SPARSE                    NULL,
    [Plan_Code_home]                         VARCHAR (20) SPARSE                   NULL,
    [Additional_proc_code_6]                 VARCHAR (20) SPARSE                   NULL,
    [Additional_proc_code_7]                 VARCHAR (20) SPARSE                   NULL,
    [Additional_proc_code_8]                 VARCHAR (20) SPARSE                   NULL,
    [Additional_proc_code_9]                 VARCHAR (20) SPARSE                   NULL,
    [Additional_proc_code_10]                VARCHAR (20) SPARSE                   NULL,
    [Additional_proc_code_11]                VARCHAR (20) SPARSE                   NULL,
    [Additional_proc_code_12]                VARCHAR (20) SPARSE                   NULL,
    [Additional_proc_code_13]                VARCHAR (20) SPARSE                   NULL,
    [Additional_proc_code_14]                VARCHAR (20) SPARSE                   NULL,
    [Additional_proc_code_15]                VARCHAR (20) SPARSE                   NULL,
    [Additional_proc_code_16]                VARCHAR (20) SPARSE                   NULL,
    [Additional_proc_code_17]                VARCHAR (20) SPARSE                   NULL,
    [Additional_proc_code_18]                VARCHAR (20) SPARSE                   NULL,
    [Additional_proc_code_19]                VARCHAR (20) SPARSE                   NULL,
    [Additional_proc_code_20]                VARCHAR (20) SPARSE                   NULL,
    [Additional_proc_code_21]                VARCHAR (20) SPARSE                   NULL,
    [Additional_proc_code_22]                VARCHAR (20) SPARSE                   NULL,
    [Additional_proc_code_23]                VARCHAR (20) SPARSE                   NULL,
    [Additional_proc_code_24]                VARCHAR (20) SPARSE                   NULL,
    [Additional_proc_code_25]                VARCHAR (20) SPARSE                   NULL,
    [PTNT_ACNT_NBR]                          VARCHAR (35) SPARSE                   NULL,
    [TRANSACTION_ID]                         VARCHAR (50) SPARSE                   NULL,
    [RENDERING_PROVIDER_KEY]                 VARCHAR (50) SPARSE                   NULL,
    [PATIENT_KEY]                            VARCHAR (50) SPARSE                   NULL,
    [MED_REC_NUM]                            VARCHAR (50) SPARSE                   NULL,
    [PATIENT_ACCT_NUM]                       VARCHAR (38) SPARSE                   NULL,
    [PCP_PROVIDER_KEY]                       VARCHAR (50) SPARSE                   NULL,
    [BILLING_PROVIDER_KEY]                   VARCHAR (50) SPARSE                   NULL,
    [REFERRING_PROVIDER_KEY]                 VARCHAR (50) SPARSE                   NULL,
    [PRIMARY_INSURED_KEY]                    VARCHAR (50) SPARSE                   NULL,
    [FACILITY_NPI]                           VARCHAR (10) SPARSE                   NULL,
    [COMPANY_ID]                             VARCHAR (9) SPARSE                    NULL,
    [SECURITY_CODE]                          VARCHAR (2) SPARSE                    NULL,
    [CLAIM_NUM]                              VARCHAR (55) SPARSE                   NULL,
    [CLAIM_LINE_NUM]                         VARCHAR (10) SPARSE                   NULL,
    [PATIENT_STATUS]                         VARCHAR (50) SPARSE                   NULL,
    [CLAIM_STATUS]                           VARCHAR (20) SPARSE                   NULL,
    [TRANSACTION_TYPE]                       VARCHAR (1) SPARSE                    NULL,
    [ADJUSTMENT_CD]                          VARCHAR (5) SPARSE                    NULL,
    [ADJUSTMENT_NUM]                         VARCHAR (2) SPARSE                    NULL,
    [REJ_REASON_1]                           VARCHAR (5) SPARSE                    NULL,
    [REJ_REASON_2]                           VARCHAR (5) SPARSE                    NULL,
    [REJ_REASON_3]                           VARCHAR (5) SPARSE                    NULL,
    [REJ_REASON_4]                           VARCHAR (5) SPARSE                    NULL,
    [REJ_REASON_5]                           VARCHAR (5) SPARSE                    NULL,
    [REJ_REASON_6]                           VARCHAR (5) SPARSE                    NULL,
    [AUTH_CODE]                              VARCHAR (9) SPARSE                    NULL,
    [TYPE_OF_PLAN]                           VARCHAR (50) SPARSE                   NULL,
    [LINE_OF_BUSINESS]                       VARCHAR (50) SPARSE                   NULL,
    [BENEFIT_PLAN]                           VARCHAR (20) SPARSE                   NULL,
    [TYPE_OF_BILL]                           VARCHAR (4) SPARSE                    NULL,
    [CHECK_NUM]                              VARCHAR (50) SPARSE                   NULL,
    [CHECK_DT]                               DATETIME SPARSE                       NULL,
    [PROCESSED_DT]                           DATETIME SPARSE                       NULL,
    [DT_TM_STAMP]                            VARCHAR (25) SPARSE                   NULL,
    [SERVICE_FROM_DT]                        DATETIME SPARSE                       NULL,
    [SERVICE_TO_DT]                          DATETIME SPARSE                       NULL,
    [SERVICE_DT]                             DATETIME SPARSE                       NULL,
    [ADMIT_DT]                               DATETIME SPARSE                       NULL,
    [DISCH_DT]                               DATETIME SPARSE                       NULL,
    [RECEIVED_DT]                            DATETIME SPARSE                       NULL,
    [ACCIDENT_DT]                            DATETIME SPARSE                       NULL,
    [ACCIDENT_TYPE]                          VARCHAR (255) SPARSE                  NULL,
    [PLACE_OF_SERVICE]                       VARCHAR (2) SPARSE                    NULL,
    [TYPE_OF_SERVICE]                        VARCHAR (10) SPARSE                   NULL,
    [UNIT_OF_SERV_TYPE]                      VARCHAR (20) SPARSE                   NULL,
    [UNITS_OF_SERVICE]                       VARCHAR (12) SPARSE                   NULL,
    [UNITS_OF_SERVICE_ALLOWED]               VARCHAR (12) SPARSE                   NULL,
    [CPT_HCPCS_PROC_CD]                      VARCHAR (12) SPARSE                   NULL,
    [CPT_HCPCS_PROC_CD_MODIFIER_1]           VARCHAR (2) SPARSE                    NULL,
    [CPT_HCPCS_PROC_CD_MODIFIER_2]           VARCHAR (2) SPARSE                    NULL,
    [CPT_HCPCS_PROC_CD_MODIFIER_3]           VARCHAR (2) SPARSE                    NULL,
    [CPT_HCPCS_PROC_CD_MODIFIER_4]           VARCHAR (2) SPARSE                    NULL,
    [PAYMENT_TYPE]                           VARCHAR (10) SPARSE                   NULL,
    [DRG_SOURCE]                             VARCHAR (4) SPARSE                    NULL,
    [DRGVersion]                             VARCHAR (4) SPARSE                    NULL,
    [DIAG_REL_GROUP]                         VARCHAR (10) SPARSE                   NULL,
    [DIAG_REL_GROUP_2]                       VARCHAR (10) SPARSE                   NULL,
    [DRGPricing]                             MONEY SPARSE                          NULL,
    [OUTLIER_CD]                             VARCHAR (2) SPARSE                    NULL,
    [ICD_VERSION]                            VARCHAR (2) SPARSE                    NULL,
    [PRN_DIAG_CD]                            VARCHAR (10) SPARSE                   NULL,
    [ADM_DIAG_CD]                            VARCHAR (10) SPARSE                   NULL,
    [VISIT_REASN_DIAG_CD]                    VARCHAR (10) SPARSE                   NULL,
    [DIAG_CD1]                               VARCHAR (10) SPARSE                   NULL,
    [DIAG_CD2]                               VARCHAR (10) SPARSE                   NULL,
    [DIAG_CD3]                               VARCHAR (10) SPARSE                   NULL,
    [DIAG_CD4]                               VARCHAR (10) SPARSE                   NULL,
    [DIAG_CD5]                               VARCHAR (10) SPARSE                   NULL,
    [DIAG_CD6]                               VARCHAR (10) SPARSE                   NULL,
    [DIAG_CD7]                               VARCHAR (10) SPARSE                   NULL,
    [DIAG_CD8]                               VARCHAR (10) SPARSE                   NULL,
    [DIAG_CD9]                               VARCHAR (10) SPARSE                   NULL,
    [DIAG_CD10]                              VARCHAR (10) SPARSE                   NULL,
    [DIAG_CD11]                              VARCHAR (10) SPARSE                   NULL,
    [DIAG_CD12]                              VARCHAR (10) SPARSE                   NULL,
    [PRN_ICD_CD]                             VARCHAR (12) SPARSE                   NULL,
    [ICD_PROC_CD_1]                          VARCHAR (12) SPARSE                   NULL,
    [ICD_PROC_CD_2]                          VARCHAR (12) SPARSE                   NULL,
    [ICD_PROC_CD_3]                          VARCHAR (12) SPARSE                   NULL,
    [ICD_PROC_CD_4]                          VARCHAR (12) SPARSE                   NULL,
    [ICD_PROC_CD_5]                          VARCHAR (12) SPARSE                   NULL,
    [NDC_CD_1]                               VARCHAR (50) SPARSE                   NULL,
    [NDC_CD_1_QTY]                           MONEY SPARSE                          NULL,
    [NDC_CD_1_UOM]                           VARCHAR (50) SPARSE                   NULL,
    [NDC_CD_2]                               VARCHAR (50) SPARSE                   NULL,
    [NDC_CD_2_QTY]                           MONEY SPARSE                          NULL,
    [NDC_CD_2_UOM]                           VARCHAR (50) SPARSE                   NULL,
    [NDC_CD_3]                               VARCHAR (50) SPARSE                   NULL,
    [NDC_CD_3_QTY]                           MONEY SPARSE                          NULL,
    [NDC_CD_3_UOM]                           VARCHAR (50) SPARSE                   NULL,
    [NDC_CD_4]                               VARCHAR (50) SPARSE                   NULL,
    [NDC_CD_4_QTY]                           MONEY SPARSE                          NULL,
    [NDC_CD_4_UOM]                           VARCHAR (50) SPARSE                   NULL,
    [NDC_CD_5]                               VARCHAR (50) SPARSE                   NULL,
    [NDC_CD_5_QTY]                           MONEY SPARSE                          NULL,
    [NDC_CD_5_UOM]                           VARCHAR (50) SPARSE                   NULL,
    [NDC_CD_6]                               VARCHAR (50) SPARSE                   NULL,
    [NDC_CD_6_QTY]                           MONEY SPARSE                          NULL,
    [NDC_CD_6_UOM]                           VARCHAR (50) SPARSE                   NULL,
    [NDC_CD_7]                               VARCHAR (50) SPARSE                   NULL,
    [NDC_CD_7_QTY]                           MONEY SPARSE                          NULL,
    [NDC_CD_7_UOM]                           VARCHAR (50) SPARSE                   NULL,
    [NDC_CD_8]                               VARCHAR (50) SPARSE                   NULL,
    [NDC_CD_8_QTY]                           MONEY SPARSE                          NULL,
    [NDC_CD_8_UOM]                           VARCHAR (50) SPARSE                   NULL,
    [NDC_CD_9]                               VARCHAR (50) SPARSE                   NULL,
    [NDC_CD_9_QTY]                           MONEY SPARSE                          NULL,
    [NDC_CD_9_UOM]                           VARCHAR (50) SPARSE                   NULL,
    [NDC_CD_10]                              VARCHAR (50) SPARSE                   NULL,
    [NDC_CD_10_QTY]                          MONEY SPARSE                          NULL,
    [NDC_CD_10_UOM]                          VARCHAR (50) SPARSE                   NULL,
    [REVENUE_CD]                             VARCHAR (10) SPARSE                   NULL,
    [NETWORK_IND]                            VARCHAR (1) SPARSE                    NULL,
    [PROV_MEDICARE_PAR_IND]                  VARCHAR (1) SPARSE                    NULL,
    [MAX_POCKET_OUT_MET_INDV]                VARCHAR (1) SPARSE                    NULL,
    [MAX_POCKET_OUT_MET_FAMILY]              VARCHAR (1) SPARSE                    NULL,
    [DEDUCTIBLE_MET_INDV]                    VARCHAR (1) SPARSE                    NULL,
    [DEDUCTIBLE_MET_FAMILY]                  VARCHAR (1) SPARSE                    NULL,
    [PRICE_IND]                              VARCHAR (1) SPARSE                    NULL,
    [CHARGE_AMT]                             MONEY SPARSE                          NULL,
    [RC_AMT]                                 MONEY SPARSE                          NULL,
    [DEDUCT_AMT]                             MONEY SPARSE                          NULL,
    [PAID_AMT]                               MONEY SPARSE                          NULL,
    [COPAY_AMT]                              MONEY SPARSE                          NULL,
    [COB_AMT]                                MONEY SPARSE                          NULL,
    [CO_INS_AMT]                             MONEY SPARSE                          NULL,
    [MED_USER_DEF_01_DCN]                    VARCHAR (50) SPARSE                   NULL,
    [MED_USER_DEF_02_Billed_DRG]             VARCHAR (50) SPARSE                   NULL,
    [MED_USER_DEF_03_NON_COVERED_AMT]        VARCHAR (50) SPARSE                   NULL,
    [MED_USER_DEF_04_PDDS_MCTR_BCAT]         VARCHAR (50) SPARSE                   NULL,
    [MED_USER_DEF_05_ITS_SCCF_NO]            VARCHAR (50) SPARSE                   NULL,
    [MED_USER_DEF_06_ADJUSTMENT_FROM]        VARCHAR (50) SPARSE                   NULL,
    [MED_USER_DEF_07_Procedure_Code_Type]    VARCHAR (50) SPARSE                   NULL,
    [MED_USER_DEF_08_Discharge_Status]       VARCHAR (50) SPARSE                   NULL,
    [MED_USER_DEF_09_Fixed_Price]            VARCHAR (50) SPARSE                   NULL,
    [MED_USER_DEF_10_Admission_Type]         VARCHAR (50) SPARSE                   NULL,
    [MED_USER_DEF_11_E_DIAG_CD1]             VARCHAR (50) SPARSE                   NULL,
    [MED_USER_DEF_12_E_DIAG_CD2]             VARCHAR (50) SPARSE                   NULL,
    [MED_USER_DEF_13_E_DIAG_CD3]             VARCHAR (50) SPARSE                   NULL,
    [MED_USER_DEF_14_E_DIAG_CD4]             VARCHAR (50) SPARSE                   NULL,
    [MED_USER_DEF_15_E_DIAG_CD5]             VARCHAR (50) SPARSE                   NULL,
    [MED_USER_DEF_16_E_DIAG_CD6]             VARCHAR (50) SPARSE                   NULL,
    [MED_USER_DEF_17_Group_Name]             VARCHAR (50) SPARSE                   NULL,
    [MED_USER_DEF_18_Group_ID]               VARCHAR (50) SPARSE                   NULL,
    [MED_USER_DEF_19_COB_Ind]                VARCHAR (50) SPARSE                   NULL,
    [MED_USER_DEF_20_PDDS_MCTR_VAL1_Funding] VARCHAR (50) SPARSE                   NULL,
    [MED_USER_DEF_21_Native_ClaimID]         VARCHAR (50) SPARSE                   NULL,
    [MED_USER_DEF_22]                        VARCHAR (255) SPARSE                  NULL,
    [MED_USER_DEF_23]                        VARCHAR (255) SPARSE                  NULL,
    [GROUP_ID]                               VARCHAR (8) SPARSE                    NULL,
    [SUB_GROUP_ID]                           VARCHAR (4) SPARSE                    NULL,
    [GRP_USER_DEF_1]                         VARCHAR (20) SPARSE                   NULL,
    [GRP_USER_DEF_2]                         VARCHAR (20) SPARSE                   NULL,
    [GRP_USER_DEF_3]                         VARCHAR (20) SPARSE                   NULL,
    [GRP_USER_DEF_4]                         VARCHAR (20) SPARSE                   NULL,
    [GRP_FILLER]                             VARCHAR (255) SPARSE                  NULL,
    [MEMBER_ID]                              VARCHAR (11) SPARSE                   NULL,
    [FIRST_NAME]                             VARCHAR (15) SPARSE                   NULL,
    [MIDDLE_INITIAL]                         VARCHAR (1) SPARSE                    NULL,
    [LAST_NAME]                              VARCHAR (35) SPARSE                   NULL,
    [DATE_OF_BIRTH]                          DATETIME SPARSE                       NULL,
    [GENDER_CODE]                            VARCHAR (1) SPARSE                    NULL,
    [RELATIONSHIP_CODE]                      VARCHAR (1) SPARSE                    NULL,
    [MEM_USER_DEF_1]                         VARCHAR (20) SPARSE                   NULL,
    [MEM_USER_DEF_2]                         VARCHAR (20) SPARSE                   NULL,
    [MEM_USER_DEF_3]                         VARCHAR (20) SPARSE                   NULL,
    [MEM_USER_DEF_4]                         VARCHAR (20) SPARSE                   NULL,
    [MEM_FILLER]                             VARCHAR (255) SPARSE                  NULL,
    [CLAIM_ID]                               VARCHAR (12) SPARSE                   NULL,
    [CLAIM_LINE_NUMBER]                      VARCHAR (5) SPARSE                    NULL,
    [CLAIM_PROCESS_DATE]                     DATETIME SPARSE                       NULL,
    [CLAIM_CURRENT_STATUS]                   VARCHAR (2) SPARSE                    NULL,
    [CLAIMS_EXPLANATION_CODE]                VARCHAR (3) SPARSE                    NULL,
    [SERVICING_PROVIDER]                     VARCHAR (12) SPARSE                   NULL,
    [SERVICING_PROVIDER_TYPE]                VARCHAR (4) SPARSE                    NULL,
    [SERVICING_PROVIDER_SPECIALTY]           VARCHAR (4) SPARSE                    NULL,
    [SERVICE_DATE_FROM]                      DATETIME SPARSE                       NULL,
    [SERVICE_DATE_TO]                        DATETIME SPARSE                       NULL,
    [SERVICE_LOCATION_ID]                    VARCHAR (2) SPARSE                    NULL,
    [SERVICE_TYPE]                           VARCHAR (4) SPARSE                    NULL,
    [UNITS]                                  VARCHAR (5) SPARSE                    NULL,
    [ADJUSTMENT_CODE_OR_INDICATOR]           VARCHAR (1) SPARSE                    NULL,
    [ORIGINAL_CLAIM_ID]                      VARCHAR (12) SPARSE                   NULL,
    [ORIGINAL_CLAIM_LINE_NUMBER]             VARCHAR (5) SPARSE                    NULL,
    [INPATIENT_OUTPATIENT_IND]               VARCHAR (1) SPARSE                    NULL,
    [NETWORK_INDICATOR]                      VARCHAR (1) SPARSE                    NULL,
    [CPT_PROCEDURE_CODE]                     VARCHAR (7) SPARSE                    NULL,
    [CPT_PROCEDURE_CODE_MOD]                 VARCHAR (2) SPARSE                    NULL,
    [ICD_DIAGNOSIS_CODE_1]                   VARCHAR (10) SPARSE                   NULL,
    [ICD_DIAGNOSIS_CODE_2]                   VARCHAR (10) SPARSE                   NULL,
    [ICD_DIAGNOSIS_CODE_3]                   VARCHAR (10) SPARSE                   NULL,
    [ICD_DIAGNOSIS_CODE_4]                   VARCHAR (10) SPARSE                   NULL,
    [ICD_DIAGNOSIS_CODE_5]                   VARCHAR (10) SPARSE                   NULL,
    [ICD_DIAGNOSIS_CODE_6]                   VARCHAR (10) SPARSE                   NULL,
    [ICD_PROCEDURE_CODE_1]                   VARCHAR (7) SPARSE                    NULL,
    [ICD_PROCEDURE_CODE_2]                   VARCHAR (7) SPARSE                    NULL,
    [ICD_PROCEDURE_CODE_3]                   VARCHAR (7) SPARSE                    NULL,
    [ICD_PROCEDURE_CODE_4]                   VARCHAR (7) SPARSE                    NULL,
    [ICD_PROCEDURE_CODE_5]                   VARCHAR (7) SPARSE                    NULL,
    [DRG_CODE]                               VARCHAR (20) SPARSE                   NULL,
    [COPAY_AMOUNT]                           MONEY SPARSE                          NULL,
    [COINS_AMOUNT]                           MONEY SPARSE                          NULL,
    [CHARGE_AMOUNT]                          MONEY SPARSE                          NULL,
    [COB_AMOUNT]                             MONEY SPARSE                          NULL,
    [PAID_AMOUNT]                            MONEY SPARSE                          NULL,
    [DEDUCTIBLE_AMOUNT]                      MONEY SPARSE                          NULL,
    [ALLOWED_AMOUNT]                         MONEY SPARSE                          NULL,
    [ITS_ACCESS_FEE]                         MONEY SPARSE                          NULL,
    [PAID_DATE]                              DATETIME SPARSE                       NULL,
    [REVENUE_CODE]                           VARCHAR (4) SPARSE                    NULL,
    [PAYEE_TYPE_CODE]                        VARCHAR (5) SPARSE                    NULL,
    [BILLED_DRG]                             VARCHAR (4) SPARSE                    NULL,
    [ADMISSION_DATE]                         DATETIME SPARSE                       NULL,
    [ADMISSION_HOUR]                         VARCHAR (2) SPARSE                    NULL,
    [DISCHARGE_DATE]                         DATETIME SPARSE                       NULL,
    [DISCHARGE_HOUR]                         VARCHAR (2) SPARSE                    NULL,
    [MEDICAL_RECORD_NO]                      VARCHAR (17) SPARSE                   NULL,
    [PATIENT_ACCOUNT_NO]                     VARCHAR (35) SPARSE                   NULL,
    [ADMISSION_TYPE]                         VARCHAR (255) SPARSE                  NULL,
    [ADMISSION_SOURCE]                       VARCHAR (1) SPARSE                    NULL,
    [FACILITY_TYPE]                          VARCHAR (2) SPARSE                    NULL,
    [BILL_CLASS]                             VARCHAR (1) SPARSE                    NULL,
    [LOB]                                    VARCHAR (4) SPARSE                    NULL,
    [PRE_AUTH_ID]                            VARCHAR (9) SPARSE                    NULL,
    [PRODUCT_TYPE]                           VARCHAR (1) SPARSE                    NULL,
    [BIRTH_WEIGHT]                           INT SPARSE                            NULL,
    [EXCLUSION_REASON]                       VARCHAR (25) SPARSE                   NULL,
    [ICD_DIAG_IND]                           VARCHAR (5) SPARSE                    NULL,
    [REIMBURSEMENT_METHOD]                   VARCHAR (20) SPARSE                   NULL,
    [RISK_IND]                               VARCHAR (3) SPARSE                    NULL,
    [COB_FLAG_1]                             VARCHAR (6) SPARSE                    NULL,
    [COB_SAVINGS]                            MONEY SPARSE                          NULL,
    [MCARE_DISABILITY]                       VARCHAR (1) SPARSE                    NULL,
    [ESRD_IND]                               VARCHAR (1) SPARSE                    NULL,
    [EXCLUDED_AMOUNT_LINE]                   MONEY SPARSE                          NULL,
    [EXCLUSION_REASON_LINE]                  VARCHAR (25) SPARSE                   NULL,
    [PROCEDURE_UNITS]                        VARCHAR (5) SPARSE                    NULL,
    [ICD_PROC_IND]                           VARCHAR (6) SPARSE                    NULL,
    [PROC_CODE_DATE]                         DATETIME SPARSE                       NULL,
    [SERVICING_PROVIDER_TIN]                 VARCHAR (9) SPARSE                    NULL,
    [SERVICING_NPI]                          VARCHAR (10) SPARSE                   NULL,
    [MDCLAIM_USER_DEF_1]                     VARCHAR (250) SPARSE                  NULL,
    [MDCLAIM_USER_DEF_2]                     VARCHAR (250) SPARSE                  NULL,
    [MDCLAIM_USER_DEF_3]                     VARCHAR (250) SPARSE                  NULL,
    [MDCLAIM_USER_DEF_4]                     VARCHAR (250) SPARSE                  NULL,
    [MDCLAIM_USER_DEF_5]                     VARCHAR (250) SPARSE                  NULL,
    [MDCLAIM_FILLER]                         VARCHAR (100) SPARSE                  NULL
);


GO
CREATE UNIQUE CLUSTERED INDEX [UNQ_ServiceLineAdditionalData]
    ON [dbo].[ServiceLineAdditionalData]([ServiceLineID] ASC);

