cmake_minimum_required(VERSION 3.22)

project("Empty Window")

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED True)

add_executable(empty_window src/empty_window.cpp)

find_package(glfw3 3.3 REQUIRED)
find_package(OpenGL REQUIRED)


target_link_libraries(empty_window glfw GL)

target_include_directories(empty_window PRIVATE "src")
target_include_directories(empty_window PUBLIC "include")

add_subdirectory(src)
