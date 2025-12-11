 USE [AdventureWorks2022]
 GO

 SELECT * FROM [Person].[Address]

 SELECT [AddressID],[AddressLine1],[ModifiedDate] FROM [Person].[Address]

 

SELECT [AddressID]
      ,[AddressLine1]
      ,[AddressLine2]
      ,[City]
      ,[StateProvinceID]
      ,[PostalCode]
      ,[SpatialLocation]
      ,[rowguid]
      ,[ModifiedDate]
  FROM [Person].[Address]

GO

------------------SELECT STATEMENTS-------------------------------
SELECT * FROM [Person].[Address] WHERE PostalCode = '98011'

SELECT * FROM [Person].[Address] WHERE PostalCode != '98011'

SELECT count(*) AS [No. of address] FROM [Person].[Address] WHERE PostalCode <> '98011'

SELECT * FROM [Person].[Address] WHERE ModifiedDate <= '2013-11-08'

SELECT * FROM [Person].[Person] WHERE FirstName LIKE '%ew'

SELECT MAX(Rate) as PayRate FROM [HumanResources].[EmployeePayHistory];

SELECT MIN(Rate) as PayRate FROM [HumanResources].[EmployeePayHistory];

SELECT * FROM [Production].[ProductCostHistory] 

SELECT * FROM [Production].[ProductCostHistory] 
WHERE StartDate = '2013-05-30 00:00:00.000';

SELECT * FROM [Production].[ProductCostHistory] 
WHERE StartDate = '2013-05-30 00:00:00.000' AND StandardCost >= 200.00;

SELECT * FROM [Production].[ProductCostHistory] 
WHERE (StartDate = '2013-05-30 00:00:00.000' AND StandardCost >= 200.00) 
OR ProductID > 800;

SELECT * FROM [Production].[ProductCostHistory] 
WHERE ProductID IN (802, 803, 820, 900);

SELECT * FROM [Production].[ProductCostHistory] 
WHERE EndDate IS NOT NULL

SELECT * FROM [Production].[ProductCostHistory] 
WHERE EndDate IS NULL

-----------------------------------------------------
----------------------ORDER BY ----------------------
-- Sorting Queries
SELECT * FROM [HumanResources].[EmployeePayHistory] 
ORDER BY Rate;

SELECT * FROM [HumanResources].[EmployeePayHistory] 
ORDER BY Rate ASC;

SELECT * FROM [HumanResources].[EmployeePayHistory] 
ORDER BY Rate DESC;

-- Filtering by ModifiedDate
SELECT * FROM [HumanResources].[EmployeePayHistory] 
WHERE ModifiedDate >= '2010-06-30 00:00:00' 
ORDER BY ModifiedDate DESC;

SELECT * FROM [HumanResources].[EmployeePayHistory] 
WHERE YEAR(ModifiedDate) >= 2014 
ORDER BY ModifiedDate DESC;

SELECT * FROM [HumanResources].[EmployeePayHistory] 
WHERE MONTH(ModifiedDate) = 6 
ORDER BY ModifiedDate DESC;

---------------------------------------------------------------
-- GROUP BY Queries
---------------------------------------------------------------

SELECT * FROM Person.Address 
WHERE PostalCode = '98011';

SELECT COUNT(*) FROM Person.Address 
WHERE PostalCode = '98011';

SELECT COUNT(PostalCode) as Addresses, PostalCode FROM Person.Address 
GROUP BY PostalCode;

SELECT COUNT(*) AS NoOfAddresses, PostalCode FROM Person.Address 
GROUP BY PostalCode;

SELECT COUNT(*) AS NoOfAddresses, PostalCode FROM Person.Address 
GROUP BY PostalCode 
ORDER BY PostalCode;

SELECT COUNT(*), City FROM Person.Address 
GROUP BY City;

SELECT COUNT(*), City, PostalCode FROM Person.Address 
GROUP BY City, PostalCode;

---------------------------------------------------------------
-- HAVING Clause Queries
---------------------------------------------------------------

SELECT * FROM Production.Product;

SELECT COUNT(*) AS CountOfProduct, Color FROM Production.Product 
WHERE Color = 'Yellow' 
GROUP BY Color;

SELECT COUNT(*) AS CountOfProduct, Color FROM Production.Product 
GROUP BY Color 
HAVING Color = 'Yellow';

SELECT COUNT(*) AS CountOfProduct, Color, Size FROM Production.Product 
GROUP BY Color, Size 
HAVING Size >= 44;



