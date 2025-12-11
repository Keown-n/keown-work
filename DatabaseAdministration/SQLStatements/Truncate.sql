SELECT * FROM salesstaff
go

TRUNCATE TABLE salesstaff
go

CREATE TABLE EmployeeNew (
	ID int IDENTITY (1,1) NOT NULL,
	EmployeeName nvarchar(30) NOT NULL,
)
go

SELECT * FROM EmployeeNew
go

USE [AdventureWorks2022]
GO

INSERT INTO [dbo].[EmployeeNew]
           ([EmployeeName])
     VALUES
           ('dion'),('Lenny'),('Kin')
GO

TRUNCATE TABLE EmployeeNew

go