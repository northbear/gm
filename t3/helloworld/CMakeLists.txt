cmake_minimum_required(VERSION 3.10)

project(HelloWorld)
add_executable(helloworld main.cpp banner.cpp)
file(COPY lib DESTINATION ${CMAKE_CURRENT_BINARY_DIR}/.)
