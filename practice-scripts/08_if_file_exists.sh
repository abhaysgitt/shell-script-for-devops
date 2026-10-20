#!/bin/bash
# Check whether a file exists and validate argument count

if [[ $# -eq 0 ]]; then
    echo "Usage: $0 <file-path>"
    exit 1
fi

if [[ -f "$1" ]]; then
    echo "File exists: $1"
else
    echo "File does not exist: $1"
fi