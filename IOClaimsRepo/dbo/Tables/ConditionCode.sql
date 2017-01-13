CREATE TABLE [dbo].[ConditionCode] (
    [ConditionCodeId] INT            IDENTITY (1, 1) NOT NULL,
    [Code]            NVARCHAR (255) NULL,
    [Claim_id]        INT            NULL,
    [Sequence]        INT            NULL,
    CONSTRAINT [PK_ConditionCode_ConditionCodeId] PRIMARY KEY CLUSTERED ([ConditionCodeId] ASC),
    CONSTRAINT [FK_ConditionCode_Claim_id_TO_Claim_ClaimId] FOREIGN KEY ([Claim_id]) REFERENCES [dbo].[Claim] ([ClaimId])
);



