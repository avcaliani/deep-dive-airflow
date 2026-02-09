#!/bin/bash -ex
lake_path="${1:?Data lake base path is mandatory ‼️}"
retention_days=7

echo "🧹 Starting office cleanup..."

# Remove files older than retention period
find "${lake_path}/office" -type f -name "*.csv" -mtime +${retention_days} -delete

# Count remaining files
file_count=$(find "${lake_path}/office" -type f -name "*.csv" | wc -l)

echo "✅ Cleanup complete!"
echo "📊 Files retained: ${file_count}"
echo "🗑️  Deleted files older than ${retention_days} days"

# Optional: Remove empty directories
find "${lake_path}/office" -type d -empty -delete

echo "🏢 Office is clean and organized!"
