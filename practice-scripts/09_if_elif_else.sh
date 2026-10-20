#!/bin/bash
# If-elif-else with string and numeric comparisons

read -p "Enter your favorite language: " language
read -p "Years of experience: " experience

if [[ $language == "Bash" ]]; then
    echo "Great for automation!"
elif [[ $experience -ge 1 ]]; then
    echo "Keep improving!"
else
    echo "Keep learning!"
fi