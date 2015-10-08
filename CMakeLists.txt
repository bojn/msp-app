cmake_minimum_required(VERSION 2.8)

#################################################
# Include deps
#################################################
include(cmake/initialize_git_submodule.cmake)

#################################################
# Checkout and initialize GIT submodules
#################################################
initialize_git_submodule(NAME msp-lib BRANCH master)

## Create project
project(easy_angle_G33)

