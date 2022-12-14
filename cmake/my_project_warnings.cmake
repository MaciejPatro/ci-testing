cmake_minimum_required(VERSION 3.23)

add_library(compiler_warnings INTERFACE)
add_library(${PROJECT_NAME}::compiler_warnings ALIAS compiler_warnings)

if(MSVC)
    target_compile_options(compiler_warnings INTERFACE /W4 /WX)
else()
    target_compile_options(compiler_warnings INTERFACE -Wall -Wextra -Werror)
endif()
