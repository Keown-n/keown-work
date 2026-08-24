SELECT TOP (1000) [EmpID]
      ,[EmpName]
      ,[EmpTitle]
  FROM [AdventureWorks2022].[dbo].[Employee]

  SELECT [EmpID]
      ,[EmpName]
      ,[SalesNumber]
      ,[ItemSold]
  FROM [dbo].[Sales]


  SELECT * FROM [dbo].[Employee] as e
  JOIN [dbo].[Sales] as s
  ON e.EmpID = s.EmpID
  ORDER BY e.EmpID

    SELECT COUNT(s.SalesNumber) as NoOfSales, e.EmpID, e.EmpName FROM [dbo].[Employee] as e
  JOIN [dbo].[Sales] as s
  ON e.EmpID = s.EmpID
  GROUP BY  e.EmpID, e.EmpName
 