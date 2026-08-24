SELECT name, physical_name AS CurrentLocation
FROM sys.master_files
WHERE database_id = DB_ID(N'Tempdb');
GO

USE master;
GO
ALTER DATABASE tempdb
MODIFY FILE (NAME =	tempdev, FILENAME = 'C:\SQL_TEMPDBNew\tempdb.ndf');
GO
ALTER DATABASE tempdb
MODIFY FILE (NAME =	temp2, FILENAME = 'C:\SQL_TEMPDBNew\tempdb_mssql_2.ndf');
GO
ALTER DATABASE tempdb
MODIFY FILE (NAME =	tempd3, FILENAME = 'C:\SQL_TEMPDBNew\tempdb3.ndf');
GO
ALTER DATABASE tempdb
MODIFY FILE (NAME =	temp4, FILENAME = 'C:\SQL_TEMPDBNew\tempdb4.ndf');
GO
ALTER DATABASE tempdb
MODIFY FILE (NAME = templog, FILENAME = 'C:\SQL_TEMPDBNew\templog.Idf');
GO
