CREATE TABLE [dbo].[ProcedureCode] (
    [ProcedureCodeId] INT          IDENTITY (1, 1) NOT NULL,
    [Code]            VARCHAR (30) NULL,
    [Sequence]        INT          NULL,
    [ServiceLine_id]  INT          NULL,
    [ProcedureDate]   DATETIME     NULL,
    CONSTRAINT [PK_ProcedureCode_ProcedureCodeId] PRIMARY KEY NONCLUSTERED ([ProcedureCodeId] ASC),
    CONSTRAINT [FK_ProcedureCode_ServiceLine_id_TO_ServiceLine_ServiceLineId] FOREIGN KEY ([ServiceLine_id]) REFERENCES [dbo].[ServiceLine] ([ServiceLineId])
);



