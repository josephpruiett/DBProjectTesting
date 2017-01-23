CREATE TABLE [dbo].[Claim] (
    [ClaimId]                                          INT              IDENTITY (1, 1) NOT NULL,
    [ClientId]                                         INT              NULL,
    [FileRequestId]                                    UNIQUEIDENTIFIER NULL,
    [ClaimKey]                                         NVARCHAR (255)   NULL,
    [ClaimNumber]                                      NVARCHAR (255)   NULL,
    [AuditState]                                       NVARCHAR (255)   NULL,
    [AttendingProviderQualifierCode]                   NVARCHAR (255)   NULL,
    [OperatingProviderQualifierCode]                   NVARCHAR (255)   NULL,
    [PatientAccountNumber]                             NVARCHAR (255)   NULL,
    [MedicalRecordNumber]                              NVARCHAR (255)   NULL,
    [TypeOfBill]                                       NVARCHAR (255)   NULL,
    [AccidentState]                                    NVARCHAR (255)   NULL,
    [AdmittingDiagnosisCode]                           NVARCHAR (255)   NULL,
    [PrincipalDiagnosisCode]                           NVARCHAR (255)   NULL,
    [ProspectivePaymentSystemCode]                     NVARCHAR (255)   NULL,
    [AdmissionDate]                                    DATETIME         NULL,
    [DischargeDate]                                    DATETIME         NULL,
    [AdmissionHour]                                    INT              NULL,
    [PriorityOfVisit]                                  NVARCHAR (255)   NULL,
    [AdmissionSource]                                  NVARCHAR (255)   NULL,
    [PrincipalProcedureCode]                           NVARCHAR (255)   NULL,
    [PrincipalProcedureCodeDate]                       DATETIME         NULL,
    [FormType]                                         NVARCHAR (255)   NULL,
    [ClaimType]                                        NVARCHAR (255)   NULL,
    [Remarks]                                          NVARCHAR (255)   NULL,
    [ResponsibleParties]                               NVARCHAR (255)   NULL,
    [ExternalCauseOfInjury1]                           NVARCHAR (255)   NULL,
    [ExternalCauseOfInjury2]                           NVARCHAR (255)   NULL,
    [ExternalCauseOfInjury3]                           NVARCHAR (255)   NULL,
    [OtherProviderNPI1]                                NVARCHAR (255)   NULL,
    [OtherProviderQualifierCode1]                      NVARCHAR (255)   NULL,
    [OtherProviderNPI2]                                NVARCHAR (255)   NULL,
    [OtherProviderQualifierCode2]                      NVARCHAR (255)   NULL,
    [OtherProviderNPI3]                                NVARCHAR (255)   NULL,
    [OtherProviderQualifierCode3]                      NVARCHAR (255)   NULL,
    [PaidDate]                                         DATETIME         NULL,
    [DischargeStatus]                                  NVARCHAR (255)   NULL,
    [DateOfCurrentIllness]                             DATETIME         NULL,
    [DateOfCurrentIllnessQualifierCode]                NVARCHAR (255)   NULL,
    [OtherDateOfCurrentIllness]                        DATETIME         NULL,
    [OtherDateOfCurrentIllnessQualifierCode]           NVARCHAR (255)   NULL,
    [AmountPaid]                                       DECIMAL (19, 2)  NULL,
    [BeneficiaryUnableToWorkStartDate]                 DATETIME         NULL,
    [BeneficiaryUnableToWorkEndDate]                   DATETIME         NULL,
    [ReferringProviderOrOtherSourceName]               NVARCHAR (255)   NULL,
    [ReferringProviderOrOtherSourceOtherQualifierCode] NVARCHAR (255)   NULL,
    [ReferringProviderOrOtherSourceOtherIdNumber]      NVARCHAR (255)   NULL,
    [BeneficiaryDischargeHour]                         INT              NULL,
    [BeneficiaryDischargeStatus]                       NVARCHAR (255)   NULL,
    [HospitalizationStartDate]                         DATETIME         NULL,
    [HospitalizationEndDate]                           DATETIME         NULL,
    [ClaimCodes]                                       NVARCHAR (255)   NULL,
    [OutsideLab]                                       BIT              NULL,
    [OutsideLabCharges]                                DECIMAL (19, 2)  NULL,
    [ResubmissionCode]                                 NVARCHAR (255)   NULL,
    [OriginalReferenceNumber]                          NVARCHAR (255)   NULL,
    [PriorAuthorizationNumber]                         NVARCHAR (255)   NULL,
    [IsThereOtherHealthBenefitPlan]                    BIT              NULL,
    [ConditionRelatedToEmployment]                     BIT              NULL,
    [ConditionRelatedToAutoAccident]                   BIT              NULL,
    [ConditionRelatedToAutoAccidentState]              NVARCHAR (255)   NULL,
    [ConditionRelatedToOther]                          BIT              NULL,
    [BeneficiarysOrAuthorizedSignature]                NVARCHAR (255)   NULL,
    [BeneficiarysOrAuthorizedSignatureDate]            DATETIME         NULL,
    [InsuredOrAuthorizedSignature]                     NVARCHAR (255)   NULL,
    [SignatureOfPhysicianOrSupplier]                   NVARCHAR (255)   NULL,
    [SignatureOfPhysicianOrSupplierDate]               DATETIME         NULL,
    [ServiceFacility]                                  NVARCHAR (255)   NULL,
    [TotalCharge]                                      DECIMAL (19, 2)  NULL,
    [IcdIndicator]                                     NVARCHAR (255)   NULL,
    [DiagnosticRelatedGroup]                           NVARCHAR (255)   NULL,
    [AdditionalDataJson]                               NVARCHAR (MAX)   NULL,
    [CreatedBy]                                        NVARCHAR (255)   NULL,
    [CreatedDate]                                      DATETIME         NULL,
    [LastUpdatedBy]                                    NVARCHAR (255)   NULL,
    [LastUpdatedDate]                                  DATETIME         NULL,
    [Beneficiary_id]                                   INT              NULL,
    [BillingProvider_id]                               INT              NULL,
    [AttendingProvider_id]                             INT              NULL,
    [OperatingProvider_id]                             INT              NULL,
    [Payer1_id]                                        INT              NULL,
    [Payer2_id]                                        INT              NULL,
    [Payer3_id]                                        INT              NULL,
    [ReferringProviderOrOtherSourceProvider_id]        INT              NULL,
    [BillingProviderMedicareFacilityNumber]            NVARCHAR (255)   NULL,
    [AttendingProviderMedicareFacilityNumber]          NVARCHAR (255)   NULL,
    [SeverityOfIllness]                                VARCHAR (3)      NULL,
    [RiskOfMortality]                                  VARCHAR (3)      NULL,
    [STAGING_StageID]                                  INT              NULL,
    CONSTRAINT [PK_Claim_ClaimId] PRIMARY KEY NONCLUSTERED ([ClaimId] ASC),
    CONSTRAINT [FK_Claim_AttendingProvider_id_TO_Provider_ProviderId] FOREIGN KEY ([AttendingProvider_id]) REFERENCES [dbo].[Provider] ([ProviderId]),
    CONSTRAINT [FK_Claim_Beneficiary_id_TO_Beneficiary_BeneficiaryId] FOREIGN KEY ([Beneficiary_id]) REFERENCES [dbo].[Beneficiary] ([BeneficiaryId]),
    CONSTRAINT [FK_Claim_BillingProvider_id_TO_Provider_ProviderId] FOREIGN KEY ([BillingProvider_id]) REFERENCES [dbo].[Provider] ([ProviderId]),
    CONSTRAINT [FK_Claim_OperatingProvider_id_TO_Provider_ProviderId] FOREIGN KEY ([OperatingProvider_id]) REFERENCES [dbo].[Provider] ([ProviderId]),
    CONSTRAINT [FK_Claim_Payer1_id_TO_Payer_PayerId] FOREIGN KEY ([Payer1_id]) REFERENCES [dbo].[Payer] ([PayerId]),
    CONSTRAINT [FK_Claim_Payer2_id_TO_Payer_PayerId] FOREIGN KEY ([Payer2_id]) REFERENCES [dbo].[Payer] ([PayerId]),
    CONSTRAINT [FK_Claim_Payer3_id_TO_Payer_PayerId] FOREIGN KEY ([Payer3_id]) REFERENCES [dbo].[Payer] ([PayerId]),
    CONSTRAINT [FK_Claim_ReferringProviderOrOtherSourceProvider_id_TO_Provider_ProviderId] FOREIGN KEY ([ReferringProviderOrOtherSourceProvider_id]) REFERENCES [dbo].[Provider] ([ProviderId])
);






GO
CREATE CLUSTERED INDEX [claimid_claimnumber_frid_idx]
    ON [dbo].[Claim]([FileRequestId] ASC, [ClaimId] ASC, [ClaimNumber] ASC);


GO
CREATE NONCLUSTERED INDEX [NC_CLaim_FileRequestId]
    ON [dbo].[Claim]([FileRequestId] ASC);


GO
CREATE NONCLUSTERED INDEX [NC_Client_ClaimNumber]
    ON [dbo].[Claim]([ClientId] ASC, [ClaimNumber] ASC);


GO
CREATE NONCLUSTERED INDEX [NC_OperatingProvider_id]
    ON [dbo].[Claim]([OperatingProvider_id] ASC);


GO
CREATE NONCLUSTERED INDEX [NC_BillingProvider_id]
    ON [dbo].[Claim]([BillingProvider_id] ASC);


GO
CREATE NONCLUSTERED INDEX [NC_AttendingProvider_id]
    ON [dbo].[Claim]([AttendingProvider_id] ASC);

