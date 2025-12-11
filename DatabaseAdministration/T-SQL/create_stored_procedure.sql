--if exists (select * from sys.procedures where name='NameEmployees')
if object_ID('NameEmployees','P') IS NOT NULL
drop proc NameEmployees
go
create proc NameEmployees(@EmployeeNumber int) as
begin
	if exists (Select * from tblEmployee where EmployeeNumber = @EmployeeNumber)
	begin
		if @EmployeeNumber < 300
		begin
			select EmployeeNumber, EmployeeFirstName, EmployeeLastName
			from tblEmployee
			where EmployeeNumber = @EmployeeNumber
		end
		else
		begin
			select EmployeeNumber, EmployeeFirstName, EmployeeLastName, Department
			from tblEmployee
			where EmployeeNumber = @EmployeeNumber			
			select * from tblTransaction where EmployeeNumber = @EmployeeNumber
		end
	end
end
go

NameEmployees 1102
execute NameEmployees 1104
exec NameEmployees 1105

-----------------------------------------------------------------------
--if exists (select * from sys.procedures where name='NameEmployees')
if object_ID('NameEmployees','P') IS NOT NULL
drop proc NameEmployees
go
create proc NameEmployees(@EmployeeNumberFrom int, @EmployeeNumberTo int) as
begin
	if exists (Select * from tblEmployee where EmployeeNumber between @EmployeeNumberFrom and @EmployeeNumberTo)
	begin
		select EmployeeNumber, EmployeeFirstName, EmployeeLastName
		from tblEmployee
		where EmployeeNumber between @EmployeeNumberFrom and @EmployeeNumberTo
	end
end
go

NameEmployees 1102,1105
execute NameEmployees 1104,1111
exec NameEmployees 1105,1125