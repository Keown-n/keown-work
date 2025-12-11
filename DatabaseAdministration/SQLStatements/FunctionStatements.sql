USE [AdventureWorks2022]
GO

SELECT max(rate)
  FROM [HumanResources].[EmployeePayHistory]

GO
print upper('dotnet')
print lower('DDDDDD')
print convert(int,234.44444)
print getdate()
print day(getdate())

go

-----------------------------------------------------
-----------USER DEFINED FUNCTIONS-----------------------
-----------------------------------------------------

CREATE TABLE [dbo].[FunctionEmployee](
	[EmpID] [int] NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Salary] [int] NULL,
	[Address] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[EmpID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
---------------------------------------

insert into [FunctionEmployee] ([EmpID],[FirstName],[LastName],[Salary],[Address]) values (1,'Abbas','Mehmood', 20000, 'Delhi')
insert into [FunctionEmployee] ([EmpID],[FirstName],[LastName],[Salary],[Address]) values (2,'Imran','Afzal', 50000, 'Delhi')
insert into [FunctionEmployee] ([EmpID],[FirstName],[LastName],[Salary],[Address]) values (3,'James','Dino', 90000, 'Delhi')
insert into [FunctionEmployee] ([EmpID],[FirstName],[LastName],[Salary],[Address]) values (4,'Jaga','Babu', 70000, 'Delhi')

-------------------------------------------
SELECT * FROM FunctionEmployee

------------------------------------------
CREATE FUNCTION fnGetEmployeeFullName
(@Fname nvarchar(50),@Lname nvarchar(50))
RETURNS varchar(100)

AS
BEGIN

RETURN(SELECT @Fname +' ' + @Lname);

END

SELECT dbo.fnGetEmployeeFullName (FirstName,LastName)as FullName, Salary  FROM FunctionEmployee

GO
-----------------------------------------------
-------INLINE TABLE FUNCTION----------------
CREATE FUNCTION fnGetEmp()
returns table
as
return(Select * from FunctionEmployee)

select * from dbo.fnGetEmp()

go

CREATE FUNCTION fnGetMulEmp()
returns @emp table(
	empid int,
	fname nvarchar(50),
	salary int
)
as
begin
Insert into @Emp Select e.EmpID,e.FirstName,e.Salary from FunctionEmployee e;
--Now update salary of first employee
 update @Emp set Salary=25000 where EmpID=1;
--It will update only in @Emp table not in Original Employee table
return
end 
GO
select * from dbo.fnGetMulEmp()





