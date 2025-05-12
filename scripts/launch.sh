#!/bin/bash

currentDirectory=$(pwd)
cmakeListsPath="${currentDirectory}/CMakeLists.txt"

if [ ! -f "$cmakeListsPath" ]; then
  echo "No CMakeLists.txt in current directory, please check."
  exit 1
fi

echo "Start generating and compiling..."

buildFolderPath="./build"
binFolderPath="./bin"

# Create build and bin directories
[ ! -d "$buildFolderPath" ] && mkdir -p "$buildFolderPath" && echo "build folder created."
[ ! -d "$binFolderPath" ] && mkdir -p "$binFolderPath" && echo "bin folder created."

# Configure (specify output to bin)
cmake -G "Unix Makefiles" \
  -D CMAKE_CXX_COMPILER=/usr/bin/g++ \
  -D CMAKE_RUNTIME_OUTPUT_DIRECTORY="${currentDirectory}/bin" \
  -S . -B "$buildFolderPath"

# If configuration is successful, then build
if [ $? -eq 0 ]; then
  cmake --build "$buildFolderPath" --config DEBUG
  echo "Build completed."

  # Try to run bin/main
  executable="${binFolderPath}/main"
  if [ -f "$executable" ]; then
    echo "Running executable..."
    "$executable"
  else
    echo "Executable not found: $executable"
  fi
else
  echo "CMake configuration failed."
  exit 1
fi
