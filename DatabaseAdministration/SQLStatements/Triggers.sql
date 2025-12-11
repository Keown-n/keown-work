USE [AdventureWorks2022]
GO

SELECT [EmpID]
      ,[EmpName]
      ,[EmpTitle]
  FROM [dbo].[Employee]

GO

  -----------------------------------------------------
CREATE TABLE [dbo].[EmployeeTriggerHistory](
	[ID] [int] NULL,
	[Statement] [nchar](10) NULL
) ON [PRIMARY]

GO

select * from [dbo].[EmployeeTriggerHistory]
-----------------------------------------------

CREATE TRIGGER  EmployeeInsert  --Trigger Name
   ON  Employee --Table Name
   AFTER  INSERT -- After the insert operation
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here

	INSERT INTO EmployeeTriggerHistory VALUES ((SELECT max( EmpID) FROM Employee),'Insert')

END
GO

