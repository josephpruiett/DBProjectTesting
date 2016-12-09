CREATE TABLE [dbo].[ConditionCode] (
    [ConditionCodeId] INT            IDENTITY (1, 1) NOT NULL,
    [Code]            NVARCHAR (255) NULL,
    [Claim_id]        INT            NULL,
    [Sequence]        INT            NULL,
    PRIMARY KEY CLUSTERED ([ConditionCodeId] ASC),
    CONSTRAINT [FK2B1DBAE6907A1A64] FOREIGN KEY ([Claim_id]) REFERENCES [dbo].[Claim] ([ClaimId])
);

