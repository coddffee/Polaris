# 开启交叉编译
set(CMAKE_SYSTEM_NAME Generic)
cmake_minimum_required(VERSION 3.16)
project(Polaris LANGUAGES C ASM)
set(CMAKE_C_STANDARD 99)

# 设置目标文件输出路径
set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/build/target/bin)
set(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/build/target/lib)

# SDK配置
# 设置编译工具链路径，TOOLCHAIN是K210-SDK中要求的变量，需由使用者指定
set(TOOLCHAIN C:/DevEnv/Kendryte-Toolchain/bin)
# 指定编译平台为WIN32，WIN32是K210-SDK中要求的变量，根据此变量指定toolchain的后缀名，需由使用者指定
set(WIN32 TRUE)

# 导入关于编译工具链的配置及编译链接选项的配置
include(${PROJECT_SOURCE_DIR}/sdk/k210/cmake/common.cmake)

# 编译K210-SDK
add_subdirectory(${PROJECT_SOURCE_DIR}/sdk/k210/cmake)

########## 编译project目录 ##########
# 遍历指定目录下的所有源文件
file(GLOB_RECURSE SOURCE_FILES "${PROJECT_SOURCE_DIR}/project/*.c") 
# 生成可执行文件，SOURCE_FILES是executable.cmake中要求定义的变量，用于存储用来生成可执行文件的源文件
# 在executable.cmake中，可执行文件名被要求为${PROJECT_NAME}
include(${PROJECT_SOURCE_DIR}/sdk/k210/cmake/executable.cmake)
# 添加头文件搜索目录
target_include_directories(${PROJECT_NAME} PUBLIC
    ${PROJECT_SOURCE_DIR}/project
    ${PROJECT_SOURCE_DIR}/sdk/k210/lib/bsp/include
    ${PROJECT_SOURCE_DIR}/sdk/k210/lib/drivers/include
    ${PROJECT_SOURCE_DIR}/sdk/k210/lib/utils/include)

# 链接目标文件
target_link_libraries(${PROJECT_NAME} kendryte)