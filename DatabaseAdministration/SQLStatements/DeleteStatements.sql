

create table salesstaff
(
staffid int not null primary key,
firstname nvarchar(50) not null,
lastname nvarchar(50) not null,
countryregion nvarchar(50) not null
)

go

SELECT * FROM salesstaff
GO

--INSERTS TABLE INTO SALESSTAFF
INSERT INTO salesstaff
SELECT[BusinessEntityID],[FirstName],[LastName],[CountryRegionName] FROM [Sales].[vSalesPerson]
GO

DELETE salesstaff

DELETE FROM salesstaff WHERE countryregion = 'united states'

--------------------------------------------------------------------
--------------TRANSACTION----------------------------------------

BEGIN TRAN

DELETE FROM salesstaff WHERE countryregion = 'united states'

SELECT * FROM salesstaff

Rollback TRAN

SELECT * FROM salesstaff

-----------------------------------------------------------------------
GO

DELETE FROM salesstaff
WHERE staffid IN (SELECT[BusinessEntityID] FROM [Sales].[vSalesPerson] WHERE SalesLastYear = 0) 
--- based of the select query we are deleting staff
GO

----------------JOIN-----------------

DELETE FROM salesstaff 
FROM [Sales].[vSalesPerson] sp
INNER JOIN salesstaff ss
ON sp.BusinessEntityID = ss.staffid
WHERE sp.SalesLastYear =0

GO



