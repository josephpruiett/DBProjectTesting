CREATE TABLE [dbo].[ExcellusClaimsStaging] (
    [FileRequestId]        UNIQUEIDENTIFIER NOT NULL,
    [Ordinal]              INT              NOT NULL,
    [OriginalLineNumber]   INT              NOT NULL,
    [ClaimNumber]          NVARCHAR (30)    NULL,
    [BeneficiaryId]        INT              NULL,
    [BillingProviderId]    INT              NULL,
    [DischargeDate]        DATETIME         NULL,
    [DischargeStatus]      NVARCHAR (20)    NULL,
    [TotalCharges]         DECIMAL (18, 2)  NULL,
    [PatientAccountNumber] NVARCHAR (50)    NULL,
    [AmountPaid]           DECIMAL (18, 2)  NULL,
    [PaidDate]             DATE             NULL,
    [AdditionalDataJson]   NVARCHAR (1000)  NULL,
    [CreatedDate]          DATETIME         NULL,
    [CreatedBy]            NVARCHAR (50)    NULL,
    [LastUpdatedDate]      DATETIME         NULL,
    [LastUpdatedBy]        NVARCHAR (50)    NULL,
    [AdmissionDate]        DATETIME         NULL
);

