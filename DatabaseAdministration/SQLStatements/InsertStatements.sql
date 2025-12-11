USE [AdventureWorks2022]
GO

SELECT *
  FROM [dbo].[salestaff]

GO

INSERT INTO salestaff ([satffId],[fName],[lName]) VALUES (200,'Abby', 'Lee')

INSERT INTO salestaff ([satffId],[fName],[lName]) VALUES (300,'Bob', 'Lee')
INSERT INTO salestaff ([satffId],[fName],[lName]) VALUES (500,'John', 'Lee')
INSERT INTO salestaff ([satffId],[fName],[lName]) VALUES (400,'Owne', 'Lee')

Go

USE [AdventureWorks2022]
GO

/****** Object:  Table [dbo].[salestaff]    Script Date: 2025/03/11 14:14:43 ******/


CREATE TABLE [dbo].[salestaffNEW](
	ID int not null identity Primary Key,
	[satffId] [int] NOT NULL,
	[fName] [nvarchar](30) NOT NULL,
	[lName] [nvarchar](30) NOT NULL,
)
GO

SELECT *
  FROM [dbo].[salestaffNEW]

GO

INSERT INTO salestaffNEW ([satffId],[fName],[lName]) VALUES (200,'Abby', 'Lee')
INSERT INTO salestaffNEW ([satffId],[fName],[lName]) VALUES (300,'Bob', 'Lee')
INSERT INTO salestaffNEW ([satffId],[fName],[lName]) VALUES (500,'John', 'Lee')
INSERT INTO salestaffNEW ([satffId],[fName],[lName]) VALUES (400,'Owne', 'Lee')

GO


-----------------------------------------------------------
CREATE TABLE [dbo].[Name](
	[fName] [nvarchar](30) NOT NULL,
	[lName] [nvarchar](30) NOT NULL,
)
GO

SELECT *
  FROM [dbo].[Name]

GO

INSERT Name (fName,lName)
SELECT fName,lName FROM salestaffNEW 

GO

------------------------
SELECT * INTO salesstaffNEW_bkp FROM salestaffNEW ---Creates a new table with everything with but different name
GO

SELECT *
  FROM [dbo].[salesstaffNEW_bkp]

GO


