#!/bin/bash

# Base directory containing subdirectories with python files
BASE_DIR="python"
echo "$BASE_DIR"/*
for dir in "$BASE_DIR"/*; do
    echo $dir
    if [ -d "$dir" ]; then
        echo "Processing directory: $dir"
        cd $dir

        # Determine the entry point script for this directory
        if [ -f "main.py" ]; then
            ENTRY="main.py"
        else
            PY_FILES=(*.py)
            if [ "${#PY_FILES[@]}" -eq 1 ] && [ -f "${PY_FILES[0]}" ]; then
                ENTRY="${PY_FILES[0]}"
            else
                echo "Skipping $dir: could not determine a single entry point script"
                cd -
                continue
            fi
        fi

        echo "files"
        ls

        # Run the entry point script and pipe the output to a log file
        echo "running $ENTRY"
        python3 "$ENTRY" > screen_output.log 2>&1
        cat screen_output.log

        cd -
    fi
done
