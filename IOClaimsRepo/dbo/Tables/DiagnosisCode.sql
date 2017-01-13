CREATE TABLE [dbo].[DiagnosisCode] (
    [DiagnosisCodeId]    INT            IDENTITY (1, 1) NOT NULL,
    [Code]               NVARCHAR (255) NULL,
    [Sequence]           INT            NULL,
    [ServiceLine_id]     INT            NULL,
    [PresentOnAdmission] VARCHAR (4)    NULL,
    CONSTRAINT [PK_DiagnosisCode_DiagnosisCodeId] PRIMARY KEY NONCLUSTERED ([DiagnosisCodeId] ASC),
    CONSTRAINT [FK_DiagnosisCode_ServiceLine_id_TO_ServiceLine_ServiceLineId] FOREIGN KEY ([ServiceLine_id]) REFERENCES [dbo].[ServiceLine] ([ServiceLineId])
);




GO
CREATE CLUSTERED INDEX [diagnosiscodeid_servicelineid_idx]
    ON [dbo].[DiagnosisCode]([ServiceLine_id] ASC, [DiagnosisCodeId] ASC);

