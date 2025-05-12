cmake_minimum_required(VERSION 3.10)
project(linuxCppTemplate)

# Set C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Set runtime output directory
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/bin)

# Include directories
include_directories(${PROJECT_SOURCE_DIR}/includes)

# Find all source files in src directory
file(GLOB_RECURSE SRC_FILES ${PROJECT_SOURCE_DIR}/src/*.cc)

# Generate main program
add_executable(main ${SRC_FILES})

# Optional: Add tests
enable_testing()

# Find all test source files in tests directory
file(GLOB_RECURSE TEST_FILES ${PROJECT_SOURCE_DIR}/tests/*.cc)

if(TEST_FILES)
    add_executable(runTests ${TEST_FILES})
    target_link_libraries(runTests PRIVATE pthread)  # If tests require multithreading support
    add_test(NAME runTests COMMAND runTests)
endif()
