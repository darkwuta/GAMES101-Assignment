
set(CMAKE_BUILD_TYPE "Debug")

set(BUILD_SHARED_LIBS "ON")

set(CMAKE_C_FLAGS " /DWIN32 /D_WINDOWS /W3  /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D _SCL_SECURE_NO_WARNINGS /Gy /bigobj /Oi  /fp:precise /FS    ")

set(CMAKE_C_FLAGS_DEBUG "/MDd /Zi /Ob0 /Od /RTC1 ")

set(CMAKE_C_FLAGS_RELEASE "  /MD /O2 /Ob2 /DNDEBUG ")

set(CMAKE_CXX_FLAGS " /DWIN32 /D_WINDOWS /W4 /GR  /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D _SCL_SECURE_NO_WARNINGS /Gy /bigobj /Oi  /fp:precise /FS     /EHa /wd4127 /wd4251 /wd4324 /wd4275 /wd4512 /wd4589")

set(CMAKE_CXX_FLAGS_DEBUG " /MDd /Zi /Ob0 /Od /RTC1 ")

set(CMAKE_CXX_FLAGS_RELEASE " /MD /O2 /Ob2 /DNDEBUG ")

set(CV_GCC "")

set(CV_CLANG "")

set(ENABLE_NOISY_WARNINGS "OFF")

set(CMAKE_MODULE_LINKER_FLAGS "/machine:x64")

set(CMAKE_INSTALL_PREFIX "D:/github/myProjects/GAMES101-Assignment/Homework3/Assignment3/out/install/x64-Debug")

set(OPENCV_PYTHON_INSTALL_PATH "")

set(OpenCV_SOURCE_DIR "D:/github/myProjects/GAMES101-Assignment/Homework3/Assignment3/dependence/opencv-4.5.1")

set(OPENCV_FORCE_PYTHON_LIBS "")

set(OPENCV_PYTHON_SKIP_LINKER_EXCLUDE_LIBS "")

set(OPENCV_PYTHON_BINDINGS_DIR "D:/github/myProjects/GAMES101-Assignment/Homework3/Assignment3/out/build/x64-Debug/dependence/opencv-4.5.1/modules/python_bindings_generator")

set(cv2_custom_hdr "D:/github/myProjects/GAMES101-Assignment/Homework3/Assignment3/out/build/x64-Debug/dependence/opencv-4.5.1/modules/python_bindings_generator/pyopencv_custom_headers.h")

set(cv2_generated_files "D:/github/myProjects/GAMES101-Assignment/Homework3/Assignment3/out/build/x64-Debug/dependence/opencv-4.5.1/modules/python_bindings_generator/pyopencv_generated_enums.h;D:/github/myProjects/GAMES101-Assignment/Homework3/Assignment3/out/build/x64-Debug/dependence/opencv-4.5.1/modules/python_bindings_generator/pyopencv_generated_funcs.h;D:/github/myProjects/GAMES101-Assignment/Homework3/Assignment3/out/build/x64-Debug/dependence/opencv-4.5.1/modules/python_bindings_generator/pyopencv_generated_include.h;D:/github/myProjects/GAMES101-Assignment/Homework3/Assignment3/out/build/x64-Debug/dependence/opencv-4.5.1/modules/python_bindings_generator/pyopencv_generated_modules.h;D:/github/myProjects/GAMES101-Assignment/Homework3/Assignment3/out/build/x64-Debug/dependence/opencv-4.5.1/modules/python_bindings_generator/pyopencv_generated_modules_content.h;D:/github/myProjects/GAMES101-Assignment/Homework3/Assignment3/out/build/x64-Debug/dependence/opencv-4.5.1/modules/python_bindings_generator/pyopencv_generated_types.h;D:/github/myProjects/GAMES101-Assignment/Homework3/Assignment3/out/build/x64-Debug/dependence/opencv-4.5.1/modules/python_bindings_generator/pyopencv_generated_types_content.h;D:/github/myProjects/GAMES101-Assignment/Homework3/Assignment3/out/build/x64-Debug/dependence/opencv-4.5.1/modules/python_bindings_generator/pyopencv_signatures.json")
