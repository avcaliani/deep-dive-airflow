#!/bin/bash -ex
lake_path="${1:?Data lake base path is mandatory ‼️}"
out_file="${lake_path}/office/security/security_$(date +%F).csv"

mkdir -p "${lake_path}/office/security"
status=$(( RANDOM % 3 ))
echo "Dwight,check_status" > "$out_file"
if [ $status -eq 0 ]; then
  echo "Dwight,failed" >> "$out_file"
else
  echo "Dwight,passed" >> "$out_file"
fi
echo "$out_file"
