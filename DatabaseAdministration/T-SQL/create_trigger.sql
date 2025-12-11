
CREATE TRIGGER nametrigger
    ON [dbo].[tblTransaction]
    FOR DELETE, INSERT, UPDATE
    AS
    BEGIN
	select * from inserted
	select * from deleted
    SET NOCOUNT ON
    END
go 
BEGIN TRAN
insert into tblTransaction(Amount, DateOfTransaction, EmployeeNumber)
VALUES (123,'2015-07-10', 123)
--delete tblTransaction 
--where EmployeeNumber = 123 and DateOfTransaction = '2015-07-10'
ROLLBACK TRAN
