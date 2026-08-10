#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Base directory containing subdirectories with python files
BASE_DIR="python"
FIGS_BASE="figures/python"

echo "$BASE_DIR"/*
for dir in "$BASE_DIR"/*; do
    echo $dir
    if [ -d "$dir" ]; then
        echo "Processing directory: $dir"
        dir_name=$(basename "$dir")
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

        # Run the entry point script and pipe the output to a log file.
        # Any matplotlib figures left open when the script finishes are
        # captured and saved as Figure_N.png by run_python_capture.py.
        echo "running $ENTRY"
        python3 "$SCRIPT_DIR/run_python_capture.py" "$ENTRY" > screen_output.log 2>&1
        cat screen_output.log

        cd -

        # Move any captured figures into the shared figures/ tree
        shopt -s nullglob
        pngs=("$dir"/Figure_*.png)
        shopt -u nullglob
        if [ "${#pngs[@]}" -gt 0 ]; then
            fig_dir="$FIGS_BASE/$dir_name"
            mkdir -p "$fig_dir"
            mv "${pngs[@]}" "$fig_dir/"
        fi
    fi
done
