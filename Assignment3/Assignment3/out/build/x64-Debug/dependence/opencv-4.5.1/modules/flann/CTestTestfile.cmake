# CMake generated Testfile for 
# Source directory: D:/github/myProjects/GAMES101-Assignment/Homework3/Assignment3/dependence/opencv-4.5.1/modules/flann
# Build directory: D:/github/myProjects/GAMES101-Assignment/Homework3/Assignment3/out/build/x64-Debug/dependence/opencv-4.5.1/modules/flann
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(opencv_test_flann "D:/github/myProjects/GAMES101-Assignment/Homework3/Assignment3/out/build/x64-Debug/bin/opencv_test_flannd.exe" "--gtest_output=xml:opencv_test_flann.xml")
set_tests_properties(opencv_test_flann PROPERTIES  LABELS "Main;opencv_flann;Accuracy" WORKING_DIRECTORY "D:/github/myProjects/GAMES101-Assignment/Homework3/Assignment3/out/build/x64-Debug/test-reports/accuracy" _BACKTRACE_TRIPLES "D:/github/myProjects/GAMES101-Assignment/Homework3/Assignment3/dependence/opencv-4.5.1/cmake/OpenCVUtils.cmake;1677;add_test;D:/github/myProjects/GAMES101-Assignment/Homework3/Assignment3/dependence/opencv-4.5.1/cmake/OpenCVModule.cmake;1311;ocv_add_test_from_target;D:/github/myProjects/GAMES101-Assignment/Homework3/Assignment3/dependence/opencv-4.5.1/cmake/OpenCVModule.cmake;1075;ocv_add_accuracy_tests;D:/github/myProjects/GAMES101-Assignment/Homework3/Assignment3/dependence/opencv-4.5.1/modules/flann/CMakeLists.txt;2;ocv_define_module;D:/github/myProjects/GAMES101-Assignment/Homework3/Assignment3/dependence/opencv-4.5.1/modules/flann/CMakeLists.txt;0;")
