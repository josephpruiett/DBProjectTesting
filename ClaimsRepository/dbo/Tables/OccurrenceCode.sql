CREATE TABLE [dbo].[OccurrenceCode] (
    [OccurrenceCodeId] INT            IDENTITY (1, 1) NOT NULL,
    [Code]             NVARCHAR (255) NULL,
    [BeginDate]        DATETIME       NULL,
    [EndDate]          DATETIME       NULL,
    [Claim_id]         INT            NULL,
    PRIMARY KEY CLUSTERED ([OccurrenceCodeId] ASC),
    CONSTRAINT [FK9181CEBA907A1A64] FOREIGN KEY ([Claim_id]) REFERENCES [dbo].[Claim] ([ClaimId])
);

