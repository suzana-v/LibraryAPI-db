-- =============================================
-- Author:		svulinovic
-- Create date: 16.08.2021
-- Description:	Create user
-- =============================================
CREATE PROCEDURE [dbo].[User_Create]
    @firstName NVARCHAR(100),
    @lastName NVARCHAR(100),
    @dateOfBirth VARCHAR(20)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;

    INSERT INTO dbo.[User] (
                               firstName,
                               lastName,
                               dateOfBirth
                           )
    VALUES (@firstName, @lastName, @dateOfBirth);

END;