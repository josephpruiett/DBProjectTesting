﻿CREATE TABLE [dbo].[ClaimsStaging] (
    [FileRequestId]                            UNIQUEIDENTIFIER NOT NULL,
    [Ordinal]                                  INT              NOT NULL,
    [OriginalLineNumber]                       INT              NOT NULL,
    [ClaimNumber]                              NVARCHAR (255)   NULL,
    [PrincipalDiagnosisCode]                   NVARCHAR (255)   NULL,
    [PrincipalDiagnosisCodePresentOnAdmission] NVARCHAR (255)   NULL,
    [SecondaryDiagnosisCode]                   NVARCHAR (255)   NULL,
    [SecondaryDiagnosisCodePresentOnAdmission] NVARCHAR (255)   NULL,
    [TertiaryDiagnosisCode]                    NVARCHAR (255)   NULL,
    [TertiaryDiagnosisCodePresentOnAdmission]  NVARCHAR (255)   NULL,
    [LineNumber]                               NVARCHAR (255)   NOT NULL,
    [BeneficiaryId]                            INT              NULL,
    [AttendingProviderId]                      INT              NULL,
    [BillingProviderId]                        INT              NULL,
    [DateOfServiceStartDate]                   DATETIME         NULL,
    [DateOfServiceEndDate]                     DATETIME         NULL,
    [PlaceOfService]                           NVARCHAR (255)   NULL,
    [ProcedureCode]                            NVARCHAR (255)   NULL,
    [ModifierCode1]                            NVARCHAR (255)   NULL,
    [ModifierCode2]                            NVARCHAR (255)   NULL,
    [ModifierCode3]                            NVARCHAR (255)   NULL,
    [ModifierCode4]                            NVARCHAR (255)   NULL,
    [Units]                                    DECIMAL (18, 2)  NULL,
    [AdmissionDate]                            DATETIME         NULL,
    [DischargeDate]                            DATETIME         NULL,
    [FormType]                                 NVARCHAR (2)     NULL,
    [ClaimType]                                NVARCHAR (3)     NULL,
    [TotalCharges]                             DECIMAL (18, 2)  NULL,
    [CreatedDate]                              DATETIME         NULL,
    [CreatedBy]                                NVARCHAR (255)   NULL,
    [LastUpdatedDate]                          DATETIME         NULL,
    [LastUpdatedBy]                            NVARCHAR (255)   NULL,
    [UnitsAllowed]                             DECIMAL (18, 2)  NULL,
    [AllowedAmount]                            DECIMAL (18, 2)  NULL,
    [CopayAmount]                              DECIMAL (18, 2)  NULL,
    [CoinsuranceAmount]                        DECIMAL (18, 2)  NOT NULL,
    [DeductibleAmount]                         DECIMAL (18, 2)  NULL,
    [PaidAmount]                               DECIMAL (18, 2)  NULL,
    [PaidDate]                                 DATE             NULL,
    [DischargeStatus]                          VARCHAR (15)     NULL,
    [DiagnosticRelatedGroup]                   VARCHAR (4)      NULL,
    [PatientAccountNumber]                     VARCHAR (50)     NULL,
    [IcdIndicator]                             VARCHAR (4)      NULL,
    [AdditionalDataJson]                       NVARCHAR (MAX)   NULL
);
