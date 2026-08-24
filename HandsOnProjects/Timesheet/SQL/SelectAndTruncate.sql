SELECT *
  FROM [TimesheetDB].[dbo].[Timesheet]

  SELECT *
  FROM [TimesheetDB].[dbo].[ErrorLog]

  SELECT*
  FROM [TimesheetDB].[dbo].[Employee]

   SELECT*
  FROM [dbo].[Leave]

    SELECT*
  FROM [dbo].[AuditLog]


  Truncate table [dbo].[AuditLog]
Truncate table [dbo].[ErrorLog]
Truncate table [dbo].[Timesheet]
Truncate table[dbo].[Client]
Truncate table[dbo].[Employee]
Truncate table[dbo].[Leave]

drop table[dbo].[Client]
drop table [dbo].[Employee]
drop table Timesheet
drop table Leave