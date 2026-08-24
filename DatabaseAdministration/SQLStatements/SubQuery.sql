USE [AdventureWorks2022]
GO

SELECT *
  FROM [HumanResources].[EmployeePayHistory]
  WHERE BusinessEntityID IN (SELECT BusinessEntityID FROM HumanResources.EmployeePayHistory WHERE Rate>60)

GO

SELECT *
  FROM [HumanResources].[EmployeePayHistory]
  WHERE Rate > 60
  GO

  ----------------------------------------------------------------

SELECT*
  FROM [Production].[Product]
  WHERE ProductID in ( SELECT ProductID FROM [Production].[ProductInventory] WHERE Quantity>500)

GO


SELECT *
  FROM [Production].[ProductInventory]

GO




