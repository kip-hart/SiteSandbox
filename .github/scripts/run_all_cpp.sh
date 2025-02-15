#!/bin/bash

# Base directory containing subdirectories with cpp files
BASE_DIR="cpp"
echo "$BASE_DIR"/*
for dir in  "$BASE_DIR"/*; do
    echo $dir
    if [ -d "$dir" ]; then
        echo "Processing directory: $dir"
        cd $dir
        
        # Compile all .cpp files into an executable named 'project'
        echo "compiling project"
        g++ *.cpp -o project

        echo "files"
        ls
              
        # Run the executable and pipe the output to a unique log file
        echo "running project"
        project > screen_output.log 2>&1
        cat screen_output.log

        # Delete the executable
        echo "deleting executable"
        rm project

        cd -
    fi
done
