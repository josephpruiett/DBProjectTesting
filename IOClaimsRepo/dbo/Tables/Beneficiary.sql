CREATE TABLE [dbo].[Beneficiary] (
    [BeneficiaryId]            INT              IDENTITY (1, 1) NOT NULL,
    [FileRequestId]            UNIQUEIDENTIFIER NULL,
    [ClientId]                 INT              NULL,
    [BeneficiaryIdentifier]    NVARCHAR (255)   NULL,
    [FullName]                 NVARCHAR (255)   NULL,
    [FirstName]                NVARCHAR (255)   NULL,
    [MiddleName]               NVARCHAR (255)   NULL,
    [LastName]                 NVARCHAR (255)   NULL,
    [DateOfBirth]              DATETIME         NULL,
    [Phone]                    NVARCHAR (255)   NULL,
    [Sex]                      NVARCHAR (255)   NULL,
    [BeneficiaryControlNumber] NVARCHAR (255)   NULL,
    [CountryCode]              NVARCHAR (255)   NULL,
    [AdditionalDataJson]       NVARCHAR (MAX)   NULL,
    [MBR_ELIG_CNCL_DT]         NVARCHAR (255)   NULL,
    [MBR_LOB_CD]               NVARCHAR (255)   NULL,
    [HICN]                     NVARCHAR (255)   NULL,
    [CreatedBy]                NVARCHAR (255)   NULL,
    [CreatedDate]              DATETIME         NULL,
    [LastUpdatedBy]            NVARCHAR (255)   NULL,
    [LastUpdatedDate]          DATETIME         NULL,
    [Claim_id]                 INT              NULL,
    [Address1]                 NVARCHAR (255)   NULL,
    [Address2]                 NVARCHAR (255)   NULL,
    [City]                     NVARCHAR (255)   NULL,
    [State]                    NVARCHAR (255)   NULL,
    [ZipCode]                  NVARCHAR (255)   NULL,
    [STAGING_StageID]          INT              NULL,
    CONSTRAINT [PK_Beneficiary_BeneficiaryId] PRIMARY KEY CLUSTERED ([BeneficiaryId] ASC),
    CONSTRAINT [FK_Beneficiary_Claim_id_TO_Claim_ClaimId] FOREIGN KEY ([Claim_id]) REFERENCES [dbo].[Claim] ([ClaimId])
);






GO



GO
CREATE NONCLUSTERED INDEX [NC_FileRequestId]
    ON [dbo].[Beneficiary]([FileRequestId] ASC)
    INCLUDE([BeneficiaryIdentifier]);


GO
CREATE NONCLUSTERED INDEX [NC_BeneficiaryIdentifier]
    ON [dbo].[Beneficiary]([BeneficiaryIdentifier] ASC);

