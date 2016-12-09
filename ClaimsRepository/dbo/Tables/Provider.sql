CREATE TABLE [dbo].[Provider] (
    [ProviderId]         INT              IDENTITY (1, 1) NOT NULL,
    [FileRequestId]      UNIQUEIDENTIFIER NULL,
    [OriginalLineNumber] INT              NOT NULL,
    [ClientId]           INT              NULL,
    [ProviderNumber]     NVARCHAR (255)   NULL,
    [CampusId]           NVARCHAR (255)   NULL,
    [Name]               NVARCHAR (255)   NULL,
    [NPI]                NVARCHAR (255)   NULL,
    [SSN]                NVARCHAR (255)   NULL,
    [EIN]                NVARCHAR (255)   NULL,
    [FederalTaxIdNumber] NVARCHAR (255)   NULL,
    [Phone]              NVARCHAR (255)   NULL,
    [AcceptAssignment]   BIT              NULL,
    [TaxonomyCode1]      NVARCHAR (255)   NULL,
    [TaxonomyCode2]      NVARCHAR (255)   NULL,
    [TaxonomyCode3]      NVARCHAR (255)   NULL,
    [ProviderType]       NVARCHAR (255)   NULL,
    [AdditionalDataJson] NVARCHAR (MAX)   NULL,
    [CreatedBy]          NVARCHAR (255)   NULL,
    [CreatedDate]        DATETIME         NULL,
    [LastUpdatedBy]      NVARCHAR (255)   NULL,
    [LastUpdatedDate]    DATETIME         NULL,
    [Address1]           NVARCHAR (255)   NULL,
    [Address2]           NVARCHAR (255)   NULL,
    [City]               NVARCHAR (255)   NULL,
    [State]              NVARCHAR (255)   NULL,
    [ZipCode]            NVARCHAR (255)   NULL,
    PRIMARY KEY CLUSTERED ([ProviderId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IDX_Provider_ClientId_ProviderNumber]
    ON [dbo].[Provider]([ClientId] ASC, [ProviderNumber] ASC);


GO
CREATE NONCLUSTERED INDEX [IDX_Provider_FileRequestId_ClientId_ProviderNumber]
    ON [dbo].[Provider]([FileRequestId] ASC, [ClientId] ASC, [ProviderNumber] ASC);

