/****** CREATED USING GUI Object:  View [dbo].[EmployeePhoneDetails]    Script Date: 2025/03/11 11:05:27 ******/

CREATE VIEW [dbo].[EmployeePhoneDetails]
AS
SELECT TOP (100) PERCENT Person.Person.Title, Person.Person.FirstName, Person.Person.LastName, Person.PersonPhone.PhoneNumber, Person.PhoneNumberType.Name AS PhoneType
FROM     Person.Person INNER JOIN
                  Person.PersonPhone ON Person.Person.BusinessEntityID = Person.PersonPhone.BusinessEntityID INNER JOIN
                  Person.PhoneNumberType ON Person.PersonPhone.PhoneNumberTypeID = Person.PhoneNumberType.PhoneNumberTypeID
WHERE  (Person.Person.Title = N'mr.')
ORDER BY Person.Person.FirstName DESC
GO

SELECT TOP (1000) [Title]
      ,[FirstName]
      ,[LastName]
      ,[PhoneNumber]
      ,[PhoneType]
  FROM [AdventureWorks2022].[dbo].[EmployeePhoneDetails]

  USE [AdventureWorks2022]
GO


