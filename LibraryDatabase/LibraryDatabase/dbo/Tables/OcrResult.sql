CREATE TABLE [dbo].[OcrResult] (
    [firstName]   NVARCHAR (100) NULL,
    [lastName]    NVARCHAR (100) NULL,
    [dateOfBirth] VARCHAR (50)   NULL,
    [valid]       BIT            CONSTRAINT [DF_Document_validated] DEFAULT ((0)) NOT NULL
);

