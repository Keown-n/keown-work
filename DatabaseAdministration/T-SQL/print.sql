--if exists (select * from sys.procedures where name='AverageBalance')
if object_ID('AverageBalance','P') IS NOT NULL
drop proc AverageBalance
go
create proc AverageBalance(@EmployeeNumberFrom int, @EmployeeNumberTo int, @AverageBalance int OUTPUT) as
begin
	SET NOCOUNT ON
	declare @TotalAmount decimal(5,2)
	declare @NumOfEmployee int
	begin try
		print 'The employee numbers are from ' + convert(varchar(10),@EmployeeNumberFrom) 
		      + ' to ' + convert(varchar(10),@EmployeeNumberTo)
		select @TotalAmount = sum(Amount) from tblTransaction
		where EmployeeNumber between @EmployeeNumberFrom and @EmployeeNumberTo
		select @NumOfEmployee = count(distinct EmployeeNumber) from tblEmployee
		where EmployeeNumber between @EmployeeNumberFrom and @EmployeeNumberTo
		set @AverageBalance = @TotalAmount / @NumOfEmployee
		RETURN 0
	end try
	begin catch
		set @AverageBalance = 0
		if ERROR_NUMBER() = 8134 -- @@ERROR
		begin
			set @AverageBalance = 0
			print 'There are no valid employees in this range.'
			Return 8134
		end
		else
		    declare @ErrorMessage as varchar(255)
			select @ErrorMessage = error_Message()
			raiserror (@ErrorMessage, 16, 1)
		
		select 'Hello There'
	end catch
end
go
