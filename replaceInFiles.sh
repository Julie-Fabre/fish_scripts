#!/bin/bash

# Check if three arguments are given
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 directory string_to_replace new_string"
    exit 1
fi

# Directory to start from
starting_directory="$1"

# The string to be replaced
string_to_replace="$2"

# The new string to replace with
new_string="$3"

# Replace the string in all files
replace_in_files() {
    local directory="$1"
    local search="$2"
    local replace="$3"
    find "$directory" -type f -exec sed -i "s/$search/$replace/g" {} +
}

# Start the replacement process
replace_in_files "$starting_directory" "$string_to_replace" "$new_string"

