CREATE TABLE [dbo].[History] (
    [userId]             INT      NOT NULL,
    [bookCopyId]         INT      NOT NULL,
    [borrowTime]         DATETIME NOT NULL,
    [expectedReturnTime] DATETIME NOT NULL,
    [returnTime]         DATETIME NULL,
    CONSTRAINT [FK_History_BookCopy] FOREIGN KEY ([bookCopyId]) REFERENCES [dbo].[BookCopy] ([id]),
    CONSTRAINT [FK_History_User] FOREIGN KEY ([userId]) REFERENCES [dbo].[User] ([id])
);

