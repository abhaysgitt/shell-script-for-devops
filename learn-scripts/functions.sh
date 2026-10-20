#!/bin/bash
# Function with conditional checks

check_tool() {
    read -p "Enter tool name: " tool
    read -p "Enter experience in years: " experience

    if [[ "$tool" == "Docker" ]]; then
        echo "Docker is used for containerization."
    elif [[ "$experience" -ge 1 ]]; then
        echo "Keep improving your DevOps skills."
    else
        echo "Keep learning and building projects."
    fi
}

# Function call
check_tool