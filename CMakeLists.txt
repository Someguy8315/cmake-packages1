cmake_minimum_required(VERSION 3.10)

project(main)

# set the package config path
set(math_lib_DIR "ext/output/cmake/math_lib")
find_package(math_lib)

message("package version = ${math_lib_VERSION}")

add_executable(main src/main.c)

target_link_libraries(main PRIVATE
    math_lib::math_lib
)
