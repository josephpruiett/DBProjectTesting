CREATE TABLE [dbo].[InsuredParty] (
    [InsuredPartyId]              INT            IDENTITY (1, 1) NOT NULL,
    [InsuredPartyType]            NVARCHAR (255) NULL,
    [BeneficiaryRelationshipType] NVARCHAR (255) NULL,
    [IdNumber]                    NVARCHAR (255) NULL,
    [FullName]                    NVARCHAR (255) NULL,
    [PolicyGroupOrFECANumber]     NVARCHAR (255) NULL,
    [InsuredPartyDateOfBirth]     DATETIME       NULL,
    [PlanOrProgramName]           NVARCHAR (255) NULL,
    [GroupName]                   NVARCHAR (255) NULL,
    [EmployerName]                NVARCHAR (255) NULL,
    [Phone]                       NVARCHAR (255) NULL,
    [Sex]                         NVARCHAR (255) NULL,
    [TreatmentAuthorizationCodes] NVARCHAR (255) NULL,
    [DocumentControlNumber]       NVARCHAR (255) NULL,
    [Claim_id]                    INT            NULL,
    [Address1]                    NVARCHAR (255) NULL,
    [Address2]                    NVARCHAR (255) NULL,
    [City]                        NVARCHAR (255) NULL,
    [State]                       NVARCHAR (255) NULL,
    [ZipCode]                     NVARCHAR (255) NULL,
    [STAGING_StageID]             INT            NULL,
    CONSTRAINT [PK_InsuredParty_InsuredPartyId] PRIMARY KEY CLUSTERED ([InsuredPartyId] ASC),
    CONSTRAINT [FK_InsuredParty_Claim_id_TO_Claim_ClaimId] FOREIGN KEY ([Claim_id]) REFERENCES [dbo].[Claim] ([ClaimId])
);





