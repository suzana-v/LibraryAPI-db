CREATE TABLE [dbo].[User] (
    [id]          INT            IDENTITY (1, 1) NOT NULL,
    [firstName]   NVARCHAR (100) NOT NULL,
    [lastName]    NVARCHAR (100) NOT NULL,
    [dateOfBirth] VARCHAR (20)   NOT NULL,
    CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED ([id] ASC)
);

