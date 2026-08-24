USE [AutoTest_KeownNaidoo];
GO

BEGIN TRY
    CREATE PROCEDURE sp_InsertUser
        @FirstName NVARCHAR(50),
        @Surname NVARCHAR(50),
        @Email NVARCHAR(100)
    AS
    BEGIN
        INSERT INTO [user] (FirstName, Surname, Email)
        VALUES (@FirstName, @Surname, @Email);
    END;
    PRINT 'Stored procedure created successfully.';
END TRY
BEGIN CATCH
    PRINT 'Error occurred while creating the stored procedure.';
    PRINT ERROR_MESSAGE(); -- Displays the actual error message
END CATCH;
GO
