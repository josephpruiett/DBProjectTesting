﻿CREATE TABLE [dbo].[ServiceLine] (
    [ServiceLineId]                      INT             IDENTITY (1, 1) NOT NULL,
    [LineNumber]                         NVARCHAR (255)  NULL,
    [RevenueCode]                        NVARCHAR (255)  NULL,
    [SupplementalRevenueCode]            NVARCHAR (255)  NULL,
    [RevenueDescription]                 NVARCHAR (255)  NULL,
    [SupplementalRevenueDescription]     NVARCHAR (255)  NULL,
    [PlaceOfService]                     NVARCHAR (255)  NULL,
    [SupplementalPlaceOfService]         NVARCHAR (255)  NULL,
    [EMG]                                NVARCHAR (255)  NULL,
    [SupplementalEMG]                    NVARCHAR (255)  NULL,
    [ProcedureCode]                      NVARCHAR (255)  NULL,
    [SupplementalProcedureCode]          NVARCHAR (255)  NULL,
    [DateOfServiceStartDate]             DATETIME        NULL,
    [SupplementalDateOfServiceStartDate] DATETIME        NULL,
    [DateOfServiceEndDate]               DATETIME        NULL,
    [SupplementalDateOfServiceEndDate]   DATETIME        NULL,
    [Units]                              DECIMAL (19, 2) NULL,
    [UnitsAllowed]                       DECIMAL (19, 2) NULL,
    [SupplementalUnits]                  NVARCHAR (255)  NULL,
    [EPSDTFamilyPlan]                    NVARCHAR (255)  NULL,
    [SupplementalEPSDTFamilyPlan]        NVARCHAR (255)  NULL,
    [TotalCharges]                       DECIMAL (19, 2) NULL,
    [SupplementalTotalCharges]           DECIMAL (19, 2) NULL,
    [NonCoveredCharges]                  DECIMAL (19, 2) NULL,
    [SupplementalNonCoveredCharges]      DECIMAL (19, 2) NULL,
    [ModifierCode1]                      NVARCHAR (255)  NULL,
    [ModifierCode2]                      NVARCHAR (255)  NULL,
    [ModifierCode3]                      NVARCHAR (255)  NULL,
    [ModifierCode4]                      NVARCHAR (255)  NULL,
    [AllowedAmount]                      DECIMAL (19, 2) NULL,
    [CopayAmount]                        DECIMAL (19, 2) NULL,
    [CoinsuranceAmount]                  DECIMAL (19, 2) NULL,
    [DeductibleAmount]                   DECIMAL (19, 2) NULL,
    [PaidAmount]                         DECIMAL (19, 2) NULL,
    [AdditionalDataJson]                 NVARCHAR (MAX)  NULL,
    [Claim_id]                           INT             NULL,
    [BillingProvider_id]                 INT             NULL,
    [AttendingProvider_id]               INT             NULL,
    [SupplementalProvider_id]            INT             NULL,
    [CptCode]                            VARCHAR (10)    NULL,
    [HcpcsCode]                          VARCHAR (10)    NULL,
    [NdcCode]                            VARCHAR (30)    NULL,
    [NdcUnits]                           VARCHAR (30)    NULL,
    [STAGING_StageID]                    INT             NULL,
    CONSTRAINT [PK_ServiceLine_ServiceLineId] PRIMARY KEY CLUSTERED ([ServiceLineId] ASC),
    CONSTRAINT [FK_ServiceLine_AttendingProvider_id_TO_Provider_ProviderId] FOREIGN KEY ([AttendingProvider_id]) REFERENCES [dbo].[Provider] ([ProviderId]),
    CONSTRAINT [FK_ServiceLine_BillingProvider_id_TO_Provider_ProviderId] FOREIGN KEY ([BillingProvider_id]) REFERENCES [dbo].[Provider] ([ProviderId]),
    CONSTRAINT [FK_ServiceLine_Claim_id_TO_Claim_ClaimId] FOREIGN KEY ([Claim_id]) REFERENCES [dbo].[Claim] ([ClaimId]),
    CONSTRAINT [FK_ServiceLine_SupplementalProvider_id_TO_Provider_ProviderId] FOREIGN KEY ([SupplementalProvider_id]) REFERENCES [dbo].[Provider] ([ProviderId])
);






GO
CREATE NONCLUSTERED INDEX [IDX_ServiceLine_Claim_id]
    ON [dbo].[ServiceLine]([Claim_id] ASC, [ServiceLineId] ASC);

