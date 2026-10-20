#!/bin/bash
# Functions with arguments

greet() {
    echo "Hello, $1!"
}

# Display the tool name
install_tool() {
    echo "Installing: $1"
}

greet "Abhay"
install_tool "Docker"