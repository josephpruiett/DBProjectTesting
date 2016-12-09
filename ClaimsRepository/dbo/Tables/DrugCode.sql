CREATE TABLE [dbo].[DrugCode] (
    [DrugCodeId]     INT            IDENTITY (1, 1) NOT NULL,
    [Code]           NVARCHAR (255) NULL,
    [Units]          NVARCHAR (255) NULL,
    [ServiceLine_id] INT            NULL,
    PRIMARY KEY NONCLUSTERED ([DrugCodeId] ASC),
    CONSTRAINT [FK_ServiceLine] FOREIGN KEY ([ServiceLine_id]) REFERENCES [dbo].[ServiceLine] ([ServiceLineId])
);

