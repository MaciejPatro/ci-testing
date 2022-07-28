cmake_minimum_required(VERSION 3.17)

add_library(${PROJECT_NAME})

target_include_directories(${PROJECT_NAME} PUBLIC include)
target_sources(${PROJECT_NAME}
    PUBLIC
        include/my_project/my_project.hpp
    PRIVATE
        src/my_project.cpp
)
target_link_libraries(${PROJECT_NAME}
    PRIVATE
        my_project::settings
)

add_executable(${PROJECT_NAME}_main src/main.cpp)
target_link_libraries(${PROJECT_NAME}_main
    PRIVATE
        ${PROJECT_NAME}
        my_project::settings
)

if(BUILD_TESTING)
    find_package(doctest REQUIRED)

    add_executable(${PROJECT_NAME}_tests)
    target_sources(${PROJECT_NAME}_tests
        PRIVATE
            tests/my_project_test.cpp
    )
    target_link_libraries(${PROJECT_NAME}_tests
        PRIVATE
            ${PROJECT_NAME}
            doctest::doctest
            my_project::settings
    )
    my_project_add_uts(${PROJECT_NAME})
endif()
