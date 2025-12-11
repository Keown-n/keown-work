CREATE PROCEDURE SelectAllPersonAddress
AS
SELECT * FROM [Person].[Address]
GO

EXEC SelectAllPersonAddress
GO

Drop procedure SelectAllPersonAddress
go

CREATE PROCEDURE SelectAllPersonAddress @city nvarchar(50)
AS
BEGIN

SELECT * FROM [Person].[Address] WHERE City=@city

END


EXEC SelectAllPersonAddress @city = 'new york'
GO

