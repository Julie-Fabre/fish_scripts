#!/bin/bash

# Check if three arguments are given
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 start_directory string_to_replace new_string"
    exit 1
fi

# Directory to start from
starting_directory="$1"

# The string to be replaced
string_to_replace="$2"

# The new string to replace with
new_string="$3"

# Function to rename files
rename_files() {
    local directory="$1"
    for file in "$directory"/*; do
        if [ -d "$file" ]; then
            # Recurse into subdirectory
            rename_files "$file"
        elif [[ -f "$file" && $file == *"$string_to_replace"* ]]; then
            # Rename the file if it contains the string to replace
            local new_name=$(echo "$file" | sed "s/$string_to_replace/$new_string/g")
            mv "$file" "$new_name"
            echo "Renamed $file to $new_name"
        fi
    done
}

# Start the renaming process
rename_files "$starting_directory"

