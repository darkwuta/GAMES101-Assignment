#define CV_CPU_SIMD_FILENAME "D:/github/myProjects/GAMES101-Assignment/Homework3/Assignment3/dependence/opencv-4.5.1/modules/core/test/test_intrin256.simd.hpp"
#define CV_CPU_DISPATCH_MODE AVX2
#include "opencv2/core/private/cv_cpu_include_simd_declarations.hpp"

#define CV_CPU_DISPATCH_MODE AVX512_SKX
#include "opencv2/core/private/cv_cpu_include_simd_declarations.hpp"

#define CV_CPU_DISPATCH_MODES_ALL AVX512_SKX, AVX2, BASELINE

#undef CV_CPU_SIMD_FILENAME