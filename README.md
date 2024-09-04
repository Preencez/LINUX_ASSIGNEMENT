
ETL Pipeline for CoreDataEngineers
Project Overview
This project is a simple ETL (Extract, Transform, Load) pipeline developed for CoreDataEngineers to manage and process data efficiently. The pipeline is built using Bash scripting and is scheduled to run daily using cron jobs.

Directory Structure
/Project Folder/my_ass/
├── raw/
│   └── annual-enterprise-survey-2023-financial-year-provisional.csv
├── Transformed/
│   └── 2023_year_finance.csv
├── Gold/
│   └── 2023_year_finance.csv
├── Scripts/
│   ├── Bash/
│   │   ├── etl_script.sh
│   │   └── move_files.sh
│   ├── SQL/
│   │   └── posey_queries.sql
└── README.md

Bash Scripts
1. etl_script.sh
This script performs the following ETL process:

Extract: Downloads a CSV file and saves it into the raw folder.
Transform: Renames the Variable_code column and selects specific columns, saving the result into the Transformed folder.
Load: Copies the transformed file to the Gold folder.
2. copy_to_postgres.sh
This script moves all CSV and JSON files from one folder to another folder named json_and_CSV.
3. the Sql queries are found in Queries.sql

Cron Job Scheduling
The ETL script is scheduled to run every day at 12:00 AM using the following cron job:
0 0 * * * /path/to/etl_script.sh

How to Use
Run the ETL Pipeline:
Execute the etl_script.sh file to run the ETL process.

Move CSV/JSON Files:
Use the move_files.sh script to move all CSV and JSON files to the json_and_CSV folder.

Execute SQL Queries:
Use the provided SQL queries to analyze data in the PostgreSQL database.
![image](https://github.com/user-attachments/assets/7601cf56-9341-462b-8385-ae442bde4f75)


