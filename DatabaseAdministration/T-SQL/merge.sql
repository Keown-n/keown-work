BEGIN TRAN
MERGE INTO tblTransaction as T --Target
USING tblTransactionNew as S --Source
ON T.EmployeeNumber = S.EmployeeNumber AND T.DateOfTransaction = S.DateOfTransaction
WHEN MATCHED THEN
    UPDATE SET Amount = T.Amount + S.Amount
WHEN NOT MATCHED BY TARGET THEN -- when it is in source and not targert so it inserts data from the source to the target
    INSERT ([Amount], [DateOfTransaction], [EmployeeNumber])
	VALUES (S.Amount, S.DateOfTransaction, S.EmployeeNumber);
ROLLBACK TRAN

-- tblTransaction (no) - tblTransactionNew (yes)
-- 1 tblTransaction - 1 tblTransactionNew
-- 1 tblTransaction - multiple rows TblTransactionNew

SELECT DateOfTransaction, EmployeeNumber, COUNT(*) AS NumberOfRows
FROM tblTransactionNew 
GROUP BY DateOfTransaction, EmployeeNumber
HAVING COUNT(*)>1

--BEGIN TRAN
--go
--DISABLE TRIGGER nametrigger ON dbo.tblTransaction
--GO
--MERGE INTO tblTransaction as T
--USING (SELECT DateOfTransaction, EmployeeNumber, MIN(Amount) as Amount
--      FROM tblTransactionNew
--	  GROUP BY DateOfTransaction, EmployeeNumber) as S
--ON T.EmployeeNumber = S.EmployeeNumber AND
--	T.DateOfTransaction = S.DateOfTransaction
--WHEN MATCHED THEN
--    UPDATE SET Amount = T.Amount + S.Amount
--WHEN NOT MATCHED THEN
--	INSERT (Amount, DateOfTransaction, EmployeeNumber)
--	VALUES (S.Amount, S.DateOfTransaction, S.EmployeeNumber)
--	OUTPUT deleted.*, inserted.*;
--ROLLBACK TRAN

BEGIN TRAN
ALTER TABLE tblTransaction
ADD Comments varchar(50) NULL
GO -- DDL
DISABLE TRIGGER nametrigger ON dbo.tblTransaction
go
MERGE TOP (5) PERCENT INTO tblTransaction as T --DML
USING (select EmployeeNumber, DateOfTransaction, sum(Amount) as Amount
from tblTransactionNew
group by EmployeeNumber, DateOfTransaction) as S
ON T.EmployeeNumber = S.EmployeeNumber AND T.DateOfTransaction = S.DateOfTransaction
WHEN MATCHED AND T.Amount + S.Amount >0 THEN
    UPDATE SET Amount = T.Amount + S.Amount, Comments = 'Updated Row'
WHEN MATCHED THEN
	DELETE
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Amount], [DateOfTransaction], [EmployeeNumber], Comments)
	VALUES (S.Amount, S.DateOfTransaction, S.EmployeeNumber, 'Inserted Row')
WHEN NOT MATCHED BY SOURCE THEN
	UPDATE SET Comments = 'Unchanged'
OUTPUT inserted.*, deleted.* , $action;
--Select * from tblTransaction ORDER BY EmployeeNumber, DateOfTransaction
ROLLBACK TRAN

