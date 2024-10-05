#!/bin/bash

clear;

instruction_dir='/workspaces/mlbp-codespace/.devcontainer/instructions'

# Check if the first argument is 'refresh'
if [ "$1" == "refresh" ]; then
    cp .devcontainer/.bashrc ~/.bashrc
    source ~/.bashrc
    echo "Bash configuration has been refreshed."
    echo # for new line
fi

# Display welcome message
cat "$instruction_dir/welcome"; echo
echo; echo
cat "$instruction_dir/help_header"; echo
echo

# Check if parameters are provided
if [ $# -eq 0 ]; then
    # No parameters, loop through all help files
    for file in "$instruction_dir/helps/"*; do
        if [ -f "$file" ]; then
            echo "--- $(basename "$file") ---" # Print the file name
            cat "$file"; echo
            echo "--- $(basename "$file") ---"; echo # Print the file name
        fi
    done
else
    # Parameters provided, loop through each parameter
    for param in "$@"; do
        file="$instruction_dir/helps/$param"
        if [ -f "$file" ]; then
            echo "-- $param --"           # Print the specific file name
            cat "$file"                   # Display the file content
            echo # New line
            echo "-- $param --"           # Print the specific file name
        else
            echo "Bantuan untuk '$param' tidak ditemukan." # Handle case where the file does not exist
        fi
    done
fi

echo
# Display footer message
cat "$instruction_dir/footer"; echo