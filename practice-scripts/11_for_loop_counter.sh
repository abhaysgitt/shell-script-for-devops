#!/bin/bash
# Create multiple directories using a for loop

if [[ $# -ne 3 ]]; then
    echo "Usage: $0 <prefix> <start> <end>"
    echo "Example: $0 server 1 5"
    exit 1
fi

prefix=$1
start=$2
end=$3

# Create numbered directories
for (( num=start; num<=end; num++ )); do
    mkdir "${prefix}${num}"
    echo "Directory created: ${prefix}${num}"
done