CREATE TABLE [dbo].[ExcellusClaimsDetailsStaging] (
    [FileRequestId]          UNIQUEIDENTIFIER NOT NULL,
    [Ordinal]                INT              NOT NULL,
    [OriginalLineNumber]     INT              NOT NULL,
    [ClaimNumber]            NVARCHAR (30)    NOT NULL,
    [LineNumber]             INT              NOT NULL,
    [ClaimHistoryStage]      NVARCHAR (70)    NOT NULL,
    [TotalCharges]           DECIMAL (18, 2)  NULL,
    [AmountPaid]             DECIMAL (18, 2)  NULL,
    [IcdIndicator]           NVARCHAR (4)     NULL,
    [PrincipalDiagnosisCode] NVARCHAR (11)    NULL,
    [ProcedureCode]          NVARCHAR (9)     NULL,
    [ModifierCode1]          NVARCHAR (20)    NULL,
    [DiagnosticRelatedGroup] NVARCHAR (4)     NULL,
    [Units]                  DECIMAL (18, 2)  NULL,
    [DateOfServiceStartDate] DATETIME         NULL,
    [DateOfServiceEndDate]   DATETIME         NULL,
    [BeneficiaryId]          INT              NULL,
    [AdditionalDiagnosis1]   NVARCHAR (11)    NULL,
    [AdditionalDiagnosis2]   NVARCHAR (11)    NULL,
    [AdditionalDiagnosis3]   NVARCHAR (11)    NULL,
    [AdditionalDiagnosis4]   NVARCHAR (11)    NULL,
    [AdditionalDiagnosis5]   NVARCHAR (11)    NULL,
    [AdditionalDiagnosis6]   NVARCHAR (11)    NULL,
    [AdditionalDiagnosis7]   NVARCHAR (11)    NULL,
    [AdditionalDiagnosis8]   NVARCHAR (11)    NULL,
    [AllowedAmount]          DECIMAL (18, 2)  NULL,
    [PlaceOfService]         NVARCHAR (20)    NULL,
    [CopayAmount]            DECIMAL (18, 2)  NULL,
    [DeductibleAmount]       DECIMAL (18, 2)  NULL,
    [CoinsuranceAmount]      DECIMAL (18, 2)  NULL,
    [RevenueCode]            NVARCHAR (10)    NULL,
    [RevenueDescription]     NVARCHAR (255)   NULL,
    [AttendingProvider]      INT              NULL,
    [ModifierCode2]          NVARCHAR (20)    NULL,
    [ModifierCode3]          NVARCHAR (20)    NULL,
    [ModifierCode4]          NVARCHAR (20)    NULL,
    [ClaimType]              NVARCHAR (75)    NULL,
    [PresentOnAdmission]     NVARCHAR (4)     NULL,
    [AdditionalDataJson]     NVARCHAR (4000)  NULL,
    [CreatedDate]            DATETIME         NULL,
    [CreatedBy]              NVARCHAR (50)    NULL,
    [LastUpdatedDate]        DATETIME         NULL,
    [LastUpdatedBy]          NVARCHAR (50)    NULL,
    [AdmittingDiagnosis]     NVARCHAR (11)    NULL,
    [SeverityOfIllness]      VARCHAR (3)      NULL,
    [RiskOfMortality]        VARCHAR (3)      NULL
);


GO
CREATE NONCLUSTERED INDEX [IDX_ExcellusClaimsDetailsStaging_ClaimHistoryStage]
    ON [dbo].[ExcellusClaimsDetailsStaging]([ClaimHistoryStage] ASC)
    INCLUDE([ClaimNumber], [LineNumber], [TotalCharges], [AmountPaid], [ProcedureCode], [ModifierCode1], [Units], [DateOfServiceStartDate], [DateOfServiceEndDate], [AllowedAmount], [PlaceOfService], [CopayAmount], [DeductibleAmount], [CoinsuranceAmount], [RevenueCode], [RevenueDescription], [AttendingProvider], [ModifierCode2], [ModifierCode3], [ModifierCode4], [AdditionalDataJson]);


GO
CREATE NONCLUSTERED INDEX [IDX_ExcellusClaimsDetailsStaging_ClaimNumber_ClaimHistoryStage]
    ON [dbo].[ExcellusClaimsDetailsStaging]([ClaimNumber] ASC, [ClaimHistoryStage] ASC)
    INCLUDE([LineNumber], [TotalCharges], [AmountPaid], [ProcedureCode], [ModifierCode1], [Units], [DateOfServiceStartDate], [DateOfServiceEndDate], [AllowedAmount], [PlaceOfService], [CopayAmount], [DeductibleAmount], [CoinsuranceAmount], [RevenueCode], [RevenueDescription], [AttendingProvider], [ModifierCode2], [ModifierCode3], [ModifierCode4], [AdditionalDataJson]);


GO
CREATE NONCLUSTERED INDEX [IDX_ExcellusClaimsDetailsStaging_FileRequestId]
    ON [dbo].[ExcellusClaimsDetailsStaging]([FileRequestId] ASC)
    INCLUDE([ClaimNumber], [IcdIndicator], [DiagnosticRelatedGroup], [BeneficiaryId], [AttendingProvider]);


GO
CREATE NONCLUSTERED INDEX [IDX_ExcellusClaimsDetailsStaging_FileRequestId_ClaimHistoryStage]
    ON [dbo].[ExcellusClaimsDetailsStaging]([FileRequestId] ASC, [ClaimHistoryStage] ASC)
    INCLUDE([ClaimNumber], [AllowedAmount], [ClaimType]);


GO
CREATE NONCLUSTERED INDEX [IDX_ExcellusClaimsDetailsStaging_FileRequestId_ClaimNumber]
    ON [dbo].[ExcellusClaimsDetailsStaging]([FileRequestId] ASC, [ClaimNumber] ASC)
    INCLUDE([IcdIndicator], [DiagnosticRelatedGroup], [BeneficiaryId], [AttendingProvider]);


GO
CREATE NONCLUSTERED INDEX [IDX_ExcellusClaimsDetailsStaging_FileRequestId_ClaimNumber_ClaimHistoryStage]
    ON [dbo].[ExcellusClaimsDetailsStaging]([FileRequestId] ASC, [ClaimNumber] ASC, [ClaimHistoryStage] ASC)
    INCLUDE([LineNumber], [PrincipalDiagnosisCode], [AdditionalDiagnosis1], [AdditionalDiagnosis2], [AdditionalDiagnosis3], [AdditionalDiagnosis4], [AdditionalDiagnosis5], [AdditionalDiagnosis6], [AdditionalDiagnosis7], [AdditionalDiagnosis8], [PresentOnAdmission]);

