#!/bin/bash

# Base directory containing subdirectories with cpp files
BASE_DIR="cpp"
echo "$BASE_DIR"/*
for dir in  "$BASE_DIR"/*; do
    echo $dir
    if [ -d "$dir" ]; then
        echo "Processing directory: $dir"
              
        # Compile all .cpp files into an executable named 'project'
        g++ *.cpp -I $dir -o "$dir/project"
              
        # Run the executable and pipe the output to a unique log file
        "$dir/project" > "$dir/output.log" 2>&1
    fi
done
