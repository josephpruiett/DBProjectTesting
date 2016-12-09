CREATE TABLE [dbo].[ValueCode] (
    [ValueCodeId] INT             IDENTITY (1, 1) NOT NULL,
    [Code]        NVARCHAR (255)  NULL,
    [Amount]      DECIMAL (19, 2) NULL,
    [Claim_id]    INT             NULL,
    PRIMARY KEY CLUSTERED ([ValueCodeId] ASC),
    CONSTRAINT [FKF7413B5E907A1A64] FOREIGN KEY ([Claim_id]) REFERENCES [dbo].[Claim] ([ClaimId])
);

