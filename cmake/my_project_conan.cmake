cmake_minimum_required(VERSION 3.17)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_BINARY_DIR}")

if(NOT EXISTS "${CMAKE_BINARY_DIR}/conan.cmake")
    message(STATUS "Downloading conan.cmake from https://github.com/conan-io/cmake-conan")
    file(DOWNLOAD
            "https://github.com/conan-io/cmake-conan/raw/0.17.0/conan.cmake"
            "${CMAKE_BINARY_DIR}/conan.cmake"
        EXPECTED_HASH SHA256=3bef79da16c2e031dc429e1dac87a08b9226418b300ce004cc125a82687baeef
        TLS_VERIFY ON
    )
endif()

include(${CMAKE_BINARY_DIR}/conan.cmake)

if(NOT CMAKE_CONFIGURATION_TYPES)
    message(STATUS "Single configuration build!")
    set(LIST_OF_BUILD_TYPES ${CMAKE_BUILD_TYPE})
    set(CONAN_CMAKE_GENERATOR "cmake_find_package")
else()
    message(STATUS "Multi-configuration build: '${CMAKE_CONFIGURATION_TYPES}'!")
    set(LIST_OF_BUILD_TYPES ${CMAKE_CONFIGURATION_TYPES})
    set(CONAN_CMAKE_GENERATOR "cmake_find_package_multi")
endif()

foreach(TYPE ${LIST_OF_BUILD_TYPES})
    conan_cmake_autodetect(DETECTED_SETTINGS BUILD_TYPE ${TYPE})
    conan_cmake_install(
        PATH_OR_REFERENCE ${CMAKE_SOURCE_DIR}/conan
        BUILD missing
        GENERATOR ${CONAN_CMAKE_GENERATOR}
        SETTINGS ${DETECTED_SETTINGS}
    )
endforeach()
