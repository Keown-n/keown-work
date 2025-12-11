--if exists (select * from sys.procedures where name='NameEmployees')
if object_ID('NameEmployees','P') IS NOT NULL
drop proc NameEmployees
go
create proc NameEmployees(@EmployeeNumberFrom int, @EmployeeNumberTo int, @NumberOfRows int OUTPUT) as
begin
	if exists (Select * from tblEmployee where EmployeeNumber between @EmployeeNumberFrom and @EmployeeNumberTo)
	begin
		select EmployeeNumber, EmployeeFirstName, EmployeeLastName
		from tblEmployee
		where EmployeeNumber between @EmployeeNumberFrom and @EmployeeNumberTo
		SET @NumberOfRows = @@ROWCOUNT
		RETURN 0
	end
	ELSE
	BEGIN
	    SET @NumberOfRows = 0
		RETURN 1
	END
end
go
DECLARE @NumberRows int,@status int
exec @status=NameEmployees 1102,1105, @NumberRows OUTPUT
Select @NumberRows as Rows, @status
go
DECLARE @NumberRows int
execute NameEmployees 1104,1111,@NumberRows OUTPUT
Select @NumberRows as Rows

go
DECLARE @NumberRows int
exec NameEmployees 1105,1125, @NumberRows OUTPUT
Select @NumberRows as Rows