CREATE TABLE [dbo].[ValueCode] (
    [ValueCodeId] INT             IDENTITY (1, 1) NOT NULL,
    [Code]        NVARCHAR (255)  NULL,
    [Amount]      DECIMAL (19, 2) NULL,
    [Claim_id]    INT             NULL,
    CONSTRAINT [PK_ValueCode_ValueCodeId] PRIMARY KEY CLUSTERED ([ValueCodeId] ASC),
    CONSTRAINT [FK_ValueCode_Claim_id_TO_Claim_ClaimId] FOREIGN KEY ([Claim_id]) REFERENCES [dbo].[Claim] ([ClaimId])
);



