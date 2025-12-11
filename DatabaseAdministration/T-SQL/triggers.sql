CREATE TRIGGER tr_DepartmentView
ON dbo.DepartmentView
INSTEAD OF DELETE
AS
BEGIN
    SELECT *, 'DepartmentView' FROM deleted
END

BEGIN TRAN
SELECT * FROM DepartmentView 
WHERE TotalAmount = -2.77 AND EmployeeNumber = 132

DELETE FROM DepartmentView 
WHERE TotalAmount = -2.77 AND EmployeeNumber = 132

SELECT * FROM DepartmentView 
WHERE TotalAmount = -2.77 AND EmployeeNumber = 132

ROLLBACK TRAN

ALTER TRIGGER tr_DepartmentView
ON dbo.DepartmentView
INSTEAD OF DELETE
AS
BEGIN
    DECLARE @EmployeeNumber AS INT
    DECLARE @DateOfTransaction AS SMALLDATETIME
    DECLARE @Amount AS SMALLMONEY

    SELECT 
        @EmployeeNumber = EmployeeNumber, 
        @DateOfTransaction = DateOfTransaction,  
        @Amount = TotalAmount
    FROM deleted

    --DELETE matching rows from tblTransaction
    DELETE tblTransaction
END