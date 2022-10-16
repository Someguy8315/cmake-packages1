cmake_minimum_required(VERSION 3.10)

project(math_lib)

add_library(${PROJECT_NAME} STATIC
    math_lib.h
    math_lib.c
)

set(CMAKE_INSTALL_PREFIX "${CMAKE_CURRENT_SOURCE_DIR}/../output")

# install the .lib
install(TARGETS ${PROJECT_NAME}
    EXPORT "${PROJECT_NAME}Target"
    ARCHIVE DESTINATION lib/$<CONFIG>
    INCLUDES DESTINATION include
)

# install the .pdb
install(FILES ${CMAKE_BINARY_DIR}/Debug/${PROJECT_NAME}.pdb
    DESTINATION lib/Debug
    CONFIGURATIONS Debug
)

# install the headers
install(FILES math_lib.h
    DESTINATION include
)

include(CMakePackageConfigHelpers)

# create the version file
write_basic_package_version_file(
    "${CMAKE_INSTALL_PREFIX}/cmake/${PROJECT_NAME}/${PROJECT_NAME}-config-version.cmake"
    VERSION "1.1.0"
    COMPATIBILITY AnyNewerVersion
)

# create the package config file
install(EXPORT "${PROJECT_NAME}Target"
    FILE "${PROJECT_NAME}-config.cmake"
    DESTINATION "cmake/${PROJECT_NAME}"
    NAMESPACE ${PROJECT_NAME}::
)
