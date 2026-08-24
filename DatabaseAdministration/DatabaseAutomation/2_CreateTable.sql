USE [AutoTest_KeownNaidoo];
GO

BEGIN TRY
    CREATE TABLE [user] (
        FirstName NVARCHAR(50) NOT NULL,
        Surname NVARCHAR(50) NOT NULL,
        Email NVARCHAR(100) NOT NULL
    );
    PRINT 'Table created successfully.';
END TRY
BEGIN CATCH
    PRINT 'Error occurred while creating the table.';
    PRINT ERROR_MESSAGE(); -- Displays the actual error message
END CATCH;
GO
