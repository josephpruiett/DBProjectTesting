CREATE TABLE [dbo].[ReasonForVisitCode] (
    [ReasonForVisitCodeId] INT            IDENTITY (1, 1) NOT NULL,
    [Code]                 NVARCHAR (255) NULL,
    [Claim_id]             INT            NULL,
    CONSTRAINT [PK_ReasonForVisitCode_ReasonForVisitCodeId] PRIMARY KEY CLUSTERED ([ReasonForVisitCodeId] ASC),
    CONSTRAINT [FK_ReasonForVisitCode_Claim_id_TO_Claim_ClaimId] FOREIGN KEY ([Claim_id]) REFERENCES [dbo].[Claim] ([ClaimId])
);



