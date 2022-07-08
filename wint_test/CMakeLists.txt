cmake_minimum_required(VERSION 3.17)
project(my_proj LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

include(my_proj_settings)

include(my_proj_conan)

conan_cmake_autodetect(DETECTED_SETTINGS)
conan_cmake_install(
    PATH_OR_REFERENCE ${CMAKE_SOURCE_DIR}/conan
    BUILD missing
    SETTINGS ${DETECTED_SETTINGS}
)

include(CTest)
add_subdirectory(source)
