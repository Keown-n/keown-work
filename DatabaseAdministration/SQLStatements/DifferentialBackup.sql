USE [AdventureWorks2022]

--Differential Back up
insert into SQLBackupRestoreTest1 (ID,loginname) values (6, 'test6')
insert into SQLBackupRestoreTest1 (ID,loginname) values (7, 'test7')
insert into SQLBackupRestoreTest1 (ID,loginname) values (8, 'test8')
insert into SQLBackupRestoreTest1 (ID,loginname) values (9, 'test9')
insert into SQLBackupRestoreTest1 (ID,loginname) values (10, 'test10')

BACKUP DATABASE [AdventureWorks2022] TO  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\master.diff' 
WITH  DIFFERENTIAL , NOFORMAT, NOINIT,  NAME = N'AdventureWorks2022-Diff Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO
-- Full Back first
USE [master]
RESTORE DATABASE [AdventureWorks2022] FROM  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\master.bak' 
WITH  FILE = 1,  NORECOVERY,  NOUNLOAD,  STATS = 5

GO
-- Then Differential Back Ups
USE [master]
RESTORE DATABASE [AdventureWorks2022] FROM  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\master.diff'
WITH  FILE = 1,  NORECOVERY,  NOUNLOAD,  STATS = 5

