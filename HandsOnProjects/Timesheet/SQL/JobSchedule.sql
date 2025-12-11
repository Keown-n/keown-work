USE [msdb]
GO

/****** Object:  Job [TimesheetDataLoading]    Script Date: 2025/06/19 09:38:59 ******/
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]    Script Date: 2025/06/19 09:38:59 ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'TimesheetDataLoading', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'SAMBE2025006\Keown Naidoo', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [LoadClientsand Employees]    Script Date: 2025/06/19 09:38:59 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'LoadClientsand Employees', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'SSIS', 
		@command=N'/ISSERVER "\"\SSISDB\Timesheet\TimeSheet_Project\ClientAndEmployeeExctraction.dtsx\"" /SERVER "\".\"" /Par "\"$ServerOption::LOGGING_LEVEL(Int16)\"";1 /Par "\"$ServerOption::SYNCHRONIZED(Boolean)\"";True /CALLERINFO SQLAGENT /REPORTING E', 
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [LoadTimesheetData]    Script Date: 2025/06/19 09:38:59 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'LoadTimesheetData', 
		@step_id=2, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'SSIS', 
		@command=N'/ISSERVER "\"\SSISDB\Timesheet\TimeSheet_Project\ImportingV8Editing.dtsx\"" /SERVER "\".\"" /Par "\"$ServerOption::LOGGING_LEVEL(Int16)\"";1 /Par "\"$ServerOption::SYNCHRONIZED(Boolean)\"";True /CALLERINFO SQLAGENT /REPORTING E', 
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [StartELK]    Script Date: 2025/06/19 09:38:59 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'StartELK', 
		@step_id=3, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'PowerShell', 
		@command=N'
# Set the path to your Elasticsearch executable
$elasticPath = "C:\ELK\elasticsearch-9.0.1\bin\elasticsearch.bat"

# Launch Elasticsearch
Start-Process -FilePath $elasticPath 

Start-Sleep -Seconds 60

# Set the path to your Logstash installation and config file
$logstashPath = "C:\ELK\logstash-9.0.2\bin\logstash.bat"
$configFile = "C:\ELK\AuditLogs.conf"

# Run Logstash with your configuration file
Start-Process -FilePath $logstashPath -ArgumentList "-f `"$configFile`"" -NoNewWindow -Wait

# Set the path to your Logstash installation and config file
$logstashPath = "C:\ELK\logstash-9.0.2\bin\logstash.bat"
$ErrorconfigFile = "C:\ELK\ErrorLogs.conf"

# Run Logstash with your configuration file
Start-Process -FilePath $logstashPath -ArgumentList "-f `"$ErrorconfigFile`"" -NoNewWindow -Wait


', 
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Weekly', 
		@enabled=1, 
		@freq_type=8, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=1, 
		@active_start_date=20250618, 
		@active_end_date=99991231, 
		@active_start_time=0, 
		@active_end_time=235959, 
		@schedule_uid=N'cc9512f5-7dcc-4e00-8a37-7f5d2ae9cfae'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:
GO


