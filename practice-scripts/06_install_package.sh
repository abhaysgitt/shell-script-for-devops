#!/bin/bash
# Install a package passed as an argument

package=$1

sudo apt-get update && sudo apt-get install -y "$package"
echo "$package has been installed successfully."