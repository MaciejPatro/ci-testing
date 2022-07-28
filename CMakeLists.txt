cmake_minimum_required(VERSION 3.17)
project(my_project LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

include(my_project_settings)
include(CTest)
add_subdirectory(source)
