#!/bin/bash
# Create a file; && runs on success, || runs on failure

filename=$1

touch "$filename" && echo "File created successfully: $filename" || echo "Failed to create the file."