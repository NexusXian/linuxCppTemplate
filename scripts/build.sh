#!/bin/bash

# Get the current directory path
currentDirectory=$(pwd)
# Define the path to CMakeLists.txt
cmakeListsPath="${currentDirectory}/CMakeLists.txt"

# Check if CMakeLists.txt exists in the current directory
if [ ! -f "$cmakeListsPath" ]; then
  echo "No CMakeLists.txt in current directory, please check."
  exit 1
fi

# Inform the user about the start of generation and compilation
echo "Start generating and compiling..."

# Define paths for build and bin directories
buildFolderPath="./build"
binFolderPath="./bin"

# Create build and bin directories if they do not exist
[ ! -d "$buildFolderPath" ] && mkdir -p "$buildFolderPath" && echo "build folder created."
[ ! -d "$binFolderPath" ] && mkdir -p "$binFolderPath" && echo "bin folder created."

# Run CMake to configure the project
cmake -G "Unix Makefiles" \
  -D CMAKE_CXX_COMPILER=/usr/bin/g++ \
  -D CMAKE_RUNTIME_OUTPUT_DIRECTORY="${currentDirectory}/bin" \
  -S . -B "$buildFolderPath"

# Check if CMake configuration was successful
if [ $? -eq 0 ]; then
  # Build the project using CMake
  cmake --build "$buildFolderPath" --config DEBUG
  # Inform the user about the completion of the build
  echo "Build completed."
else
  # Inform the user about the failure of CMake configuration
  echo "CMake configuration failed."
  exit 1
fi
