USE [TimesheetDB]
GO


CREATE PROCEDURE CreateAllTables
AS
BEGIN
    SET NOCOUNT ON;

    -- Drop existing tables if they exist
    IF OBJECT_ID('dbo.Timesheet', 'U') IS NOT NULL DROP TABLE dbo.Timesheet;    
    IF OBJECT_ID('dbo.Leave', 'U') IS NOT NULL DROP TABLE dbo.Leave;
    IF OBJECT_ID('dbo.ErrorLog', 'U') IS NOT NULL DROP TABLE dbo.ErrorLog;
    IF OBJECT_ID('dbo.AuditLog', 'U') IS NOT NULL DROP TABLE dbo.AuditLog;
	IF OBJECT_ID('dbo.Client', 'U') IS NOT NULL DROP TABLE dbo.Client;
	IF OBJECT_ID('dbo.Employee', 'U') IS NOT NULL DROP TABLE dbo.Employee;


    -- Create Client table
    CREATE TABLE [dbo].[Client] (
        [ClientID] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
        [ClientName] NVARCHAR(100) NULL
    );

    -- Create Employee table
    CREATE TABLE [dbo].[Employee] (
        [ID] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
        [EmployeeName] NVARCHAR(100) NULL,
        CONSTRAINT UC_Employee_EmployeeName UNIQUE ([ID], [EmployeeName])
    );

    -- Create Timesheet table
    CREATE TABLE [dbo].[Timesheet] (
        [TimeSheetID] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
        [EmployeeID] INT NOT NULL,
        [Date] DATE NOT NULL,
        [DayOfWeek] NVARCHAR(255) NOT NULL,
        [ClientID] INT NOT NULL,
        [ClientProjectName] NVARCHAR(100) NOT NULL,
        [Description] NVARCHAR(MAX) NULL,
        [BillableOrNonBillable] NVARCHAR(20) NOT NULL,
        [Comments] NVARCHAR(MAX) NULL,
        [TotalHours] DECIMAL(5,2) NULL,
        [StartTime] TIME(0) NULL,
        [EndTime] TIME(0) NULL,
        CONSTRAINT UQ_Timesheet_UniqueEntry3 UNIQUE ([EmployeeID], [Date], [StartTime], [EndTime]),
        CONSTRAINT FK_Timesheet_Employee FOREIGN KEY ([EmployeeID]) REFERENCES [dbo].[Employee]([ID]),
        CONSTRAINT FK_Timesheet_Client FOREIGN KEY ([ClientID]) REFERENCES [dbo].[Client]([ClientID])
    );

    -- Create Leave table
    CREATE TABLE [dbo].[Leave] (
        [LeaveID] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
        [EmployeeID] INT NULL,
        [TypeOfLeave] NVARCHAR(50) NULL,
        [StartDate] DATE NULL,
        [EndDate] DATE NULL,
        [NumberOfDays] INT NULL,
        [ApprovalObtained] NVARCHAR(50) NULL DEFAULT 'N/A',
        [SickNote] NVARCHAR(50) NULL DEFAULT 'N/A',
        CONSTRAINT UC_Leave UNIQUE ([EmployeeID], [TypeOfLeave], [StartDate], [EndDate]),
		CONSTRAINT FK_Leave_Employee FOREIGN KEY ([EmployeeID]) REFERENCES [dbo].[Employee]([ID]),
    );

	    -- Create ErrorLog table
    CREATE TABLE ErrorLog (
        ErrorID INT PRIMARY KEY IDENTITY(1,1),
        FilePath NVARCHAR(255),
        ErrorDescription TEXT,
        Timestamp DATETIME DEFAULT GETDATE()
    );

    -- Create AuditLog table
    CREATE TABLE AuditLog (
    [AuditID] INT PRIMARY KEY IDENTITY(1,1),
	[FilePath] VARCHAR(1000),
	[Month] NVARCHAR(1000),
    [Type] NVARCHAR(225) NOT NULL,
    [EmployeeName] NVARCHAR(225) NOT NULL,
    [Task] NVARCHAR(MAX),
	[Timestamp] DATETIME NULL DEFAULT GETDATE()
    );
END;
GO
EXEC CreateAllTables;

