project(math_division)

add_library(${PROJECT_NAME} STATIC
    division.h
    division.c
)

# install the .lib
install(TARGETS ${PROJECT_NAME}
    EXPORT ${MATH_LIB_EXPORT}
    DESTINATION lib/$<CONFIG>/${PROJECT_NAME}
    INCLUDES DESTINATION include/division
)

# install the headers
install(FILES division.h
    DESTINATION include/division
)

if(WIN32 AND MSVC)
    # install the .pdb
    install(FILES ${CMAKE_CURRENT_BINARY_DIR}/Debug/${PROJECT_NAME}.pdb
        DESTINATION lib/Debug/${PROJECT_NAME}
        CONFIGURATIONS Debug
    )
endif()
