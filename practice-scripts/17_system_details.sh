#!/bin/bash
# Pipes, awk, and system monitoring

# Check available memory
check_memory() {
    free -h | awk 'NR==2 {print "Available memory: " $7}'
}

# Check available disk space
check_storage() {
    df -h / | awk 'NR==2 {print "Available disk: " $4}'
}

# Find the top memory-consuming process
top_process() {
    ps aux --sort=-%mem | awk 'NR==2 {print "Top process: user="$1" pid="$2" mem%="$4}'
}

# Display system details
echo "=== System Details ==="
check_memory
check_storage
top_process