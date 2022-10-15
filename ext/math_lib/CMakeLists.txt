cmake_minimum_required(VERSION 3.10)

project(math_lib)

add_library(${PROJECT_NAME} STATIC
    math_lib.h
    math_lib.c
)

target_include_directories(${PROJECT_NAME}
    PUBLIC
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
    $<INSTALL_INTERFACE:.>
)

set(CMAKE_INSTALL_PREFIX "${CMAKE_CURRENT_SOURCE_DIR}/../output")

# install the .lib
install(TARGETS ${PROJECT_NAME}
    EXPORT "${PROJECT_NAME}Target"
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

# install the headers
install(FILES math_lib.h
    DESTINATION include
)

include(CMakePackageConfigHelpers)

# create the version file
write_basic_package_version_file(
    "${CMAKE_INSTALL_PREFIX}/cmake/${PROJECT_NAME}-config-version.cmake"
    VERSION "1.0.0"
    COMPATIBILITY AnyNewerVersion
)

# create the package config file
export(EXPORT "${PROJECT_NAME}Target"
    FILE "${CMAKE_INSTALL_PREFIX}/cmake/${PROJECT_NAME}-config.cmake"
    NAMESPACE ${PROJECT_NAME}::
)
