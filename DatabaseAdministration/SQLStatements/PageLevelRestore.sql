USE master
GO
DROP DATABASE IF EXISTS [CorruptionTest]
GO
CREATE DATABASE [CorruptionTest]
GO
ALTER DATABASE [CorruptionTest] SET RECOVERY FULL;
GO
ALTER DATABASE [CorruptionTest] SET PAGE_VERIFY CHECKSUM
GO

CREATE TABLE [CorruptionTest].[dbo].[mssqltips_online]
(increment INT, randomGUID uniqueidentifier, randomValue INT, BigCol CHAR(2000) DEFAULT 'a',
INDEX CIX_MSSQLTips_increment1 UNIQUE CLUSTERED (increment))
GO

CREATE TABLE [CorruptionTest].[dbo].[mssqltips_corrupt]
(increment INT, randomGUID uniqueidentifier, randomValue INT, BigCol CHAR(2000) DEFAULT 'a',
INDEX CIX_MSSQLTips_increment1 UNIQUE CLUSTERED (increment))
GO

SET NOCOUNT ON;
DECLARE @counter INT = 1;
BEGIN TRAN
    WHILE @counter <= 250000
    BEGIN
        INSERT INTO CorruptionTest.dbo.mssqltips_online (increment, randomGUID, randomValue)
        VALUES (@counter, NEWID(), ABS(CHECKSUM(NEWID())) % 140000000)

        INSERT INTO CorruptionTest.dbo.mssqltips_corrupt (increment, randomGUID, randomValue)
        VALUES (@counter, NEWID(), ABS(CHECKSUM(NEWID())) % 140000000)

        SET @counter += 1
    END;
COMMIT TRAN;
GO
DBCC CHECKDB('CorruptionTest') WITH NO_INFOMSGS
GO
BACKUP DATABASE [CorruptionTest] TO DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\CorruptionTestFull.BAK' WITH COMPRESSION
GO


-------Finding Pages to corrupt------------
SELECT TOP 10 
    sys.fn_PhysLocFormatter(%%physloc%%) AS PageId,*
FROM [CorruptionTest].[dbo].[mssqltips_corrupt]
GO

DBCC TRACEON (3604)
GO
DBCC PAGE ('CorruptionTest',1,306,3)

--16262994

SELECT CONVERT(VARBINARY(8), 95868367)
GO
-- Output: 0x05B6D5CF

USE master;
GO
ALTER DATABASE [CorruptionTest] SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
GO
DBCC WRITEPAGE ('CorruptionTest', 1, 306, 2151, 4, 0xCFD5B605, 1)
GO
ALTER DATABASE [CorruptionTest] SET MULTI_USER;
GO

SELECT TOP 10 
    sys.fn_PhysLocFormatter(%physloc%) AS PageId
FROM [CorruptionTest].[dbo].[mssqltips]
GO

----------------PAGE RESTORE-----------------------

USE [master]
RESTORE DATABASE [CorruptionTest] PAGE='1:354, 1:306' 
FROM  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\CorruptionTest\CorruptionTest_backup_2025_03_19_100001_5151313.trn' 
WITH  FILE = 1,  NORECOVERY,  NOUNLOAD,  STATS = 5

BACKUP LOG [CorruptionTest] 
TO  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\CorruptionTest_LogBackup_2025-03-19_10-45-02.bak' 
WITH NOFORMAT, NOINIT,  NAME = N'CorruptionTest_LogBackup_2025-03-19_10-45-02', NOSKIP, NOREWIND, NOUNLOAD,  STATS = 5

RESTORE LOG [CorruptionTest] 
FROM  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\CorruptionTest_LogBackup_2025-03-19_10-45-02.bak' 
WITH  NOUNLOAD,  STATS = 5

GO


