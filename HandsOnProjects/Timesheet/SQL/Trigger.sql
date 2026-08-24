USE TimesheetDB;
GO

CREATE TRIGGER StagingToTimesheet
ON Staging
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

        INSERT INTO TimeSheet (
            EmployeeID,
            [Date],
            DayOfWeek,
            ClientID,
            ClientProjectName,
            [Description],
            BillableOrNonBillable,
            Comments,
            TotalHours,
            StartTime,
            EndTime
        )
        SELECT 
            e.ID,
            i.[Date],
            i.DayOfWeek,
            c.ClientID,
            i.ClientProjectName,
            i.[Description],
            i.BillableOrNonBillable,
            i.Comments,
            CAST(i.TotalHours AS DECIMAL(5,2)) / 60, -- Convert minutes to hours
            i.StartTime,
            i.EndTime
        FROM inserted i
        LEFT JOIN Employee e ON i.EmployeeName = e.EmployeeName
        LEFT JOIN Client c ON i.Client = c.ClientName
        WHERE i.Client IS NOT NULL;
  
END;
GO