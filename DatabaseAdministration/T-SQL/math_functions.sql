DECLARE @myvar AS numeric(7,2) = 3

Select POWER(@myvar,3)
SELECT POWER(@myvar,3) 
SELECT SQUARE(@myvar)
SELECT POWER(@myvar,0.5)
GO

DECLARE @myvar AS numeric(7,2) = 3.7

Select FLOOR(@myvar) as myfloor
Select CEILING(@myvar) as myceiling
Select ROUND(@myvar,1) as myround
GO

SELECT PI() as myPI
SELECT EXP(1) as e
GO

DECLARE @myvar AS NUMERIC(7,2) = -456

SELECT ABS(@myvar) as myABS, SIGN(@myvar) as mySign
go

DECLARE @myvar AS NUMERIC(7,2) = 456.256

SELECT ABS(@myvar) as myABS, SIGN(@myvar) as mySign
go


SELECT RAND(555)

go

-- IMPLICIT

DECLARE @myvar as Decimal(5,2) = 3

SELECT @myvar

-- explicit

SELECT CONVERT(decimal(5,2),3)/2 -- 3 is the int

SELECt CAST(3 as decimal(5,2))/2 -- 3 is being casted as a decimal

SELECT CONVERT(INT,12.345)+CONVERT(INT,12.7) 
SELECT CONVERT(INT,12.345+12.7) 

