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
    PRIMARY KEY NONCLUSTERED ([BeneficiaryId] ASC),
    CONSTRAINT [FK611A42E7907A1A64] FOREIGN KEY ([Claim_id]) REFERENCES [dbo].[Claim] ([ClaimId])
);


GO
CREATE NONCLUSTERED INDEX [IDX_Beneficiary_FileRequestId]
    ON [dbo].[Beneficiary]([FileRequestId] ASC)
    INCLUDE([BeneficiaryIdentifier]);


GO
CREATE NONCLUSTERED INDEX [Idx_BeneficiaryIdentifier]
    ON [dbo].[Beneficiary]([BeneficiaryIdentifier] ASC);

