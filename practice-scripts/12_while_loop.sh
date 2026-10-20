#!/bin/bash
# While loop and arithmetic operations

num=0

while [[ $num -le 10 ]]; do
    echo "Even number: $num"
    num=$((num + 2))
done