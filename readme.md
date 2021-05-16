# Clang crashes when compiling xds_cluster_resolver.cc from grpc project

# Building on Windows
## Setup environment:
1. Install cmake 3.19.8
    1. Download cmake from https://cmake.org/download/ as zip and extract it to c:\tools\cmake
       Add to path: c:\tools\cmake\bin
1. Install ninja
    1. Download ninja-win.zip version v1.10.1 or later from https://github.com/ninja-build/ninja/releases
       and extract it to c:\Tools\Ninja\  
       Add to path: c:\Tools\Ninja
1. Install clang 10.0.0
    1. Download prebuild binaries for Windows 64 bit from https://releases.llvm.org/download.html
       and install it to default location c:\Program Files\LLVM\
       Add to path: C:\Program Files\LLVM\bin
1. Checkout project: https://github.com/4vomAst/gRPC-clang.git
1. git submodule init
1. git submodule update --init --recursive
1. run Build.ps1 multiple times till crash occurs

```
Stack dump:
0.      Program arguments: C:\PROGRA~1\LLVM\bin\CLANG_~1.EXE -I../../../3rdParty/grpc/include -I../../../3rdParty/grpc/third_party/address_sorting/include -I../../../3rdParty/grpc -I../../../3rdParty/grpc/third_party/abseil-cpp -I../../../3rdParty/grpc/src/core/ext/upb-generated -I../../../3rdParty/grpc/third_party/upb -I../../../3rdParty/grpc/third_party/re2 -I../../../3rdParty/openssl -m32 -O2 -g -DNDEBUG -Xclang -gcodeview -D_DLL -D_MT -Xclang --dependent-lib=msvcrt -std=gnu++17 -MD -MT CMakeFiles/grpc.dir/3rdParty/grpc/src/core/ext/filters/client_channel/lb_policy/xds/xds_cluster_resolver.cc.obj -MF CMakeFiles\grpc.dir\3rdParty\grpc\src\core\ext\filters\client_channel\lb_policy\xds\xds_cluster_resolver.cc.obj.d -o CMakeFiles/grpc.dir/3rdParty/grpc/src/core/ext/filters/client_channel/lb_policy/xds/xds_cluster_resolver.cc.obj -c ../../../3rdParty/grpc/src/core/ext/filters/client_channel/lb_policy/xds/xds_cluster_resolver.cc
1.      <eof> parser at end of file
2.      Code generation
3.      Running pass 'Function Pass Manager' on module '../../../3rdParty/grpc/src/core/ext/filters/client_channel/lb_policy/xds/xds_cluster_resolver.cc'.
4.      Running pass 'Loop Pass Manager' on function '@"??$Insert@V?$IteratorValueAdapter@V?$allocator@UPriority@EdsUpdate@XdsApi@grpc_core@@@std@@PAUPriority@EdsUpdate@XdsApi@grpc_core@@@inlined_vector_internal@lts_2020_09_23@absl@@@?$Storage@UPriority@EdsUpdate@XdsApi@grpc_core@@$01V?$allocator@UPriority@EdsUpdate@XdsApi@grpc_core@@@std@@@inlined_vector_internal@lts_2020_09_23@absl@@QAEPAUPriority@EdsUpdate@XdsApi@grpc_core@@PBU4567@V?$IteratorValueAdapter@V?$allocator@UPriority@EdsUpdate@XdsApi@grpc_core@@@std@@PAUPriority@EdsUpdate@XdsApi@grpc_core@@@123@I@Z"'
5.      Running pass 'Loop Strength Reduction' on basic block '%166'
#0 0x00007ff7a9cdae51 (C:\PROGRA~1\LLVM\bin\CLANG_~1.EXE+0x11cae51)
#1 0x00007ff7a8b5f005 (C:\PROGRA~1\LLVM\bin\CLANG_~1.EXE+0x4f005)
#2 0x00007ff7aa084196 (C:\PROGRA~1\LLVM\bin\CLANG_~1.EXE+0x1574196)
#3 0x00007ff7aa071d6e (C:\PROGRA~1\LLVM\bin\CLANG_~1.EXE+0x1561d6e)
#4 0x00007ff7aa068525 (C:\PROGRA~1\LLVM\bin\CLANG_~1.EXE+0x1558525)
#5 0x00007ff7aa0850de (C:\PROGRA~1\LLVM\bin\CLANG_~1.EXE+0x15750de)
#6 0x00007ff7a99cc8f3 (C:\PROGRA~1\LLVM\bin\CLANG_~1.EXE+0xebc8f3)
#7 0x00007ff7a9ca8b49 (C:\PROGRA~1\LLVM\bin\CLANG_~1.EXE+0x1198b49)
#8 0x00007ff7a9ca8e03 (C:\PROGRA~1\LLVM\bin\CLANG_~1.EXE+0x1198e03)
#9 0x00007ff7a9ca9310 (C:\PROGRA~1\LLVM\bin\CLANG_~1.EXE+0x1199310)
#10 0x00007ff7aa3f1cb3 (C:\PROGRA~1\LLVM\bin\CLANG_~1.EXE+0x18e1cb3)
#11 0x00007ff7ac1bb935 (C:\PROGRA~1\LLVM\bin\CLANG_~1.EXE+0x36ab935)
#12 0x00007ff7ab3998a3 (C:\PROGRA~1\LLVM\bin\CLANG_~1.EXE+0x28898a3)
#13 0x00007ff7aa8bdb02 (C:\PROGRA~1\LLVM\bin\CLANG_~1.EXE+0x1dadb02)
#14 0x00007ff7aa880bc0 (C:\PROGRA~1\LLVM\bin\CLANG_~1.EXE+0x1d70bc0)
#15 0x00007ff7aa918ca9 (C:\PROGRA~1\LLVM\bin\CLANG_~1.EXE+0x1e08ca9)
#16 0x00007ff7a8b16ebf (C:\PROGRA~1\LLVM\bin\CLANG_~1.EXE+0x6ebf)
#17 0x00007ff7a8b14337 (C:\PROGRA~1\LLVM\bin\CLANG_~1.EXE+0x4337)
#18 0x00007ff7aa81d7c6 (C:\PROGRA~1\LLVM\bin\CLANG_~1.EXE+0x1d0d7c6)
#19 0x00007ff7aa1c6d33 (C:\PROGRA~1\LLVM\bin\CLANG_~1.EXE+0x16b6d33)
#20 0x00007ff7aa81d00b (C:\PROGRA~1\LLVM\bin\CLANG_~1.EXE+0x1d0d00b)
#21 0x00007ff7aa7411d8 (C:\PROGRA~1\LLVM\bin\CLANG_~1.EXE+0x1c311d8)
#22 0x00007ff7aa7416d4 (C:\PROGRA~1\LLVM\bin\CLANG_~1.EXE+0x1c316d4)
#23 0x00007ff7aa72f357 (C:\PROGRA~1\LLVM\bin\CLANG_~1.EXE+0x1c1f357)
#24 0x00007ff7a8b13c93 (C:\PROGRA~1\LLVM\bin\CLANG_~1.EXE+0x3c93)
#25 0x00007ff7ac1d74a0 (C:\PROGRA~1\LLVM\bin\CLANG_~1.EXE+0x36c74a0)
#26 0x00007ffc7b657c24 (C:\Windows\System32\KERNEL32.DLL+0x17c24)
#27 0x00007ffc7c7ed721 (C:\Windows\SYSTEM32\ntdll.dll+0x6d721)
CLANG_~1: error: clang frontend command failed due to signal (use -v to see invocation)
clang version 10.0.0
Target: i386-pc-windows-msvc
Thread model: posix
InstalledDir: C:\PROGRA~1\LLVM\bin
CLANG_~1: note: diagnostic msg: PLEASE submit a bug report to https://bugs.llvm.org/ and include the crash backtrace, preprocessed source, and associated run script.
CLANG_~1: note: diagnostic msg:
********************

PLEASE ATTACH THE FOLLOWING FILES TO THE BUG REPORT:
Preprocessed source(s) and associated run script(s) are located at:
CLANG_~1: note: diagnostic msg: C:\Users\WWALLH~1\AppData\Local\Temp\xds_cluster_resolver-386e37.cpp
CLANG_~1: note: diagnostic msg: C:\Users\WWALLH~1\AppData\Local\Temp\xds_cluster_resolver-386e37.sh
CLANG_~1: note: diagnostic msg:

********************
ninja: build stopped: subcommand failed.
```





