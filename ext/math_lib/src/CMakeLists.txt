add_library(${PROJECT_NAME} STATIC
    math_lib.h
    math_lib.c
)

# add the library modules
add_subdirectory(modules/division)
add_subdirectory(modules/multiplication)

# add a library that references all the other libraries
add_library(all_lib INTERFACE)

target_link_libraries(all_lib INTERFACE
    math_lib
    math_division
    math_multiplication
)

install(TARGETS all_lib
    EXPORT ${MATH_LIB_EXPORT}
)

# install the .lib
install(TARGETS ${PROJECT_NAME}
    EXPORT ${MATH_LIB_EXPORT}
    DESTINATION lib/$<CONFIG>/${PROJECT_NAME}
    INCLUDES DESTINATION include
)

# install the headers
install(FILES math_lib.h
    DESTINATION include
)

if(WIN32 AND MSVC)
    # install the .pdb
    install(FILES ${CMAKE_BINARY_DIR}/Debug/${PROJECT_NAME}.pdb
        DESTINATION lib/Debug/${PROJECT_NAME}
        CONFIGURATIONS Debug
    )
endif()

# include utilities
include(CMakePackageConfigHelpers)

# create the version file
write_basic_package_version_file(
    "${CMAKE_INSTALL_PREFIX}/cmake/${PROJECT_NAME}/${PROJECT_NAME}-config-version.cmake"
    VERSION ${PROJECT_VERSION}
    COMPATIBILITY SameMajorVersion
)

# create the package config file
install(EXPORT ${MATH_LIB_EXPORT}
    FILE "${PROJECT_NAME}-config.cmake"
    DESTINATION "cmake/${PROJECT_NAME}"
    NAMESPACE ${PROJECT_NAME}::
)
