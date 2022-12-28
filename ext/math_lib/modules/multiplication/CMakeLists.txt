project(math_multiplication)

# set symbols to be hidden by default
set(CMAKE_C_VISIBILITY_PRESET hidden)
set(CMAKE_VISIBILITY_INLINES_HIDDEN TRUE)

# add export header utility
include(GenerateExportHeader)

add_library(${PROJECT_NAME} SHARED
    multiplication.h
    multiplication.c
)

# generate the export header file
generate_export_header(${PROJECT_NAME})

target_include_directories(${PROJECT_NAME}
    PRIVATE
    ${CMAKE_CURRENT_BINARY_DIR}
    INTERFACE
    $<INSTALL_INTERFACE:include/multiplication>
)

if(WIN32)
    # install the .pdb
    install(FILES ${CMAKE_CURRENT_BINARY_DIR}/Debug/${PROJECT_NAME}.pdb
        DESTINATION lib/Debug
        CONFIGURATIONS Debug
    )
endif()

# install the headers
install(FILES multiplication.h ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}_export.h
    DESTINATION include/multiplication
)
