#!/bin/bash
# Strict mode and error handling

# Exit on errors, undefined variables, and pipeline failures
set -euo pipefail

# Create a directory
create_directory() {
    mkdir "$1"
    echo "Directory created: $1"
}

create_directory demo_folder
echo "Script executed successfully!"