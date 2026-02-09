#!/bin/bash -ex
lake_path="${1:?Data lake base path is mandatory ‼️}"
out_file="${lake_path}/office/inventory/inventory_$(date +%F).csv"

mkdir -p "${lake_path}/office/inventory"
{
  echo "item,quantity"
  echo "Paper,$((RANDOM%100 + 1))"
  echo "Pens,$((RANDOM%50 + 1))"
  echo "Staplers,$((RANDOM%20 + 1))"
} > "$out_file"

echo "$out_file"
