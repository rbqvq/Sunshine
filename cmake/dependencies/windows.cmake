# windows specific dependencies

# Make sure MinHook is installed
if(NOT CMAKE_SYSTEM_PROCESSOR MATCHES "ARM64")
    find_library(MINHOOK_LIBRARY libMinHook.a REQUIRED)
    find_path(MINHOOK_INCLUDE_DIR MinHook.h PATH_SUFFIXES include REQUIRED)

    add_library(minhook::minhook STATIC IMPORTED)
    set_property(TARGET minhook::minhook PROPERTY IMPORTED_LOCATION ${MINHOOK_LIBRARY})
    target_include_directories(minhook::minhook INTERFACE ${MINHOOK_INCLUDE_DIR})
endif()