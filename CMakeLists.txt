cmake_minimum_required(VERSION 3.10)
project(linuxCppTemplate)

# 设置 C++ 标准
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# 设置编译输出目录
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/bin)

# 包含头文件目录
include_directories(${PROJECT_SOURCE_DIR}/includes)

# 搜索 src 目录下所有源文件
file(GLOB_RECURSE SRC_FILES ${PROJECT_SOURCE_DIR}/src/*.cc)

# 生成主程序
add_executable(main ${SRC_FILES})

# 可选: 添加 tests
enable_testing()

# 搜索 tests 目录下的测试源文件
file(GLOB_RECURSE TEST_FILES ${PROJECT_SOURCE_DIR}/tests/*.cc)

if(TEST_FILES)
    add_executable(runTests ${TEST_FILES})
    target_link_libraries(runTests PRIVATE pthread)  # 如果测试需要多线程支持
    add_test(NAME runTests COMMAND runTests)
endif()

