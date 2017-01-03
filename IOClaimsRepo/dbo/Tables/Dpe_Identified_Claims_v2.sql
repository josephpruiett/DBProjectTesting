﻿CREATE TABLE [dbo].[Dpe_Identified_Claims_v2] (
    [CLAIM_KEY]              VARCHAR (12)   NULL,
    [CLAIM_LINE]             SMALLINT       NULL,
    [DRG]                    VARCHAR (MAX)  NULL,
    [PROVIDER_NO]            VARCHAR (12)   NULL,
    [PROVIDER_NPI]           INT            NULL,
    [PROVIDER_TAXID]         INT            NULL,
    [PROVIDER_STATE]         VARCHAR (2)    NULL,
    [PROVIDER_ZIP]           INT            NULL,
    [CLIENT_WKLD]            VARCHAR (MAX)  NULL,
    [CLAIM_NO]               VARCHAR (10)   NULL,
    [FDOS]                   DATETIME       NULL,
    [LDOS]                   DATETIME       NULL,
    [ADR_DT]                 VARCHAR (MAX)  NULL,
    [IFL_DT]                 DATETIME       NULL,
    [PROCESS_DATE]           DATETIME       NULL,
    [ISSUE_LEVEL]            VARCHAR (1)    NULL,
    [CLIENT_ISSUE]           VARCHAR (10)   NULL,
    [DCS_ISSUE]              INT            NULL,
    [CLAIM_TYPE]             VARCHAR (4)    NULL,
    [REVIEW_TYPE]            VARCHAR (4)    NULL,
    [AUDIT_TYPE]             VARCHAR (3)    NULL,
    [ISSUE_CATEGORY]         VARCHAR (5)    NULL,
    [STATUS]                 VARCHAR (4)    NULL,
    [STATUS_COMMENT]         VARCHAR (MAX)  NULL,
    [SOURCE]                 VARCHAR (3)    NULL,
    [ADR_LIMIT]              SMALLINT       NULL,
    [CAMPUS_ID]              VARCHAR (12)   NULL,
    [CLAIM_PAID]             REAL           NULL,
    [PATIENT_ID]             VARCHAR (25)   NULL,
    [EXCLUDED]               VARCHAR (MAX)  NULL,
    [EXCL_REASON]            VARCHAR (MAX)  NULL,
    [INSERT_DT]              DATETIME       NULL,
    [UPDATE_DT]              VARCHAR (MAX)  NULL,
    [USERID]                 VARCHAR (9)    NULL,
    [VERSION]                VARCHAR (MAX)  NULL,
    [HCPCS]                  VARCHAR (5)    NULL,
    [BILL_TYPE_POS]          VARCHAR (MAX)  NULL,
    [RECOMM_HCPCS_MOD1]      VARCHAR (2)    NULL,
    [RECOMM_HCPCS_MOD2]      VARCHAR (2)    NULL,
    [RECOMM_HCPCS_MOD3]      VARCHAR (2)    NULL,
    [RECOMM_HCPCS_MOD4]      VARCHAR (MAX)  NULL,
    [RECOMM_HCPCS_MOD5]      VARCHAR (MAX)  NULL,
    [REF_CLAIM1_KEY]         VARCHAR (12)   NULL,
    [REF_CLAIM1_NO]          VARCHAR (10)   NULL,
    [REF_CLAIM1_TYPE]        VARCHAR (4)    NULL,
    [REF_CLAIM1_LINE]        SMALLINT       NULL,
    [REF_CLAIM2_KEY]         VARCHAR (MAX)  NULL,
    [REF_CLAIM2_NO]          VARCHAR (MAX)  NULL,
    [REF_CLAIM2_TYPE]        VARCHAR (MAX)  NULL,
    [REF_CLAIM2_LINE]        VARCHAR (MAX)  NULL,
    [REF_CLAIM3_KEY]         VARCHAR (MAX)  NULL,
    [REF_CLAIM3_NO]          VARCHAR (MAX)  NULL,
    [REF_CLAIM3_TYPE]        VARCHAR (MAX)  NULL,
    [REF_CLAIM3_LINE]        VARCHAR (MAX)  NULL,
    [REF_CLAIM4_KEY]         VARCHAR (MAX)  NULL,
    [REF_CLAIM4_NO]          VARCHAR (MAX)  NULL,
    [REF_CLAIM4_TYPE]        VARCHAR (MAX)  NULL,
    [REF_CLAIM4_LINE]        VARCHAR (MAX)  NULL,
    [REF_CLAIM5_KEY]         VARCHAR (MAX)  NULL,
    [REF_CLAIM5_NO]          VARCHAR (MAX)  NULL,
    [REF_CLAIM5_TYPE]        VARCHAR (MAX)  NULL,
    [REF_CLAIM5_LINE]        VARCHAR (MAX)  NULL,
    [OVERLAP_ISSUE]          VARCHAR (1)    NULL,
    [RECOMM_UNITS]           VARCHAR (MAX)  NULL,
    [RECOMM_PCT]             VARCHAR (MAX)  NULL,
    [RECLINE_STATUS]         VARCHAR (1)    NULL,
    [CMS_REASON_CD]          VARCHAR (MAX)  NULL,
    [CLIENT_NAME]            VARCHAR (8)    NULL,
    [CONTRACT_ID]            VARCHAR (18)   NULL,
    [BATCH_NAME]             VARCHAR (25)   NULL,
    [PROBE_NAME]             VARCHAR (19)   NULL,
    [SCORING_MODEL_VER]      VARCHAR (MAX)  NULL,
    [SELECTED_AVGYLD]        VARCHAR (MAX)  NULL,
    [RECOMM_POS]             VARCHAR (MAX)  NULL,
    [RECOMM_REV_DT]          VARCHAR (MAX)  NULL,
    [PRESENT_SCORE]          REAL           NULL,
    [CASE_ID]                VARCHAR (19)   NULL,
    [LOB_TYPE]               VARCHAR (3)    NULL,
    [SUB_ISSUE]              VARCHAR (MAX)  NULL,
    [BATCH_GEN_KEY]          VARCHAR (MAX)  NULL,
    [PRESENT_AVGYLD]         VARCHAR (MAX)  NULL,
    [SELECTED_SCORE]         VARCHAR (MAX)  NULL,
    [DELETE_ORIGINAL]        VARCHAR (1)    NULL,
    [LINE_IMPROPER_AMOUNT]   REAL           NULL,
    [OVP_CODE]               SMALLINT       NULL,
    [OVP_REASON]             VARCHAR (35)   NULL,
    [EXPIRATION_DATE]        DATETIME       NULL,
    [AVAILABILITY_DATE]      DATETIME       NULL,
    [COB_INDICATOR]          VARCHAR (MAX)  NULL,
    [GB_MODIFIERY_IND]       VARCHAR (MAX)  NULL,
    [MSO_KEY]                VARCHAR (MAX)  NULL,
    [ASSIST_SX_NM_KEY]       VARCHAR (MAX)  NULL,
    [CLAIM_ADUSTMENT_NUMBER] VARCHAR (MAX)  NULL,
    [BATCH_DATE]             DATETIME       NULL,
    [TARGET_DETAIL]          SMALLINT       NULL,
    [REF1_DETAIL]            SMALLINT       NULL,
    [REF2_DETAIL]            VARCHAR (MAX)  NULL,
    [REF3_DETAIL]            VARCHAR (MAX)  NULL,
    [REF4_DETAIL]            VARCHAR (MAX)  NULL,
    [REF5_DETAIL]            VARCHAR (MAX)  NULL,
    [Audit_ID]               VARCHAR (35)   NULL,
    [Vendor_Comments]        VARCHAR (1000) NULL
);

