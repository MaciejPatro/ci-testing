cmake_minimum_required(VERSION 3.17)

add_library(settings INTERFACE)
add_library(${PROJECT_NAME}::settings ALIAS settings)

include(ci_testing_warnings)
target_link_libraries(settings INTERFACE ${PROJECT_NAME}::compiler_warnings)

option(WITH_VALGRIND "Run unit tests with valgrind" OFF)
include(ci_testing_add_uts)

option(WITH_COVERAGE "Prepare code-coverage report with coverage" OFF)
if(WITH_COVERAGE)
    message("[ci_testing]: Code coverage enabled.")
    include(ci_testing_coverage)
    target_link_libraries(settings INTERFACE ${PROJECT_NAME}::coverage)
endif()

option(WITH_IWYU "Enable include-what-you-use checking" OFF)
if(WITH_IWYU)
    message("[ci_testing]: include-what-you-use enabled.")
    include(ci_testing_iwyu)
endif()

if(CMAKE_CXX_COMPILER_ID STREQUAL "Clang" AND NOT WITH_IWYU)
    add_compile_options(-stdlib=libc++)
    add_link_options(-stdlib=libc++)
endif()
