# 开启交叉编译
set(CMAKE_SYSTEM_NAME Generic)
cmake_minimum_required(VERSION 3.16)
project(Polaris LANGUAGES C ASM)
set(CMAKE_C_STANDARD 99)

# 设置目标文件输出路径
set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/build/bin)
set(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/build/lib)

# SDK配置
# 设置编译工具链路径，TOOLCHAIN是K210-SDK中定义的变量，需由使用者指定
set(TOOLCHAIN C:/DevEnv/Kendryte-Toolchain/bin)
# 指定编译平台为WIN32，WIN32是K210-SDK中定义的变量，根据此变量指定toolchain的后缀名，需由使用者指定
set(WIN32 TRUE)

include(${PROJECT_SOURCE_DIR}/sdk/k210/cmake/common.cmake)

# 编译子路径
add_subdirectory(${PROJECT_SOURCE_DIR}/sdk/k210/cmake)
add_subdirectory(${PROJECT_SOURCE_DIR}/project)

# 链接目标文件
target_link_libraries(${PROJECT_NAME} kendryte)



