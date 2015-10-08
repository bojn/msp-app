##
#
##
function(initialize_all_submodules)
execute_process(COMMAND             git submodule update --init --recursive
                WORKING_DIRECTORY   ${CMAKE_CURRENT_SOURCE_DIR}
)
endfunction(initialize_all_submodules)

##
# Initializes GIT submodules
# @NAME - name of local directory where the submodule is stored
# @BRANCH - name of submodule branch
##
function(initialize_git_submodule)

set(options)
set(oneValueArgs NAME BRANCH SUBDIRECTORY)
set(multiValueArgs)
include(CMakeParseArguments)
cmake_parse_arguments(RHS  "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

message(STATUS "Updating submodule ${RHS_NAME} : [${RHS_BRANCH}]")
message(STATUS "(this can take a while, please be patient)")

# Checkout each submodule to the specified branch
message(STATUS "git checkout ${RHS_BRANCH} in ${CMAKE_CURRENT_SOURCE_DIR}/${RHS_SUBDIRECTORY}/${RHS_NAME}")
execute_process(COMMAND git checkout ${RHS_BRANCH}
                WORKING_DIRECTORY    ${CMAKE_CURRENT_SOURCE_DIR}/${RHS_SUBDIRECTORY}/${RHS_NAME}
)
endfunction(initialize_git_submodule)
