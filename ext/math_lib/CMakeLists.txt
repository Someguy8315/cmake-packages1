cmake_minimum_required(VERSION 3.15)

project(math_lib VERSION 1.4.1)

set(CMAKE_INSTALL_PREFIX "${CMAKE_CURRENT_SOURCE_DIR}/../output")
set(MATH_LIB_EXPORT "math_libExport")

add_subdirectory(src)
