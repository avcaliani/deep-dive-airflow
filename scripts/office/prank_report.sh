#!/bin/bash -ex
lake_path="${1:?Data lake base path is mandatory ‼️}"
out_file="${lake_path}/office/pranks/prank_$(date +%F).csv"

mkdir -p "${lake_path}/office/pranks"
echo "prank,result" > "$out_file"
status=$(( RANDOM % 2 ))
if [ $status -eq 0 ]; then
  echo "Stapler in Jell-O,success" >> "$out_file"
else
  echo "Stapler in Jell-O,failure" >> "$out_file"
fi
echo "$out_file"
