cmake_minimum_required(VERSION 3.25)
project(CUDA_SNIPPETS LANGUAGES CUDA CXX)
set(CMAKE_CUDA_COMPILER "/usr/local/cuda/bin/nvcc")
set(CMAKE_CXX_COMPILER "clang++")
set(CMAKE_CUDA_ARCHITECTURES "native")



add_subdirectory(helloworld)
add_subdirectory(vectoradd)