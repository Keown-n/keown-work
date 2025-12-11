USE [msdb]
GO
---FROM THE GUI---
/****** Object:  Alert [Test Alert]    Script Date: 2025/03/17 15:36:42 ******/
EXEC msdb.dbo.sp_add_alert @name=N'Test Alert', 
		@message_id=0, 
		@severity=21, 
		@enabled=1, 
		@delay_between_responses=0, 
		@include_event_description_in=1, 
		@category_name=N'[Uncategorized]', 
		@job_id=N'00000000-0000-0000-0000-000000000000'
GO

