CREATE TABLE [dbo].[ProviderAdditionalDataStage] (
    [ProviderNumber]                 VARCHAR (255) NULL,
    [OriginalLineNumber]             BIGINT        NULL,
    [File_Type]                      VARCHAR (255) NULL,
    [Filler_1]                       VARCHAR (255) NULL,
    [Filler_2]                       VARCHAR (255) NULL,
    [Name]                           VARCHAR (255) NULL,
    [Address1]                       VARCHAR (255) NULL,
    [Address2]                       VARCHAR (255) NULL,
    [Address_3]                      VARCHAR (255) NULL,
    [City]                           VARCHAR (255) NULL,
    [State]                          VARCHAR (255) NULL,
    [ZipCode]                        VARCHAR (255) NULL,
    [FederalTaxIdNumber]             VARCHAR (255) NULL,
    [Phone]                          VARCHAR (255) NULL,
    [Insurance_Company_Unique_ID]    VARCHAR (255) NULL,
    [NPI]                            VARCHAR (255) NULL,
    [Specialty_Code]                 VARCHAR (255) NULL,
    [Specialty_Description]          VARCHAR (255) NULL,
    [SRC_APPL_CODE]                  VARCHAR (255) NULL,
    [PROV_ENTITY_CODE]               VARCHAR (255) NULL,
    [PROV_ENTITY_DESCRIPTION]        VARCHAR (255) NULL,
    [ProviderType]                   VARCHAR (255) NULL,
    [PROV_TYPE_DESCRIPTION]          VARCHAR (255) NULL,
    [PROV_NYS_SPECIALTY_CODE]        VARCHAR (255) NULL,
    [PROV_NYS_SPECIALTY_DESCRIPTION] VARCHAR (255) NULL
);


GO
CREATE UNIQUE CLUSTERED INDEX [CL_X]
    ON [dbo].[ProviderAdditionalDataStage]([ProviderNumber] ASC, [OriginalLineNumber] ASC);

