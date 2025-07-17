cmake_minimum_required(VERSION 3.22)
project(mon_projet)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

include(CommonConfig)

include(FetchContent)

FetchContent_Declare(
    ma_lib
    GIT_REPOSITORY https://github.com/Cyril-Grelier/ma_lib_cpp.git
    GIT_TAG        main
)

FetchContent_MakeAvailable(ma_lib)

add_executable(mon_projet src/main.cpp)

target_link_libraries(mon_projet PRIVATE ma_lib)
set_target_compile_options(mon_projet)
set_target_link_options(mon_projet)
