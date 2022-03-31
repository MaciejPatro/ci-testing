cmake_minimum_required(VERSION 3.17)

add_library(coverage INTERFACE)
add_library(${PROJECT_NAME}::coverage ALIAS coverage)

if (NOT ${CMAKE_BUILD_TYPE} STREQUAL Debug)
    message(FATAL_ERROR "Only Debug build type is supported for coverage reports!")
endif ()
if (CMAKE_CXX_COMPILER_ID STREQUAL "GNU" OR CMAKE_CXX_COMPILER_ID STREQUAL "Clang")
    target_compile_options(coverage INTERFACE --coverage)
    target_link_options(coverage INTERFACE --coverage)
else ()
    message(FATAL_ERROR "${CMAKE_CXX_COMPILER_ID} is not supported for coverage reports!")
endif ()
