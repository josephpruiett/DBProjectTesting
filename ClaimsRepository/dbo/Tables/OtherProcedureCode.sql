CREATE TABLE [dbo].[OtherProcedureCode] (
    [OtherProcedureCodeId] INT            IDENTITY (1, 1) NOT NULL,
    [Code]                 NVARCHAR (255) NULL,
    [Date]                 DATETIME       NULL,
    [Claim_id]             INT            NULL,
    PRIMARY KEY CLUSTERED ([OtherProcedureCodeId] ASC),
    CONSTRAINT [FKDD53B174907A1A64] FOREIGN KEY ([Claim_id]) REFERENCES [dbo].[Claim] ([ClaimId])
);

