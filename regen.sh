#!/usr/bin/env bash
# Regenerate every stats file from statistics.sqlite3.
set -euo pipefail
cd "$(dirname "$0")"

if [ ! -f statistics.sqlite3 ]; then
    echo "statistics.sqlite3 not found. Copy it from your KOReader device (koreader/settings/statistics.sqlite3) into this directory." >&2
    exit 1
fi

for script in monthly yearly book_dates pace wrapped updates
do
    echo "== $script"
    python3 "scripts/$script.py"
done
