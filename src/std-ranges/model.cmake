
register_flag_optional(CMAKE_CXX_COMPILER
        "Any CXX compiler that is supported by CMake detection and supports C++20 Ranges"
        "c++")

register_flag_optional(USE_TBB
        "Link against an in-tree oneTBB via FetchContent_Declare, see top level CMakeLists.txt for details."
        "OFF")

macro(setup)

    # TODO this needs to eventually be removed when CMake adds proper C++20 support or at least update the flag used here

    # C++ 2a is too new, disable CMake's std flags completely:
    set(CMAKE_CXX_EXTENSIONS OFF)
    set(CMAKE_CXX_STANDARD_REQUIRED OFF)
#    set(CMAKE_CXX_STANDARD 20)

    unset(CMAKE_CXX_STANDARD) # drop any existing standard we have set by default
    # and append our own:
    register_append_cxx_flags(ANY -std=c++2a)

    if (USE_TBB)
        register_link_library(TBB::tbb)
    endif ()


endmacro()
