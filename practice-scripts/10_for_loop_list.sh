#!/bin/bash
# For loop and file globbing

# Loop through DevOps tools
for tool in Docker Kubernetes AWS Jenkins; do
    echo "Learning: $tool"
done

echo "---"

# List shell scripts
for file in ./*.sh; do
    echo "Shell script: $file"
done