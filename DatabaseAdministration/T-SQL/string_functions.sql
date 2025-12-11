DECLARE @chrASCII as varchar(10) = 'hellothere'

DECLARE @chrUNICODE as nvarchar(10) = N'helloϞ'

select left(@chrASCII,2) as myASCII, right(@chrUNICODE,2) as myUNICODE
select substring(@chrASCII,3,2) as middleletters
select ltrim(rtrim(@chrASCII)) as myTRIM
select replace(@chrASCII,'l','K') as myReplace
select upper(@chrASCII) as myUPPER
select lower(@chrASCII) as myLOWER

DECLARE @name as nvarchar(10) = 'John'
DECLARE @Mname as nvarchar(10) --= 'waler'
DECLARE @Lname as nvarchar(10) = 'stone'

--select @name + ' ' + @Mname + ' '+ @Lname As Fullname
select @name +  iif(@Mname is null, ' ',  ' '+ @Mname)+ ' '+  @Lname As Fullname
SELECT CONCAT(@name,' ' + @Mname, ' ' , @Lname) as FullName
-----------------------------------------------------------------
SELECT 'My number is: ' + 4567 -- gives an error

SELECT 'My number is: ' + convert(varchar(20),4567)
SELECT 'My number is: ' + cast(4567 as varchar(20))

SELECT 'My salary is: $' + convert(varchar(20),2345.6)
SELECT 'My salary is: ' + format(2345.6,'C','fr-FR')
