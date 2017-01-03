CREATE TABLE [dbo].[ReasonForVisitCode] (
    [ReasonForVisitCodeId] INT            IDENTITY (1, 1) NOT NULL,
    [Code]                 NVARCHAR (255) NULL,
    [Claim_id]             INT            NULL,
    PRIMARY KEY CLUSTERED ([ReasonForVisitCodeId] ASC),
    CONSTRAINT [FK365E7277907A1A64] FOREIGN KEY ([Claim_id]) REFERENCES [dbo].[Claim] ([ClaimId])
);

