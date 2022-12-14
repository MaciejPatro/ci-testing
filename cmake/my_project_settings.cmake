cmake_minimum_required(VERSION 3.23)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

add_library(settings INTERFACE)
add_library(${PROJECT_NAME}::settings ALIAS settings)

include(my_project_warnings)
target_link_libraries(settings INTERFACE ${PROJECT_NAME}::compiler_warnings)

option(WITH_VALGRIND "Run unit tests with valgrind" OFF)
include(my_project_add_uts)

if(CMAKE_CXX_COMPILER_ID STREQUAL "Clang")
    add_compile_options(-stdlib=libc++)
    add_link_options(-stdlib=libc++)
endif()
