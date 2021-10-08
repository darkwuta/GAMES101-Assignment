# Install script for directory: D:/github/myProjects/GAMES101-Assignment/Homework3/Assignment3/dependence/opencv-4.5.1

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

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xlicensesx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/etc/licenses" TYPE FILE RENAME "ippicv-readme.htm" FILES "D:/github/myProjects/GAMES101-Assignment/Homework3/Assignment3/out/build/x64-Debug/dependence/opencv-4.5.1/3rdparty/ippicv/ippicv_win/icv/readme.htm")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xlicensesx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/etc/licenses" TYPE FILE RENAME "ippicv-EULA.rtf" FILES "D:/github/myProjects/GAMES101-Assignment/Homework3/Assignment3/out/build/x64-Debug/dependence/opencv-4.5.1/3rdparty/ippicv/ippicv_win/EULA.rtf")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xlicensesx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/etc/licenses" TYPE FILE RENAME "ippicv-third-party-programs.txt" FILES "D:/github/myProjects/GAMES101-Assignment/Homework3/Assignment3/out/build/x64-Debug/dependence/opencv-4.5.1/3rdparty/ippicv/ippicv_win/third-party-programs.txt")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xlicensesx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/etc/licenses" TYPE FILE RENAME "ippiw-support.txt" FILES "D:/github/myProjects/GAMES101-Assignment/Homework3/Assignment3/out/build/x64-Debug/dependence/opencv-4.5.1/3rdparty/ippicv/ippicv_win/icv/../iw/../support.txt")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xlicensesx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/etc/licenses" TYPE FILE RENAME "ippiw-third-party-programs.txt" FILES "D:/github/myProjects/GAMES101-Assignment/Homework3/Assignment3/out/build/x64-Debug/dependence/opencv-4.5.1/3rdparty/ippicv/ippicv_win/icv/../iw/../third-party-programs.txt")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xlicensesx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/etc/licenses" TYPE FILE RENAME "ippiw-EULA.rtf" FILES "D:/github/myProjects/GAMES101-Assignment/Homework3/Assignment3/out/build/x64-Debug/dependence/opencv-4.5.1/3rdparty/ippicv/ippicv_win/icv/../iw/../EULA.rtf")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xlicensesx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/etc/licenses" TYPE FILE RENAME "opencl-headers-LICENSE.txt" FILES "D:/github/myProjects/GAMES101-Assignment/Homework3/Assignment3/dependence/opencv-4.5.1/3rdparty/include/opencl/LICENSE.txt")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2" TYPE FILE FILES "D:/github/myProjects/GAMES101-Assignment/Homework3/Assignment3/out/build/x64-Debug/cvconfig.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2" TYPE FILE FILES "D:/github/myProjects/GAMES101-Assignment/Homework3/Assignment3/out/build/x64-Debug/opencv2/opencv_modules.hpp")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/x64/vc16/lib/OpenCVModules.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/x64/vc16/lib/OpenCVModules.cmake"
         "D:/github/myProjects/GAMES101-Assignment/Homework3/Assignment3/out/build/x64-Debug/dependence/opencv-4.5.1/CMakeFiles/Export/x64/vc16/lib/OpenCVModules.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/x64/vc16/lib/OpenCVModules-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/x64/vc16/lib/OpenCVModules.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/x64/vc16/lib" TYPE FILE FILES "D:/github/myProjects/GAMES101-Assignment/Homework3/Assignment3/out/build/x64-Debug/dependence/opencv-4.5.1/CMakeFiles/Export/x64/vc16/lib/OpenCVModules.cmake")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/x64/vc16/lib" TYPE FILE FILES "D:/github/myProjects/GAMES101-Assignment/Homework3/Assignment3/out/build/x64-Debug/dependence/opencv-4.5.1/CMakeFiles/Export/x64/vc16/lib/OpenCVModules-debug.cmake")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/x64/vc16/lib" TYPE FILE FILES
    "D:/github/myProjects/GAMES101-Assignment/Homework3/Assignment3/out/build/x64-Debug/win-install/OpenCVConfig-version.cmake"
    "D:/github/myProjects/GAMES101-Assignment/Homework3/Assignment3/out/build/x64-Debug/win-install/x64/vc16/lib/OpenCVConfig.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/." TYPE FILE FILES
    "D:/github/myProjects/GAMES101-Assignment/Homework3/Assignment3/out/build/x64-Debug/win-install/OpenCVConfig-version.cmake"
    "D:/github/myProjects/GAMES101-Assignment/Homework3/Assignment3/out/build/x64-Debug/win-install/OpenCVConfig.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xlibsx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/." TYPE FILE PERMISSIONS OWNER_READ OWNER_WRITE GROUP_READ WORLD_READ FILES "D:/github/myProjects/GAMES101-Assignment/Homework3/Assignment3/dependence/opencv-4.5.1/LICENSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xscriptsx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/." TYPE FILE PERMISSIONS OWNER_READ OWNER_WRITE OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE FILES "D:/github/myProjects/GAMES101-Assignment/Homework3/Assignment3/out/build/x64-Debug/CMakeFiles/install/setup_vars_opencv4.cmd")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("D:/github/myProjects/GAMES101-Assignment/Homework3/Assignment3/out/build/x64-Debug/dependence/opencv-4.5.1/3rdparty/zlib/cmake_install.cmake")
  include("D:/github/myProjects/GAMES101-Assignment/Homework3/Assignment3/out/build/x64-Debug/dependence/opencv-4.5.1/3rdparty/libjpeg-turbo/cmake_install.cmake")
  include("D:/github/myProjects/GAMES101-Assignment/Homework3/Assignment3/out/build/x64-Debug/dependence/opencv-4.5.1/3rdparty/libtiff/cmake_install.cmake")
  include("D:/github/myProjects/GAMES101-Assignment/Homework3/Assignment3/out/build/x64-Debug/dependence/opencv-4.5.1/3rdparty/libwebp/cmake_install.cmake")
  include("D:/github/myProjects/GAMES101-Assignment/Homework3/Assignment3/out/build/x64-Debug/dependence/opencv-4.5.1/3rdparty/openjpeg/cmake_install.cmake")
  include("D:/github/myProjects/GAMES101-Assignment/Homework3/Assignment3/out/build/x64-Debug/dependence/opencv-4.5.1/3rdparty/libpng/cmake_install.cmake")
  include("D:/github/myProjects/GAMES101-Assignment/Homework3/Assignment3/out/build/x64-Debug/dependence/opencv-4.5.1/3rdparty/openexr/cmake_install.cmake")
  include("D:/github/myProjects/GAMES101-Assignment/Homework3/Assignment3/out/build/x64-Debug/dependence/opencv-4.5.1/3rdparty/ippiw/cmake_install.cmake")
  include("D:/github/myProjects/GAMES101-Assignment/Homework3/Assignment3/out/build/x64-Debug/dependence/opencv-4.5.1/3rdparty/protobuf/cmake_install.cmake")
  include("D:/github/myProjects/GAMES101-Assignment/Homework3/Assignment3/out/build/x64-Debug/dependence/opencv-4.5.1/3rdparty/quirc/cmake_install.cmake")
  include("D:/github/myProjects/GAMES101-Assignment/Homework3/Assignment3/out/build/x64-Debug/dependence/opencv-4.5.1/3rdparty/ittnotify/cmake_install.cmake")
  include("D:/github/myProjects/GAMES101-Assignment/Homework3/Assignment3/out/build/x64-Debug/dependence/opencv-4.5.1/include/cmake_install.cmake")
  include("D:/github/myProjects/GAMES101-Assignment/Homework3/Assignment3/out/build/x64-Debug/dependence/opencv-4.5.1/modules/cmake_install.cmake")
  include("D:/github/myProjects/GAMES101-Assignment/Homework3/Assignment3/out/build/x64-Debug/dependence/opencv-4.5.1/doc/cmake_install.cmake")
  include("D:/github/myProjects/GAMES101-Assignment/Homework3/Assignment3/out/build/x64-Debug/dependence/opencv-4.5.1/data/cmake_install.cmake")
  include("D:/github/myProjects/GAMES101-Assignment/Homework3/Assignment3/out/build/x64-Debug/dependence/opencv-4.5.1/apps/cmake_install.cmake")

endif()

