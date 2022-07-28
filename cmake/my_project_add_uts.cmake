cmake_minimum_required(VERSION 3.17)

function (my_project_add_uts TARGET)
    if (BUILD_TESTING)
        if (WITH_VALGRIND)
            find_program(VALGRIND_EXE NAMES "valgrind")
            mark_as_advanced(VALGRIND_EXE)
            if (NOT VALGRIND_EXE)
                message(FATAL_ERROR "valgrind is not found!")
            endif()
            add_test(
                NAME ${PROJECT_NAME}_uts
                COMMAND
                    valgrind --tool=memcheck --leak-check=yes
                    $<TARGET_FILE:${TARGET}_tests>
                    $<$<BOOL:$ENV{CI}>:-r=junit>
                    $<$<BOOL:$ENV{CI}>:-o=${CMAKE_BINARY_DIR}/${TARGET}_tests.xml>
            )
        else()
            add_test(
                NAME ${TARGET}_uts
                COMMAND
                    $<TARGET_FILE:${TARGET}_tests>
                    $<$<BOOL:$ENV{CI}>:-r=junit>
                    $<$<BOOL:$ENV{CI}>:-o=${CMAKE_BINARY_DIR}/${TARGET}_tests.xml>
            )
        endif()
    endif()
endfunction()
