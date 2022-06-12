cmake_minimum_required(VERSION 3.17)

add_library(${PROJECT_NAME})

target_include_directories(${PROJECT_NAME} PUBLIC include)

target_sources(${PROJECT_NAME}
    PUBLIC
        include/my_proj/my_proj.hpp
    PRIVATE
        src/my_proj.cpp
)

if(BUILD_TESTING)
    find_package(doctest REQUIRED)

    add_executable(${PROJECT_NAME}_tests)
    target_sources(${PROJECT_NAME}_tests
        PRIVATE
            tests/my_proj_test.cpp
    )
    target_link_libraries(${PROJECT_NAME}_tests
        PRIVATE
            ${PROJECT_NAME}
            doctest::doctest
            my_proj::settings
    )
    my_proj_add_uts(${PROJECT_NAME})
endif()
