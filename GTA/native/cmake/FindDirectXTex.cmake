INCLUDE(FindPackageHandleStandardArgs)

IF(NOT DirectXTex_INCLUDE_DIR)
FIND_PATH(DirectXTex_INCLUDE_DIR 
    NAMES DirectXTex.h)
ENDIF()

IF(TARGET_64)
FIND_LIBRARY(DirectXTex_LIBRARY_DEBUG 
    NAMES DirectXTex_64d
    PATHS ${DirectXTex_INCLUDE_DIR}/lib)
    
FIND_LIBRARY(DirectXTex_LIBRARY_RELEASE 
    NAMES DirectXTex_64 
    PATHS ${DirectXTex_INCLUDE_DIR}/lib)
ELSE()
FIND_LIBRARY(DirectXTex_LIBRARY_DEBUG 
    NAMES DirectXTex_d
    PATHS ${DirectXTex_INCLUDE_DIR}/lib)
    
FIND_LIBRARY(DirectXTex_LIBRARY_RELEASE 
    NAMES DirectXTex 
    PATHS ${DirectXTex_INCLUDE_DIR}/lib)
ENDIF()
    
FIND_PACKAGE_HANDLE_STANDARD_ARGS(DirectXTex 
    DEFAULT_MSG 
    DirectXTex_INCLUDE_DIR 
    DirectXTex_LIBRARY_DEBUG
    DirectXTex_LIBRARY_RELEASE)
    
IF(DIRECTXTEX_FOUND)
    set(DirectXTex_LIBRARY optimized ${DirectXTex_LIBRARY_RELEASE} debug ${DirectXTex_LIBRARY_DEBUG} CACHE STRING "")
    mark_as_advanced(DirectXTex_LIBRARY_RELEASE DirectXTex_LIBRARY_DEBUG DirectXTex_BINARY_RELEASE)
ENDIF()