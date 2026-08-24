--if exists (select * from sys.procedures where name='AverageBalance')
if object_ID('AverageBalance','P') IS NOT NULL
drop proc AverageBalance
go
create proc AverageBalance(@EmployeeNumberFrom int, @EmployeeNumberTo int, @AverageBalance int OUTPUT) as
begin
	SET NOCOUNT ON
	declare @TotalAmount money
	declare @NumOfEmployee int
	begin try

		select @TotalAmount = sum(Amount) from tblTransaction
		where EmployeeNumber between @EmployeeNumberFrom and @EmployeeNumberTo

		select @NumOfEmployee = count(distinct EmployeeNumber) from tblEmployee
		where EmployeeNumber between @EmployeeNumberFrom and @EmployeeNumberTo

		set @AverageBalance = @TotalAmount / @NumOfEmployee

		RETURN 0
	end try
	begin catch
		set @AverageBalance = 0
		SELECT ERROR_MESSAGE() AS EMessage, ERROR_LINE() as ELine,
			   ERROR_NUMBER() as ENumber, ERROR_PROCEDURE() as EProcedure,
			   ERROR_SEVERITY() as ESeverity, ERROR_STATE() as EState
		RETURN 1
	end catch
end
go

DECLARE @AvgBalance int, @ReturnStatus int
EXEC @ReturnStatus = AverageBalance 4, 5, @AvgBalance OUTPUT
select @AvgBalance as Average_Balance, @ReturnStatus as Return_Status
GO


--DECLARE @NumberRows int,@status int
--exec @status=AverageBalance 1102,1105, @NumberRows OUTPUT
--Select @NumberRows as Rows, @status
--go
--DECLARE @NumberRows int
--execute AverageBalance 1104,1111,@NumberRows OUTPUT
--Select @NumberRows as Rows

--go
--DECLARE @NumberRows int
--exec AverageBalance 1105,1125, @NumberRows OUTPUT
--Select @NumberRows as Rows