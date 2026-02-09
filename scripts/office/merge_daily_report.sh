#!/bin/bash -ex
lake_path="${1:?Data lake base path is mandatory ‼️}"
out_file="${lake_path}/office/daily_report/daily_report_$(date +%F).csv"

mkdir -p "${lake_path}/office/daily_report"
echo "source,content" > "$out_file"
for folder in inventory sales pranks security; do
  for f in "${lake_path}"/office/"${folder}"/*.csv; do
    tail -n +2 "$f" | awk -v src="$folder" '{print src","$0}' >> "$out_file"
  done
done
echo "Merged daily report at $out_file"
