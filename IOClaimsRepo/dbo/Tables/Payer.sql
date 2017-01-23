CREATE TABLE [dbo].[Payer] (
    [PayerId]                       INT             IDENTITY (1, 1) NOT NULL,
    [PayerType]                     NVARCHAR (255)  NULL,
    [Name]                          NVARCHAR (255)  NULL,
    [HealthPlanId]                  INT             NULL,
    [ReleaseOfInformationIndicator] NVARCHAR (255)  NULL,
    [PriorPaymentAmount]            DECIMAL (19, 2) NULL,
    [TreatmentAuthorizationCode]    NVARCHAR (255)  NULL,
    [OtherProviderIdentifier]       NVARCHAR (255)  NULL,
    [AssignmentOfBenefitsIndicator] NVARCHAR (255)  NULL,
    [EstimatedAmountDue]            DECIMAL (19, 2) NULL,
    [Claim_id]                      INT             NULL,
    [STAGING_StageID]               INT             NULL,
    CONSTRAINT [PK_Payer_PayerId] PRIMARY KEY CLUSTERED ([PayerId] ASC),
    CONSTRAINT [FK_Payer_Claim_id_TO_Claim_ClaimId] FOREIGN KEY ([Claim_id]) REFERENCES [dbo].[Claim] ([ClaimId])
);





