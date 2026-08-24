---COMMENTS
CREATE TABLE [AdventureWorks2022].[sales].[visits](
visits_id INT PRIMARY KEY IDENTITY (1,1), 
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
vistited_at DATETIME,
phone VARCHAR(20) NOT NULL,
store_id INT NOT NULL,
FOREIGN KEY (store_id) REFERENCES sales.storeNew (store_id)
)

CREATE TABLE [AdventureWorks2022].[sales].[storeNew](
store_id INT NOT NULL,
sales INT
)          /*** SET store_id as primary key using the design option****/

/*** Method one****/
SELECT [BusinessEntityID],[FirstName],[LastName],[Title]
INTO  /*** This creates the temp table****/
FROM [Person].[Person]
WHERE Title ='mr.';

SELECT [BusinessEntityID],[FirstName],[LastName],[Title]
FROM #TempPersonTable

DROP TABLE #TempPersonTable;

/*** Method 2****/

CREATE TABLE #TempPersonTable (
[BusinessEntityID] INT,
[FirstName] NVARCHAR(50),
[LastName] NVARCHAR(50),
[Title] NVARCHAR(50)
)

INSERT INTO #TempPersonTable
SELECT [BusinessEntityID],[FirstName],[LastName],[Title]
FROM [Person].[Person]
WHERE Title ='mr.';
