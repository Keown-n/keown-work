USE [AdventureWorks2022]
CREATE TABLE SQLBackupRestoreTest1 (
	ID INT NOT NULL PRIMARY KEY,
	loginname VARCHAR(100) NOT NULL,
	logindate DATETIME NOT NULL DEFAULT getdate()
)
GO


select *  from SQLBackupRestoreTest1
-- 21 rows
insert into SQLBackupRestoreTest1 (ID,loginname) values (1, 'test1')
insert into SQLBackupRestoreTest1 (ID,loginname) values (2, 'test2')
insert into SQLBackupRestoreTest1 (ID,loginname) values (3, 'test3')
insert into SQLBackupRestoreTest1 (ID,loginname) values (4, 'test4')
insert into SQLBackupRestoreTest1 (ID,loginname) values (5, 'test5')
-- FULL Back up 5 rows

BACKUP DATABASE [AdventureWorks2022] TO  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\master.bak'
WITH NOFORMAT, NOINIT,  NAME = N'AdventureWorks2022-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO

USE [master]
RESTORE DATABASE [AdventureWorks2022] FROM  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\master.bak' 
WITH  FILE = 1,  NOUNLOAD,  STATS = 5

GO


