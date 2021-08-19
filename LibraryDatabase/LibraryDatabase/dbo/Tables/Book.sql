CREATE TABLE [dbo].[Book] (
    [id]    INT            IDENTITY (1, 1) NOT NULL,
    [title] NVARCHAR (200) NOT NULL,
    CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED ([id] ASC)
);

