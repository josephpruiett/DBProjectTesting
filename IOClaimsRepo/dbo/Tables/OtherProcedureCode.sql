CREATE TABLE [dbo].[OtherProcedureCode] (
    [OtherProcedureCodeId] INT            IDENTITY (1, 1) NOT NULL,
    [Code]                 NVARCHAR (255) NULL,
    [Date]                 DATETIME       NULL,
    [Claim_id]             INT            NULL,
    CONSTRAINT [PK_OtherProcedureCode_OtherProcedureCodeId] PRIMARY KEY CLUSTERED ([OtherProcedureCodeId] ASC),
    CONSTRAINT [FK_OtherProcedureCode_Claim_id_TO_Claim_ClaimId] FOREIGN KEY ([Claim_id]) REFERENCES [dbo].[Claim] ([ClaimId])
);



