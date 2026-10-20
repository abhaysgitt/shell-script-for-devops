#!/bin/bash
# Variables, comments, and user input

<< comment
This is a multiline comment
Used for learning Shell Scripting
comment

name="Docker"

echo "Tool: $name"
echo "Current date: $(date)"

read -p "Enter a DevOps tool: " tool
echo "You entered: $tool"

echo "Script name: $0"
echo "Arguments: $1 $2"