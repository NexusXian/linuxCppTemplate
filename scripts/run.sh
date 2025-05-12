#!/bin/bash

# Executable file path
executable="./bin/main"

# Check if the executable file exists
if [ ! -f "$executable" ]; then
  echo "Executable not found at $executable"
  echo "Please run build script first."
  exit 1
fi

# Run the program
echo "Running executable..."
"$executable"
