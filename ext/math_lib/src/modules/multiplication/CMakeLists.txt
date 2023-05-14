project(math_multiplication)

# set symbols to be hidden by default
set(CMAKE_C_VISIBILITY_PRESET "hidden")
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
)

# install the .lib
install(TARGETS ${PROJECT_NAME}
    EXPORT ${MATH_LIB_EXPORT}
    DESTINATION lib/$<CONFIG>/${PROJECT_NAME}
    INCLUDES DESTINATION include/multiplication
)

# install the headers
install(FILES multiplication.h ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}_export.h
    DESTINATION include/multiplication
)

if(WIN32 AND MSVC)
    # install the .pdb
    install(FILES ${CMAKE_CURRENT_BINARY_DIR}/Debug/${PROJECT_NAME}.pdb
        DESTINATION lib/Debug/${PROJECT_NAME}
        CONFIGURATIONS Debug
    )
endif()
