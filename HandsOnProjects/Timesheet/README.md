# SSIS Timesheet ETL Pipeline

A data-engineering project that extracts timesheet data from Excel files,
transforms it with SQL Server Integration Services (SSIS) and loads the results
into SQL Server for reporting and analysis.

The wider solution also explored Elastic Stack observability, SQL Server Agent
automation, GitHub Actions deployment readiness, Power BI reporting and a
retrieval-augmented generation prototype using Ollama and OpenRouter.

## What I built

- An SSIS workflow for processing Excel timesheet files
- SQL Server database objects for clients, employees, timesheets, leave,
  auditing and error logging
- Staging-to-target processing through SQL scripts and a database trigger
- SQL Server Agent job definitions for scheduled loading
- Repository workflows supporting database and SSIS deployment readiness
- Power BI reporting for timesheet, employee and client analysis
- Logstash and Kibana observability for pipeline monitoring
- A RAG prototype using Ollama, OpenRouter and the DeepSeek R1 API

## Data flow

```text
Excel timesheets
      ↓
SSIS extraction and transformation
      ↓
SQL Server staging and target tables
      ↓
Power BI reporting
```

Logstash and Kibana were used alongside the pipeline to explore operational
visibility. GitHub Actions and SQL Server Agent workflows supported repeatable
delivery and scheduling.

## Repository structure

```text
Timesheet/
├── SQL/
│   ├── CreateDatabase.sql
│   ├── CreateAllTablesSP.sql
│   ├── Trigger.sql
│   ├── JobSchedule.sql
│   └── SelectAndTruncate.sql
└── SSIS/
    └── TimeSheet_Project/
        ├── *.dtsx
        ├── TimeSheet_Project.dtproj
        └── TimeSheet_Project.sln
```

Related GitHub Actions workflows are stored in the repository-level
`.github/workflows` directory.

## Prerequisites

The exact components you need depend on which part of the solution you want to
run:

- Windows
- SQL Server and SQL Server Agent
- SQL Server Integration Services
- Visual Studio with the SSIS Projects extension or compatible SQL Server Data
  Tools
- Power BI Desktop for the reporting files
- Elastic Stack for Logstash and Kibana observability

## Local setup

1. Review the SQL scripts and replace machine-specific server, file and folder
   paths before running them.
2. Create `TimesheetDB` using `SQL/CreateDatabase.sql`.
3. Review and run `SQL/CreateAllTablesSP.sql` to create the stored procedure and
   required tables.
4. Open the SSIS solution in Visual Studio.
5. Update the Excel and SQL Server connection managers for your environment.
6. Run the packages from Visual Studio and verify the staging and target data.
7. Review `SQL/JobSchedule.sql` before creating the SQL Server Agent job because
   it contains environment-specific commands and paths.

## Delivery notes

The project includes source and workflow assets used to support deployment
readiness. Do not assume that the provided scripts will run unchanged on a new
machine: connection managers, server names, credentials and filesystem paths
must be configured for the target environment.

## Security

- Store database credentials in GitHub Secrets or local environment-specific
  configuration.
- Do not commit real timesheet data or employee information.
- Review generated logs before sharing them publicly.

## Status

Portfolio data-engineering project. This repository documents the source,
automation and delivery approach; it does not claim that this project is a
publicly hosted application.
