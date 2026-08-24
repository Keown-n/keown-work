USE [AdventureWorks2022]
GO

SELECT *
  FROM [dbo].[Student]

GO

SELECT *
  FROM [dbo].[Course]

GO

SELECT s.RollNo, s.StudentName, c.CourseID  FROM [dbo].[Student] s
INNER JOIN [dbo].[Course] c
ON s.RollNo = c.RollNo

GO

SELECT s.RollNo, s.StudentName, c.CourseID  FROM [dbo].[Student] s
LEFT JOIN [dbo].[Course] c
ON s.RollNo = c.RollNo

SELECT s.RollNo, s.StudentName, c.CourseID  FROM [dbo].[Student] s
RIGHT JOIN [dbo].[Course] c
ON s.RollNo = c.RollNo

SELECT s.RollNo, s.StudentName, c.CourseID  FROM [dbo].[Student] s
FULL JOIN [dbo].[Course] c
ON s.RollNo = c.RollNo