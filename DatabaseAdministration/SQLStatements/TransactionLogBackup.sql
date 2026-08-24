USE[AdventureWorks2022]
-- tran log back 
insert into SQLBackupRestoreTest1 (ID,loginname) values (11, 'test11')
insert into SQLBackupRestoreTest1 (ID,loginname) values (12, 'test12')
insert into SQLBackupRestoreTest1 (ID,loginname) values (13, 'test13')

insert into SQLBackupRestoreTest1 (ID,loginname) values (14, 'test14')
insert into SQLBackupRestoreTest1 (ID,loginname) values (15, 'test15')
insert into SQLBackupRestoreTest1 (ID,loginname) values (16, 'test16')
insert into SQLBackupRestoreTest1 (ID,loginname) values (17, 'test17')

BACKUP LOG [AdventureWorks2022] TO  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\master.trn' 
WITH NOFORMAT, NOINIT,  NAME = N'AdventureWorks2022-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
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

RESTORE LOG [AdventureWorks2016] FROM  DISK = N':\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\master.trn'
WITH  FILE = 1,  NORECOVERY,  NOUNLOAD,  STATS = 10
GO


RESTORE DATABASE [AdventureWorks2016_RestoreTest] WITH RECOVERY
GO


