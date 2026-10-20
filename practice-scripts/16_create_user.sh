#!/bin/bash
# Linux user management

create_user() {
    read -p "Enter username: " username

    # Check if user exists
    if id "$username" &>/dev/null; then
        echo "User '$username' already exists."
        exit 1
    fi

    # Create user with home directory
    sudo useradd -m "$username" && \
        echo "User '$username' created successfully." || \
        echo "Failed to create user."
}

create_user