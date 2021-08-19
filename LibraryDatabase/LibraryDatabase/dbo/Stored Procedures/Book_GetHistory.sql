-- =============================================
-- Author:		svulinovic
-- Create date: 16.08.2021
-- Description:	Get book borrow history
-- =============================================
CREATE PROCEDURE [dbo].[Book_GetHistory]
    @bookId INT
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;

    BEGIN TRY

        IF NOT EXISTS (
                          SELECT id
                          FROM   dbo.Book
                          WHERE  id = @bookId
                      )
            RAISERROR('BOOK_NOT_FOUND', 16, 1);

        SELECT b.title AS bookTitle,
               (
                   SELECT     u.firstName AS userFirstName,
                              u.lastName AS userLastName,
                              FORMAT(h.borrowTime, 'yyyy-MM-dd hh:mm:ss') AS borrowTime,
                              FORMAT(h.returnTime, 'yyyy-MM-dd hh:mm:ss') AS returnTime
                   FROM       dbo.History h
                   INNER JOIN dbo.[User] u ON u.id = h.userId
                   INNER JOIN dbo.BookCopy bc ON bc.id = h.bookCopyId AND
                                                 bc.bookId = b.id
                   FOR JSON PATH
               ) AS historyEntriesJson
        FROM   dbo.Book b
        WHERE  b.id = @bookId;

    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000),
                @ErrorSeverity INT,
                @ErrorState INT;
        SELECT @ErrorMessage = ERROR_MESSAGE(),
               @ErrorSeverity = ERROR_SEVERITY(),
               @ErrorState = ERROR_STATE();
        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;

END;