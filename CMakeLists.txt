cmake_minimum_required(VERSION 3.10)

project(main)

# set the package config path
list(APPEND CMAKE_PREFIX_PATH
    "${CMAKE_SOURCE_DIR}/ext/output/cmake/math_lib"
)

find_package(math_lib REQUIRED)
message("package version = ${math_lib_VERSION}")

add_executable(main src/main.c)

target_link_libraries(main PRIVATE
    math_lib::math_lib
    math_lib::math_division
    math_lib::math_multiplication
)

if(WIN32)
    # copy the .dll to the executable path
    add_custom_command(TARGET ${PROJECT_NAME} POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy
        $<TARGET_FILE:math_lib::math_multiplication>
        $<TARGET_FILE_DIR:${PROJECT_NAME}>
        COMMAND ${CMAKE_COMMAND} -E echo "Copying math_multiplication.dll to the executable path"
    )

    set(copy_command
        ${CMAKE_COMMAND} -E copy
        ${CMAKE_SOURCE_DIR}/ext/output/lib/Debug/math_multiplication.pdb
        $<TARGET_FILE_DIR:${PROJECT_NAME}>
    )

    set(echo_command
        ${CMAKE_COMMAND} -E echo
        "Copying math_multiplication.pdb to the executable path"
    )

    # copy the .pdb to the executable path (debug mode only)
    add_custom_command(TARGET ${PROJECT_NAME} POST_BUILD
        COMMAND "$<IF:$<CONFIG:Debug>,${copy_command},>"
        COMMAND "$<IF:$<CONFIG:Debug>,${echo_command},>"
        COMMAND_EXPAND_LISTS
    )
endif()
