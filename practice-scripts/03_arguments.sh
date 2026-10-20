#!/bin/bash
# Topic: Script Arguments and Positional Parameters
# $0 = Script name
# $1, $2, ... = Positional arguments
# $# = Total number of arguments
# $@ = All arguments

echo "Script name: $0"
echo "First argument: $1"
echo "Second argument: $2"
echo "Total number of arguments: $#"
echo "All arguments: $@"