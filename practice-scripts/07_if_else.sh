#!/bin/bash
# If-else with string comparison

read -p "Enter your target role: " role

if [[ $role == "DevOps Engineer" ]]; then
    echo "Correct! Keep working towards your goal."
else
    echo "Keep learning and improving your skills."
fi