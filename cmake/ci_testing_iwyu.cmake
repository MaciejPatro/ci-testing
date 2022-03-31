cmake_minimum_required(VERSION 3.17)

if (NOT ${CMAKE_CXX_COMPILER_ID} STREQUAL "Clang")
    message(FATAL_ERROR "Clang compiler needed!")
endif ()

find_program(IWYU_EXE NAMES "include-what-you-use")
mark_as_advanced(IWYU_EXE)
if (NOT IWYU_EXE)
    message(FATAL_ERROR "include-what-you-use not found!")
else()
    set(CMAKE_CXX_INCLUDE_WHAT_YOU_USE ${IWYU_EXE};-Xiwyu;--cxx17ns;-Xiwyu;--mapping_file=${CMAKE_SOURCE_DIR}/cmake/map.imp)
endif()
