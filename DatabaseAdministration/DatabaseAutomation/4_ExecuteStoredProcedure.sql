USE AutoTest_KeownNaidoo;
GO

BEGIN TRY
    EXEC sp_InsertUser @FirstName = 'John', @Surname = 'Stone', @Email = 'Stone@gmail.com';
    PRINT 'User inserted successfully.';
END TRY
BEGIN CATCH
    PRINT 'Error occurred while inserting the user.';
    PRINT ERROR_MESSAGE(); -- Displays the actual error message
END CATCH;
GO
