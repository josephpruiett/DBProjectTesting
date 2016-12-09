CREATE TABLE [dbo].[ClaimAdditionalData] (
    [ClaimID]                           INT                                   NOT NULL,
    [ClientID]                          INT                                   NOT NULL,
    [AdditionalData_Columnset]          XML COLUMN_SET FOR ALL_SPARSE_COLUMNS,
    [File_Type]                         VARCHAR (1) SPARSE                    NULL,
    [Member_ID]                         VARCHAR (20) SPARSE                   NULL,
    [Drug_Claim]                        VARCHAR (1) SPARSE                    NULL,
    [Insurance_Company_Unique_ID]       VARCHAR (7) SPARSE                    NULL,
    [Prescribing_Physician_Provider_ID] VARCHAR (20) SPARSE                   NULL,
    [Total_Claim_allowed_amount]        MONEY SPARSE                          NULL,
    [Total_Other_carrier_paid_amt]      MONEY SPARSE                          NULL,
    [Total_Claim_member_liability]      MONEY SPARSE                          NULL,
    [Bill_Type]                         VARCHAR (40) SPARSE                   NULL,
    [Total_Copayment_Amt]               MONEY SPARSE                          NULL,
    [Total_Deductible_Amt]              MONEY SPARSE                          NULL,
    [Total_Coinsurance_Amt]             MONEY SPARSE                          NULL,
    [Home_Host_Ind]                     VARCHAR (4) SPARSE                    NULL,
    [Billing_Provider_Tax_id]           VARCHAR (18) SPARSE                   NULL,
    [Bad_Debt_Amt]                      MONEY SPARSE                          NULL,
    [Withheld_Amt]                      MONEY SPARSE                          NULL,
    [Admission_Date]                    VARCHAR (8) SPARSE                    NULL,
    [Patient_Status_Desc]               VARCHAR (255) SPARSE                  NULL,
    [Src_appl_code]                     VARCHAR (20) SPARSE                   NULL,
    [Source_Adjustment_Number]          VARCHAR (5) SPARSE                    NULL
);


GO
CREATE UNIQUE CLUSTERED INDEX [UNQ_ClaimAdditionalData]
    ON [dbo].[ClaimAdditionalData]([ClaimID] ASC);

