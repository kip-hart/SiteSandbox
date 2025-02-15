#!/bin/bash

# Base directory containing subdirectories with cpp files
BASE_DIR="cpp"

for dir in */ ; do
    if [ -d "$dir" ]; then
        echo "Processing directory: $dir"
              
        # Compile all .cpp files into an executable named 'project'
        g++ "$dir/*.cpp" -o "$dir/project"
              
        # Run the executable and pipe the output to a unique log file
        "$dir/project" > "$dir/output.log" 2>&1
    fi
done
