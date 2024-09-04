#!/bin/bash

# Define variables
DB_NAME="posey"
DB_USER="postgres"
DB_HOST="localhost"
CSV_DIR="/home/preencez/Desktop/CDE/posey_files"  # Update this path to the directory where your CSV files are stored

# List of CSV files and corresponding tables
FILES=("accounts.csv" "orders.csv" "web_events.csv" "sales_reps.csv" "region.csv")
TABLES=("accounts" "orders" "web_events" "sales_reps" "region")

# Iterate over the files and tables
for i in ${!FILES[@]}; do
    FILE="${CSV_DIR}/${FILES[$i]}"
    TABLE="${TABLES[$i]}"
    
    if [ -f "$FILE" ]; then
        echo "Importing $FILE into $TABLE"
        psql -h $DB_HOST -U $DB_USER -d $DB_NAME -c "\COPY $TABLE FROM '$FILE' DELIMITER ',' CSV HEADER;"
    else
        echo "File $FILE does not exist."
    fi
done
