cmake_minimum_required(VERSION 2.8)

#################################################
# Include deps
#################################################
include(cmake/initialize_git_submodule.cmake)

#################################################
# Initialize all submodules in the msp-app repo
#################################################
initialize_all_submodules()

#################################################
# Checkout and initialize GIT submodules
#################################################
add_subdirectory(easy-angle-3.2)
add_subdirectory(easy-angle-3.3)
