-- =============================================
-- Author:		svulinovic
-- Create date: 16.08.2021
-- Description:	Borrow a book
-- =============================================
CREATE PROCEDURE [dbo].[Book_Borrow]
    @userId INT,
    @borrowedBooks NVARCHAR(MAX)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;

    BEGIN TRY

        IF NOT EXISTS (
                          SELECT id
                          FROM   dbo.[User]
                          WHERE  id = @userId
                      )
            RAISERROR('USER_NOT_FOUND', 16, 1);

        IF EXISTS (
                      SELECT    bookCopyId
                      FROM
                                OPENJSON(@borrowedBooks)
                                WITH (
                                         bookCopyId INT,
                                         borrowTime DATETIME,
                                         expectedReturnTime DATETIME
                                     ) bb
                      LEFT JOIN dbo.BookCopy bc ON bc.id = bb.bookCopyId
                      WHERE     bc.id IS NULL
                  )
            RAISERROR('BOOK_COPY_NOT_FOUND', 16, 1);

        INSERT INTO dbo.History (
                                    userId,
                                    bookCopyId,
                                    borrowTime,
                                    expectedReturnTime
                                )
        SELECT @userId,
               bookCopyId,
               borrowTime,
               expectedReturnTime
        FROM
               OPENJSON(@borrowedBooks)
               WITH (
                        bookCopyId INT,
                        borrowTime DATETIME,
                        expectedReturnTime DATETIME
                    );

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