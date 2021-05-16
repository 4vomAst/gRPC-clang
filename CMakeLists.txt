cmake_minimum_required(VERSION 3.19)
project(gRPC_clang)

set(CMAKE_CXX_STANDARD 17)

add_library(grpc STATIC ${CMAKE_SOURCE_DIR}/3rdParty/grpc/src/core/ext/filters/client_channel/lb_policy/xds/xds_cluster_resolver.cc )

target_include_directories(grpc
        PUBLIC
        ${CMAKE_SOURCE_DIR}/3rdParty/grpc/include
        ${CMAKE_SOURCE_DIR}/3rdParty/grpc/third_party/address_sorting/include
        ${CMAKE_SOURCE_DIR}/3rdParty/grpc
        ${CMAKE_SOURCE_DIR}/3rdParty/grpc/third_party/abseil-cpp
        ${CMAKE_SOURCE_DIR}/3rdParty/grpc/src/core/ext/upb-generated
        ${CMAKE_SOURCE_DIR}/3rdParty/grpc/third_party/upb
        ${CMAKE_SOURCE_DIR}/3rdParty/grpc/third_party/re2
        ${CMAKE_SOURCE_DIR}/3rdParty/grpc/third_party/boringssl-with-bazel/src/include
        )




add_executable(gRPC_clang main.cpp)