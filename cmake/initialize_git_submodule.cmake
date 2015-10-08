##
# Initializes GIT submodules
##
function(initialize_git_submodule)

set(options)
set(oneValueArgs NAME BRANCH SUBDIRECTORY)
set(multiValueArgs)
include(CMakeParseArguments)
cmake_parse_arguments(RHS  "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

set(PROJECT_SOURCE_DIR  ${CMAKE_SOURCE_DIR})
if(EXISTS "${PROJECT_SOURCE_DIR}/.gitmodules")
message(STATUS "Updating submodule ${RHS_NAME} : [${RHS_BRANCH}]")
message(STATUS "(this can take a while, please be patient)")

### First, get all submodules in
execute_process(COMMAND             git submodule update --init --recursive
                WORKING_DIRECTORY   ${PROJECT_SOURCE_DIR}
)

### Then, checkout each submodule to the specified commit
# Note: Execute separate processes here, to make sure each one is run,
# should one crash (because of branch not existing, this, that ... whatever)
message(STATUS "git checkout ${RHS_BRANCH} in ${PROJECT_SOURCE_DIR}/${RHS_SUBDIRECTORY}/${RHS_NAME}")
execute_process(COMMAND git checkout ${RHS_BRANCH}
                WORKING_DIRECTORY    ${PROJECT_SOURCE_DIR}/${RHS_SUBDIRECTORY}/${RHS_NAME}
)
else()
  message(WARNING "Git repo is not setup correctly")
endif()

endfunction(initialize_git_submodule)
