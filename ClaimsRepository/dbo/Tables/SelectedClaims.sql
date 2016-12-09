﻿CREATE TABLE [dbo].[SelectedClaims] (
    [SelectedClaimsId]         INT              IDENTITY (1, 1) NOT NULL,
    [CaseId]                   NVARCHAR (32)    NOT NULL,
    [AuditType]                NVARCHAR (8)     NOT NULL,
    [ContractId]               INT              NOT NULL,
    [ContractIdString]         NVARCHAR (255)   NOT NULL,
    [ClaimKey]                 NVARCHAR (64)    NOT NULL,
    [SharedId]                 INT              NULL,
    [SharedIdString]           NVARCHAR (255)   NULL,
    [ClaimId]                  NVARCHAR (64)    NOT NULL,
    [LineNumber]               INT              NOT NULL,
    [RecommendedLineStatus]    NVARCHAR (1)     NULL,
    [RecommendedProcedureCode] NVARCHAR (8)     NULL,
    [RecommendedModifier1]     NVARCHAR (4)     NULL,
    [RecommendedModifier2]     NVARCHAR (4)     NULL,
    [RecommendedModifier3]     NVARCHAR (4)     NULL,
    [RecommendedModifier4]     NVARCHAR (4)     NULL,
    [RecommendedUnits]         DECIMAL (19, 2)  NULL,
    [RecommendedPercentage]    DECIMAL (19, 2)  NULL,
    [VulnerabilityId1]         INT              NULL,
    [VulnerabilityId1String]   NVARCHAR (255)   NULL,
    [VulnerabilityReason1]     NVARCHAR (256)   NULL,
    [VulnerabilityScore1]      INT              NULL,
    [VulnerabilityId2]         INT              NULL,
    [VulnerabilityId2String]   NVARCHAR (255)   NULL,
    [VulnerabilityReason2]     NVARCHAR (256)   NULL,
    [VulnerabilityScore2]      INT              NULL,
    [VulnerabilityId3]         INT              NULL,
    [VulnerabilityId3String]   NVARCHAR (255)   NULL,
    [VulnerabilityReason3]     NVARCHAR (256)   NULL,
    [VulnerabilityScore3]      INT              NULL,
    [VulnerabilityId4]         INT              NULL,
    [VulnerabilityId4String]   NVARCHAR (255)   NULL,
    [VulnerabilityReason4]     NVARCHAR (256)   NULL,
    [VulnerabilityScore4]      INT              NULL,
    [VulnerabilityId5]         INT              NULL,
    [VulnerabilityId5String]   NVARCHAR (255)   NULL,
    [VulnerabilityReason5]     NVARCHAR (256)   NULL,
    [VulnerabilityScore5]      INT              NULL,
    [ClaimTypeCode]            NVARCHAR (8)     NOT NULL,
    [ReferenceClaimId1]        NVARCHAR (64)    NULL,
    [ReferenceClaimKey1]       NVARCHAR (64)    NULL,
    [ReferenceClaimLine1]      INT              NULL,
    [ReferenceClaimId2]        NVARCHAR (64)    NULL,
    [ReferenceClaimKey2]       NVARCHAR (64)    NULL,
    [ReferenceClaimLine2]      INT              NULL,
    [ReferenceClaimId3]        NVARCHAR (64)    NULL,
    [ReferenceClaimKey3]       NVARCHAR (64)    NULL,
    [ReferenceClaimLine3]      INT              NULL,
    [ReferenceClaimId4]        NVARCHAR (64)    NULL,
    [ReferenceClaimKey4]       NVARCHAR (64)    NULL,
    [ReferenceClaimLine4]      INT              NULL,
    [ReferenceClaimId5]        NVARCHAR (64)    NULL,
    [ReferenceClaimKey5]       NVARCHAR (64)    NULL,
    [ReferenceClaimLine5]      INT              NULL,
    [BatchKey]                 NVARCHAR (32)    NOT NULL,
    [BatchDate]                DATETIME         NOT NULL,
    [FileRequestId]            UNIQUEIDENTIFIER NULL,
    [LobTypeId]                NVARCHAR (255)   NULL,
    PRIMARY KEY CLUSTERED ([SelectedClaimsId] ASC)
);

