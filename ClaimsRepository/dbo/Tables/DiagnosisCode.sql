CREATE TABLE [dbo].[DiagnosisCode] (
    [DiagnosisCodeId]    INT            IDENTITY (1, 1) NOT NULL,
    [Code]               NVARCHAR (255) NULL,
    [Sequence]           INT            NULL,
    [ServiceLine_id]     INT            NULL,
    [PresentOnAdmission] VARCHAR (4)    NULL,
    PRIMARY KEY NONCLUSTERED ([DiagnosisCodeId] ASC),
    CONSTRAINT [FK173E1A768FFAD32A] FOREIGN KEY ([ServiceLine_id]) REFERENCES [dbo].[ServiceLine] ([ServiceLineId])
);


GO
CREATE CLUSTERED INDEX [diagnosiscodeid_servicelineid_idx]
    ON [dbo].[DiagnosisCode]([ServiceLine_id] ASC, [DiagnosisCodeId] ASC);

