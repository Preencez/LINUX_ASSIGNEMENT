#!/bin/bash

# Define environment variables
CSV_URL="https://www.stats.govt.nz/assets/Uploads/Annual-enterprise-s>RAW_DIR="./raw"
TRANSFORMED_DIR="./Transformed"
GOLD_DIR="./Gold"
TRANSFORMED_FILE="2023_year_finance.csv"

# Create directories if they don't exist
mkdir -p "$RAW_DIR" "$TRANSFORMED_DIR" "$GOLD_DIR"

# Extract: Download the CSV file
echo "Downloading CSV file from $CSV_URL..."
wget -O "$RAW_DIR/annual_enterprise_survey.csv" "$CSV_URL"

# Confirm file has been downloaded
if [ -f "$RAW_DIR/annual_enterprise_survey.csv" ]; then
  echo "File downloaded and saved in $RAW_DIR."
else
  echo "Failed to download the file."
  exit 1
fi

# Transform: Process the CSV file
echo "Transforming data..."
awk -F, '
BEGIN { OFS="," }
NR==1 { for (i=1; i<=NF; i++) if ($i == "Variable_code") var_code_col>{
  print $1, $2, $3, $var_code_col
}
' "$RAW_DIR/annual_enterprise_survey.csv" > "$TRANSFORMED_DIR/$TRANSF>

# Confirm file has been transformed
if [ -f "$TRANSFORMED_DIR/$TRANSFORMED_FILE" ]; then
  echo "File transformed and saved in $TRANSFORMED_DIR."
else
  echo "Failed to transform the file."
  exit 1
fi