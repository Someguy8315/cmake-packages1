project(math_division)

add_library(${PROJECT_NAME} STATIC
    division.h
    division.c
)

target_include_directories(${PROJECT_NAME} INTERFACE
    $<INSTALL_INTERFACE:include/division>
)

if(WIN32)
    # install the .pdb
    install(FILES ${CMAKE_CURRENT_BINARY_DIR}/Debug/${PROJECT_NAME}.pdb
        DESTINATION lib/Debug
        CONFIGURATIONS Debug
    )
endif()

# install the headers
install(FILES division.h
    DESTINATION include/division
)
