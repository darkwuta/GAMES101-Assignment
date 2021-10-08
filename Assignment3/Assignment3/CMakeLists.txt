cmake_minimum_required(VERSION 3.10)
project(Rasterizer)


set(CMAKE_CXX_STANDARD 17)

#include_directories(/usr/local/include ./include)
add_subdirectory(${PROJECT_SOURCE_DIR}/dependence/opencv-4.5.1)
include_directories(${PROJECT_SOURCE_DIR}/dependence
					${PROJECT_SOURCE_DIR}/dependence/eigen3
					${PROJECT_SOURCE_DIR}/dependence/eigen3/Eigen)

add_executable(Rasterizer main.cpp rasterizer.hpp rasterizer.cpp global.hpp Triangle.hpp Triangle.cpp Texture.hpp Texture.cpp Shader.hpp OBJ_Loader.h)
target_link_libraries(Rasterizer ${OpenCV_LIBRARIES})
#target_compile_options(Rasterizer PUBLIC -Wall -Wextra -pedantic)