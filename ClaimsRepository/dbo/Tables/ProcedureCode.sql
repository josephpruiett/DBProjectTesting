CREATE TABLE [dbo].[ProcedureCode] (
    [ProcedureCodeId] INT          IDENTITY (1, 1) NOT NULL,
    [Code]            VARCHAR (30) NULL,
    [Sequence]        INT          NULL,
    [ServiceLine_id]  INT          NULL,
    [proceduredate]   DATETIME     NULL,
    PRIMARY KEY NONCLUSTERED ([ProcedureCodeId] ASC),
    CONSTRAINT [FK_PROCCODE_TO_SERVICELINE] FOREIGN KEY ([ServiceLine_id]) REFERENCES [dbo].[ServiceLine] ([ServiceLineId])
);

