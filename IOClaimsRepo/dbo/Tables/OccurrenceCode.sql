CREATE TABLE [dbo].[OccurrenceCode] (
    [OccurrenceCodeId] INT            IDENTITY (1, 1) NOT NULL,
    [Code]             NVARCHAR (255) NULL,
    [BeginDate]        DATETIME       NULL,
    [EndDate]          DATETIME       NULL,
    [Claim_id]         INT            NULL,
    CONSTRAINT [PK_OccurrenceCode_OccurrenceCodeId] PRIMARY KEY CLUSTERED ([OccurrenceCodeId] ASC),
    CONSTRAINT [FK_OccurrenceCode_Claim_id_TO_Claim_ClaimId] FOREIGN KEY ([Claim_id]) REFERENCES [dbo].[Claim] ([ClaimId])
);



