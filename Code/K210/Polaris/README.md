# `K210`工程配置

## 编译环境

### `Windows`平台

```xxx
1.配置GCC编译环境 : 下载MinGW-64并将根目录下的bin路径添加至系统环境变量，使用"gcc --version"命令检查是否配置成功
2.配置RISCV编译工具链 : 在K210官网下载kendryte-toolchain-win-amd64工具链并将根目录下的bin路径添加至系统环境变量，
  使用"riscv64-unknown-elf-gcc --version"命令检查是否配置成功
3.配置CMake : 下载CMake并将根目录下的bin路径添加至系统环境变量，使用"cmake --version"检查是否配置成功
```

### `Linux`平台

```xxx
TODO
```

## 工程结构

### K210-Standalone-SDK文件结构

```xxx
K210-Standalone-SDK
|---cmake
    |---CMakeLists.txt
    |---common.cmake
    |---compile-flags.cmake
    |---dump-config.cmake
    |---executable.cmake
    |---fix-9985.cmake
    |---macros.cmake
    |---macros.internal.cmake
    |---toolchain.cmake
|---lib
    |---bsp
        |---include
            |---xxx.h
        |---crt.S
        |---xxx.c
    |---drivers
        |---include
            |---xxx.h
        |---xxx.c
    |---utils
        |---include 
            |---syslog.h
    |---CMakeLists.txt
|---lds(链接脚本)
    |---kendryte.ld
```

&emsp;&emsp;使用`CMakeLists.txt`配置工程时需要直接使用`SDK`下`cmake`中的`CMakeLists.txt`,`common.cmake`和`executable.cmake`，`cmake`文件夹中的文件作用分别为：

```xxx
1.CMakeLists.txt : 配置SDK工程结构
2.macros.cmake&macros.internal.cmake : 定义一些工具函数和变量
3.toolchain.cmake : 用于配置编译工具链，要求提前定义WIN32变量用于指定编译平台，
  要求提前定义TOOLCHAIN变量用于指定编译工具链所在目录(工具链根目录下的bin路径)
4.compile-flags.cmake : 设置编译链接选项
5.dump-config.cmake : 用于打印一些必要变量的值辅助检查工程的配置
6.fix-9985.cmake : 进行某些字符串的替换
7.common.cmake : 调用toolchain.cmake,compile-flags.cmake和fix-9985.cmake,主要用于配置编译工具链，设置编译链接选项，
  此文件应该在所有生成目标文件的指令之前调用，可在项目级CMakeLists.txt的靠前部分调用
8.executable.cmake : 用于生成可执行文件，此文件要求提前定义变量SOURCE_FILES用于存储生成可执行文件的源文件，
  并指定可执行文件的文件名为${PROJECT_NAME},此文件应该在工程的链接操作之前调用，另外此文件还进行了可执行文件格式转换操作，
  将GCC编译器编译得到的ELF格式文件转换为二进制格式文件
```

## 工程配置

### 工程级`CMakeLists.txt`编写

```cmake
# 开启交叉编译
set(CMAKE_SYSTEM_NAME Generic)
cmake_minimum_required(VERSION 3.0)
project(Polaris LANGUAGES C ASM)

# SDK配置
# 设置编译工具链路径，TOOLCHAIN是K210-SDK中定义的变量，需由使用者指定
set(TOOLCHAIN C:/DevEnv/Kendryte-Toolchain/bin)
# 指定编译平台为WIN32，WIN32是K210-SDK中定义的变量，根据此变量指定toolchain的后缀名，需由使用者指定
set(WIN32 TRUE)

add_subdirectory(${PROJECT_SOURCE_DIR}/sdk/k210/cmake)
```

### 项目编译

&emsp;&emsp;`Windows`平台：

```shell
# 在build目录下运行cmake指令，产生的Makefiles将存放于build目录下，避免污染项目结构
cd ./build
# 运行cmake指令时必须使用"-G"指定cmake生成器，否则无法进行交叉编译
# 对于Windows平台使用MinGW-GCC环境，cmake生成器为"MinGW Makefiles"
cmake -G "MinGW Makefiles" ../
# 运行make指令执行Makefiles完成编译
make
```

&emsp;&emsp;`Linux`平台：

```shell
# 在build目录下运行cmake指令，产生的Makefiles将存放于build目录下，避免污染项目结构
cd ./build
# 运行cmake指令时必须使用"-G"指定cmake生成器，否则无法进行交叉编译
# 对于Linux平台，cmake生成器为"Unix Makefiles"
cmake -G "Unix Makefiles" ../
# 运行make指令执行Makefiles完成编译
make
```

