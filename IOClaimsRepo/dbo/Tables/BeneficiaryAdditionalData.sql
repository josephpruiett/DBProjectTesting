﻿CREATE TABLE [dbo].[BeneficiaryAdditionalData] (
    [BeneficiaryId]                    INT                                   NOT NULL,
    [ClientID]                         INT                                   NOT NULL,
    [AdditionalData_Columnset]         XML COLUMN_SET FOR ALL_SPARSE_COLUMNS,
    [File_Type]                        VARCHAR (1) SPARSE                    NULL,
    [Suffix]                           VARCHAR (3) SPARSE                    NULL,
    [Social_Security_Number]           VARCHAR (9) SPARSE                    NULL,
    [Dependent_Number]                 VARCHAR (3) SPARSE                    NULL,
    [Contract_holders_ID]              VARCHAR (30) SPARSE                   NULL,
    [Address_Line_3]                   VARCHAR (100) SPARSE                  NULL,
    [Insurance_Company_Unique_ID]      VARCHAR (7) SPARSE                    NULL,
    [Member_group_number]              VARCHAR (8) SPARSE                    NULL,
    [Member_sub_group]                 VARCHAR (8) SPARSE                    NULL,
    [Member_group_name]                VARCHAR (75) SPARSE                   NULL,
    [Funding_Arrangment]               VARCHAR (255) SPARSE                  NULL,
    [Member_line_of_business]          VARCHAR (75) SPARSE                   NULL,
    [Member_Effective_Date]            DATETIME SPARSE                       NULL,
    [Member_Termination_Date]          DATETIME SPARSE                       NULL,
    [Subscriber_First_Name]            VARCHAR (75) SPARSE                   NULL,
    [Subscriber_Middle_Initial]        VARCHAR (1) SPARSE                    NULL,
    [Subscriber_Last_Name]             VARCHAR (75) SPARSE                   NULL,
    [Subscriber_Date_of_Birth]         DATETIME SPARSE                       NULL,
    [Subscriber_Gender]                VARCHAR (20) SPARSE                   NULL,
    [Subscriber_SSN]                   VARCHAR (9) SPARSE                    NULL,
    [Subscriber_Number]                VARCHAR (32) SPARSE                   NULL,
    [Rating_Region]                    VARCHAR (75) SPARSE                   NULL,
    [COB_primary]                      VARCHAR (50) SPARSE                   NULL,
    [COB_PrimaryType]                  VARCHAR (100) SPARSE                  NULL,
    [COB_suspect]                      VARCHAR (50) SPARSE                   NULL,
    [COB_SecondaryType]                VARCHAR (100) SPARSE                  NULL,
    [Mem_Cobra_Indicator]              VARCHAR (5) SPARSE                    NULL,
    [Mem_Medicare_Number]              VARCHAR (12) SPARSE                   NULL,
    [mem_medicaid_number]              VARCHAR (8) SPARSE                    NULL,
    [Mem_Retirement_Ind]               VARCHAR (7) SPARSE                    NULL,
    [src_appl_code]                    VARCHAR (20) SPARSE                   NULL,
    [legacy_src_appl_code]             VARCHAR (10) SPARSE                   NULL,
    [legacy_group_id]                  VARCHAR (12) SPARSE                   NULL,
    [legacy_subgrp_id]                 VARCHAR (12) SPARSE                   NULL,
    [legacy_subr_id]                   VARCHAR (20) SPARSE                   NULL,
    [legacy_dep_no]                    VARCHAR (3) SPARSE                    NULL,
    [MJR_RISK_CLS_CODE]                VARCHAR (12) SPARSE                   NULL,
    [MJR_RISK_CLS_NAME]                VARCHAR (100) SPARSE                  NULL,
    [Patient_Relationship_Code]        VARCHAR (20) SPARSE                   NULL,
    [Patient_Relationship_Description] VARCHAR (75) SPARSE                   NULL,
    [PATIENT_NUM]                      VARCHAR (50) SPARSE                   NULL,
    [PATIENT_SEQ_NBR]                  VARCHAR (2) SPARSE                    NULL,
    [SECURITY_CODE]                    VARCHAR (10) SPARSE                   NULL,
    [PATIENT_RELATION]                 VARCHAR (20) SPARSE                   NULL,
    [PATIENT_SSN]                      VARCHAR (9) SPARSE                    NULL,
    [PATIENT_COUNTY]                   VARCHAR (50) SPARSE                   NULL,
    [PATIENT_COUNTRY]                  VARCHAR (50) SPARSE                   NULL,
    [PATIENT_DOD]                      DATETIME SPARSE                       NULL,
    [INSURED_ELIG_EXP_DT]              VARCHAR (25) SPARSE                   NULL,
    [INSURED_ELIG_COV_TYPE]            VARCHAR (6) SPARSE                    NULL,
    [INSURED_ELIG_STATUS]              VARCHAR (4) SPARSE                    NULL,
    [PRIMARY_MEMBER_KEY]               VARCHAR (50) SPARSE                   NULL,
    [PRIMARY_INS_SSN]                  VARCHAR (9) SPARSE                    NULL,
    [PRIMARY_INS_NUM]                  VARCHAR (50) SPARSE                   NULL,
    [PRIMARY_INS_POLICY_NUMBER]        VARCHAR (50) SPARSE                   NULL,
    [PRIMARY_INS_GROUP_NUM]            VARCHAR (15) SPARSE                   NULL,
    [PRIMARY_INS_DIVISION_NUM]         VARCHAR (11) SPARSE                   NULL,
    [LATEST_UPDATE_DATE]               VARCHAR (25) SPARSE                   NULL,
    [PAT_USER_DEF_01_SourceIdentifier] VARCHAR (50) SPARSE                   NULL,
    [PAT_USER_DEF_02]                  VARCHAR (50) SPARSE                   NULL,
    [PAT_USER_DEF_03]                  VARCHAR (50) SPARSE                   NULL,
    [PAT_USER_DEF_04]                  VARCHAR (50) SPARSE                   NULL,
    [PAT_USER_DEF_05]                  VARCHAR (50) SPARSE                   NULL,
    [PAT_USER_DEF_06]                  VARCHAR (50) SPARSE                   NULL,
    [PAT_USER_DEF_07]                  VARCHAR (50) SPARSE                   NULL,
    [PAT_USER_DEF_08]                  VARCHAR (50) SPARSE                   NULL,
    [PAT_USER_DEF_09]                  VARCHAR (50) SPARSE                   NULL,
    [PAT_USER_DEF_10]                  VARCHAR (50) SPARSE                   NULL,
    [GROUP_ID]                         VARCHAR (8) SPARSE                    NULL,
    [GROUP_NAME]                       VARCHAR (50) SPARSE                   NULL,
    [SUB_GROUP_ID]                     VARCHAR (4) SPARSE                    NULL,
    [SUB_GROUP_NAME]                   VARCHAR (50) SPARSE                   NULL,
    [CLIENT_ID]                        VARCHAR (2) SPARSE                    NULL,
    [GRP_USER_DEF_1]                   VARCHAR (20) SPARSE                   NULL,
    [GRP_USER_DEF_2]                   VARCHAR (20) SPARSE                   NULL,
    [GRP_USER_DEF_3]                   VARCHAR (20) SPARSE                   NULL,
    [GRP_USER_DEF_4]                   VARCHAR (20) SPARSE                   NULL,
    [GRP_FILLER]                       VARCHAR (255) SPARSE                  NULL,
    [SUBSCRIBER_ID]                    VARCHAR (9) SPARSE                    NULL,
    [COVERAGE_ID]                      VARCHAR (4) SPARSE                    NULL,
    [COVERAGE_PLAN_ID]                 VARCHAR (8) SPARSE                    NULL,
    [COVERAGE_TYPE]                    VARCHAR (1) SPARSE                    NULL,
    [COVERAGE_DESC]                    VARCHAR (70) SPARSE                   NULL,
    [SBC_USER_DEF_1]                   VARCHAR (20) SPARSE                   NULL,
    [SBC_USER_DEF_2]                   VARCHAR (20) SPARSE                   NULL,
    [SBC_USER_DEF_3]                   VARCHAR (20) SPARSE                   NULL,
    [SBC_USER_DEF_4]                   VARCHAR (20) SPARSE                   NULL,
    [SBC_FILLER]                       VARCHAR (255) SPARSE                  NULL,
    [MEMBER_ID]                        VARCHAR (11) SPARSE                   NULL,
    [SECONDARY_ID]                     VARCHAR (9) SPARSE                    NULL,
    [RELATIONSHIP_CODE]                VARCHAR (1) SPARSE                    NULL,
    [MEDICARE_ID]                      VARCHAR (12) SPARSE                   NULL,
    [MEDICAID_ID]                      VARCHAR (20) SPARSE                   NULL,
    [MEMBER_ORIG_EFFECTIVE_DATE]       DATETIME SPARSE                       NULL,
    [ADDRESS_3]                        VARCHAR (40) SPARSE                   NULL,
    [COUNTY]                           VARCHAR (20) SPARSE                   NULL,
    [COUNTY_CODE]                      VARCHAR (3) SPARSE                    NULL,
    [PHONE_1_EXT]                      VARCHAR (4) SPARSE                    NULL,
    [EMAIL]                            VARCHAR (40) SPARSE                   NULL,
    [PCP_ID]                           VARCHAR (12) SPARSE                   NULL,
    [PCP_NAME]                         VARCHAR (55) SPARSE                   NULL,
    [PCP_SPECIALTY]                    VARCHAR (4) SPARSE                    NULL,
    [PCP_STATUS]                       VARCHAR (2) SPARSE                    NULL,
    [PCP_ADDRESS_1]                    VARCHAR (40) SPARSE                   NULL,
    [PCP_ADDRESS_2]                    VARCHAR (40) SPARSE                   NULL,
    [PCP_ADDRESS_3]                    VARCHAR (40) SPARSE                   NULL,
    [PCP_CITY]                         VARCHAR (19) SPARSE                   NULL,
    [PCP_STATE]                        VARCHAR (2) SPARSE                    NULL,
    [PCP_POSTAL_CODE]                  VARCHAR (11) SPARSE                   NULL,
    [PCP_COUNTY]                       VARCHAR (20) SPARSE                   NULL,
    [PCP_PHONE_1]                      VARCHAR (20) SPARSE                   NULL,
    [PCP_PHONE_1_EXT]                  VARCHAR (4) SPARSE                    NULL,
    [PCP_FAX_1]                        VARCHAR (20) SPARSE                   NULL,
    [PCP_FAX_1_EXT]                    VARCHAR (4) SPARSE                    NULL,
    [MEM_USER_DEF_1]                   VARCHAR (20) SPARSE                   NULL,
    [MEM_USER_DEF_2]                   VARCHAR (20) SPARSE                   NULL,
    [MEM_USER_DEF_3]                   VARCHAR (20) SPARSE                   NULL,
    [MEM_USER_DEF_4]                   VARCHAR (20) SPARSE                   NULL,
    [MEM_FILLER]                       VARCHAR (255) SPARSE                  NULL
);


GO
CREATE UNIQUE CLUSTERED INDEX [UNQ_BeneficiaryAdditionalData]
    ON [dbo].[BeneficiaryAdditionalData]([BeneficiaryId] ASC);
