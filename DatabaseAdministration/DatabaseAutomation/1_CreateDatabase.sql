USE master;
GO

BEGIN TRY
    CREATE DATABASE AutoTest_KeownNaidoo;
    PRINT 'Database created successfully.';
END TRY
BEGIN CATCH
    PRINT 'Error occurred while creating the database.';
    PRINT ERROR_MESSAGE(); -- Displays the actual error message
END CATCH;
GO
