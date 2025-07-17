set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE "Release")
endif()

set(WARN_FLAGS_COMMON
    -Wall
    -Wextra
    -Wshadow
    -Wcast-align
    -Wunused
    -Wpedantic
    -Wconversion
    -Wmisleading-indentation
    -Wnull-dereference
    -Wdouble-promotion
    -Wformat=2
    -Werror
)

function(set_target_compile_options target_name)
    target_compile_options(${target_name} PUBLIC ${WARN_FLAGS_COMMON})
    target_compile_options(${target_name} PUBLIC
        $<$<CONFIG:Debug>:-O0 -g -DDEBUG -fsanitize=address,undefined -fno-sanitize-recover=all>
        $<$<CONFIG:Release>:-O3 -DNDEBUG -flto=auto>
    )
endfunction()

function(set_target_link_options target_name)
    target_link_options(${target_name} PUBLIC
        $<$<CONFIG:Debug>:-fsanitize=address,undefined -fno-sanitize-recover=all>
    )
endfunction()