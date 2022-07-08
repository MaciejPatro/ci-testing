cmake_minimum_required(VERSION 3.17)

add_library(${PROJECT_NAME} INTERFACE)

target_include_directories(${PROJECT_NAME} INTERFACE include)
target_sources(${PROJECT_NAME}
    INTERFACE
        include/my_proj/my_proj.hpp
)

if(BUILD_TESTING)
    find_package(None REQUIRED)

    add_executable(${PROJECT_NAME}_tests)
    target_sources(${PROJECT_NAME}_tests
        PRIVATE
            tests/my_proj_test.cpp
    )
    target_link_libraries(${PROJECT_NAME}_tests
        PRIVATE
            ${PROJECT_NAME}
            None::None
            my_proj::settings
    )
    my_proj_add_uts(${PROJECT_NAME})
endif()
