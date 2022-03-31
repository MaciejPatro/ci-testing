cmake_minimum_required(VERSION 3.17)

add_library(${PROJECT_NAME} INTERFACE)

target_include_directories(${PROJECT_NAME} INTERFACE include)

target_sources(${PROJECT_NAME}
    INTERFACE
        include/ci_testing/ci_testing.hpp
)

if(BUILD_TESTING)
    find_package(doctest REQUIRED)

    add_executable(${PROJECT_NAME}_tests)
    target_sources(${PROJECT_NAME}_tests PRIVATE tests/ci_testing_test.cpp)
    target_link_libraries(${PROJECT_NAME}_tests PRIVATE ${PROJECT_NAME} doctest::doctest ci_testing::settings)

    ci_testing_add_uts(${PROJECT_NAME})
endif()
