SELECT 
	FirstName +' ' + LastName as FullName,
	TerritoryName,
	TerritoryGroup,
	SalesQuota,
	SalesYTD,
	SalesLastYear
INTO SaleStaff
FROM Sales.vSalesPerson
GO

SELECT * FROM Sales.vSalesPerson -- VIEW
GO

SELECT * FROM SaleStaff --NEW TABLE
GO
-----------------------------------------------------------
-----------------------------------------------------------

UPDATE SaleStaff SET SalesQuota = 500000.00
UPDATE SaleStaff SET SalesQuota = SalesQuota + 1500000.00
UPDATE SaleStaff SET SalesQuota = SalesQuota + 1500000.00, SalesYTD = SalesYTD-500, SalesLastYear =SalesLastYear *1.50

UPDATE SaleStaff SET TerritoryName = 'UK' where TerritoryName = 'United Kingdom'
UPDATE SaleStaff SET TerritoryName = 'UK' where TerritoryName is null and FullName = 'Syed Abbas'

UPDATE SaleStaff SET SalesQuota = sp.SalesQuota 
FROM SaleStaff ss
INNER JOIN Sales.vSalesPerson sp
ON ss.FullName = (sp.FirstName +' ' + sp.LastName)

GO


