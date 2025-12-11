declare @mydate as datetime = '2015-06-24 12:34:56.124'
select @mydate as myDate

declare @mydate2 as datetime2(3) = '20150624 12:34:56.124'
select @mydate2 as MyDate

select DATEFROMPARTS(2015,06,24) as ThisDate
select DATETIME2FROMPARTS(2015,06,24,12,34,56,124,5) as ThatDate
select year(@mydate) as myYear, month(@mydate) as myMonth, day(@mydate) as myDay

SELECT CURRENT_TIMESTAMP as RightNow
select getdate() as RightNow
select SYSDATETIME() AS RightNow
select dateadd(year,1,'2015-01-02 03:04:05') as myYear
select datepart(hour,'2015-01-02 03:04:05') as myHour
select datename(weekday, getdate()) as myAnswer
select datediff(second,'2015-01-02 03:04:05',getdate()) as SecondsElapsed
go
------------------------------------------------------
declare @mydate as datetime = '2015-06-25 01:02:03.456'
select 'The date and time is: ' + @mydate
go
declare @mydate as datetime = '2015-06-25 01:02:03.456'
select 'The date and time is: ' + convert(nvarchar(20),@mydate,104) as MyConvertedDate
go
declare @mydate as datetime = '2015-06-25 01:02:03.456'
select cast(@mydate as nvarchar(20)) as MyCastDate

select try_convert(date,'Thursday, 25 June 2015') as MyConvertedDate
select parse('Thursday, 25 June 2015' as date) as PDate

select format(cast('2015-06-25 01:02:03.456' as datetime),'D') as LDate
select format(cast('2015-06-25 01:02:03.456' as datetime),'d') as SDate
select format(cast('2015-06-25 01:59:03.456' as datetime),'dd-MM-yyyy') as BritshDate
select format(cast('2015-06-25 01:02:03.456' as datetime),'D','zh-CN') as InternationalLDate
