CREATE TABLE [dbo].[BookCopy] (
    [id]          INT            IDENTITY (1, 1) NOT NULL,
    [description] NVARCHAR (500) NULL,
    [bookId]      INT            NOT NULL,
    CONSTRAINT [PK_BookCopy] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_BookCopy_Book] FOREIGN KEY ([bookId]) REFERENCES [dbo].[Book] ([id])
);

