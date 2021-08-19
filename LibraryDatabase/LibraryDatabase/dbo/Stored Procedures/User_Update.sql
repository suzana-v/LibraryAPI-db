-- =============================================
-- Author:		svulinovic
-- Create date: 16.08.2021
-- Description:	Update user
-- =============================================
CREATE PROCEDURE [dbo].[User_Update]
    @id INT,
    @firstName NVARCHAR(100),
    @lastName NVARCHAR(100),
    @dateOfBirth VARCHAR(20)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;

    BEGIN TRY

        IF NOT EXISTS (
                          SELECT id
                          FROM   dbo.[User]
                          WHERE  id = @id
                      )
            RAISERROR('USER_NOT_FOUND', 16, 1);

        UPDATE dbo.[User]
        SET    firstName = @firstName,
               lastName = @lastName,
               dateOfBirth = @dateOfBirth
        WHERE  id = @id;

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