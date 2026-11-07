cmake_minimum_required(VERSION 3.21)
project(linuxCppTemplate LANGUAGES CXX)

# Set C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Set runtime output directory
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/bin)

# vcpkg manifest mode: fall back to $VCPKG_ROOT when no toolchain file was
# given via preset or command line
if(NOT DEFINED CMAKE_TOOLCHAIN_FILE AND DEFINED ENV{VCPKG_ROOT})
  set(CMAKE_TOOLCHAIN_FILE "$ENV{VCPKG_ROOT}/scripts/buildsystems/vcpkg.cmake"
      CACHE FILEPATH "vcpkg toolchain file")
endif()

# Include directories
include_directories(${PROJECT_SOURCE_DIR}/includes)

# Find all source files in src directory
file(GLOB_RECURSE SRC_FILES ${PROJECT_SOURCE_DIR}/src/*.cc)

# Generate main program
add_executable(main ${SRC_FILES})

# Dependencies from vcpkg (see vcpkg.json)
find_package(fmt CONFIG REQUIRED)
target_link_libraries(main PRIVATE fmt::fmt)

# Optional: Add tests
enable_testing()

# Find all test source files in tests directory
file(GLOB_RECURSE TEST_FILES ${PROJECT_SOURCE_DIR}/tests/*.cc)

if(TEST_FILES)
    add_executable(runTests ${TEST_FILES})
    target_link_libraries(runTests PRIVATE pthread)  # If tests require multithreading support
    add_test(NAME runTests COMMAND runTests)
endif()
