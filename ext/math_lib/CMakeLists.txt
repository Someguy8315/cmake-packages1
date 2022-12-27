cmake_minimum_required(VERSION 3.10)

project(math_lib VERSION 1.2.0)

set(CMAKE_INSTALL_PREFIX "${CMAKE_CURRENT_SOURCE_DIR}/../output")

add_library(${PROJECT_NAME} STATIC
    math_lib.h
    math_lib.c
)

target_include_directories(${PROJECT_NAME} INTERFACE
    $<INSTALL_INTERFACE:include>
)

# include utilities
include(CMakePackageConfigHelpers)

# add the library modules
add_subdirectory(modules/division)

# install the .lib
install(TARGETS ${PROJECT_NAME} math_division
    EXPORT "${PROJECT_NAME}Target"
    ARCHIVE DESTINATION lib/$<CONFIG>
)

if(WIN32)
    # install the .pdb
    install(FILES ${CMAKE_BINARY_DIR}/Debug/${PROJECT_NAME}.pdb
        DESTINATION lib/Debug
        CONFIGURATIONS Debug
    )
endif()

# install the headers
install(FILES math_lib.h
    DESTINATION include
)

include(CMakePackageConfigHelpers)

# create the version file
write_basic_package_version_file(
    "${CMAKE_INSTALL_PREFIX}/cmake/${PROJECT_NAME}/${PROJECT_NAME}-config-version.cmake"
    VERSION ${PROJECT_VERSION}
    COMPATIBILITY AnyNewerVersion
)

# create the package config file
install(EXPORT "${PROJECT_NAME}Target"
    FILE "${PROJECT_NAME}-config.cmake"
    DESTINATION "cmake/${PROJECT_NAME}"
    NAMESPACE ${PROJECT_NAME}::
)
