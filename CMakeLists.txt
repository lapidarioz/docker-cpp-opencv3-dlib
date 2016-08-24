project(dlib-container)
cmake_minimum_required(VERSION 2.8.4)

include(../dlib/dlib/cmake)

find_package(OpenCV)
include_directories(${OpenCV_INCLUDE_DIRS})

add_executable(${PROJECT_NAME} main.cpp)
target_link_libraries(${PROJECT_NAME} dlib ${OpenCV_LIBS})
