#!/bin/bash -ex
lake_path="${1:?Data lake base path is mandatory ‼️}"
out_file="${lake_path}/office/sales/sales_$(date +%F).csv"

mkdir -p "${lake_path}/office/sales"
echo "employee,sales" > "$out_file"
for emp in Jim Pam Dwight Michael; do
  echo "$emp,$((RANDOM%10 + 1))" >> "$out_file"
done
echo "$out_file"
