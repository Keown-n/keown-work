declare @myvar as int

select @myvar as mycol -- Returns NULL because SQL doesnt know the value

declare @mystring as nvarchar(20)
select datalength(@mystring) as mystring

