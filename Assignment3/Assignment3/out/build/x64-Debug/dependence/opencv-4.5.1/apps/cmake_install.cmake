# Install script for directory: D:/github/myProjects/GAMES101-Assignment/Homework3/Assignment3/dependence/opencv-4.5.1/apps

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "D:/github/myProjects/GAMES101-Assignment/Homework3/Assignment3/out/install/x64-Debug")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("D:/github/myProjects/GAMES101-Assignment/Homework3/Assignment3/out/build/x64-Debug/dependence/opencv-4.5.1/apps/annotation/cmake_install.cmake")
  include("D:/github/myProjects/GAMES101-Assignment/Homework3/Assignment3/out/build/x64-Debug/dependence/opencv-4.5.1/apps/visualisation/cmake_install.cmake")
  include("D:/github/myProjects/GAMES101-Assignment/Homework3/Assignment3/out/build/x64-Debug/dependence/opencv-4.5.1/apps/interactive-calibration/cmake_install.cmake")
  include("D:/github/myProjects/GAMES101-Assignment/Homework3/Assignment3/out/build/x64-Debug/dependence/opencv-4.5.1/apps/version/cmake_install.cmake")

endif()
