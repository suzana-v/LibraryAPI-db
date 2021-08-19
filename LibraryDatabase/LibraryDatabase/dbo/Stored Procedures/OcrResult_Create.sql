-- =============================================
-- Author:		svulinovic
-- Create date: 16.08.2021
-- Description:	Save document OCR result
-- =============================================
CREATE PROCEDURE [dbo].[OcrResult_Create]
    @firstName NVARCHAR(100),
    @lastName NVARCHAR(100),
    @dateOfBirth VARCHAR(20),
    @valid BIT
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;

    INSERT INTO dbo.OcrResult (
                                  firstName,
                                  lastName,
                                  dateOfBirth,
                                  valid
                              )
    VALUES (@firstName, @lastName, @dateOfBirth, @valid);

END;