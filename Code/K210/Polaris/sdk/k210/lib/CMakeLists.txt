# 遍历指定目录下所有路径中匹配的文件并存储到变量中
file(GLOB_RECURSE LIB_SRC
     "${CMAKE_CURRENT_LIST_DIR}/*.h"
     "${CMAKE_CURRENT_LIST_DIR}/*.hpp"
     "${CMAKE_CURRENT_LIST_DIR}/*.cpp"
     "${CMAKE_CURRENT_LIST_DIR}/*.c"
     "${CMAKE_CURRENT_LIST_DIR}/*.s"
     "${CMAKE_CURRENT_LIST_DIR}/*.S")
file(GLOB_RECURSE ASSEMBLY_FILES
     "${CMAKE_CURRENT_LIST_DIR}/*.s"
     "${CMAKE_CURRENT_LIST_DIR}/*.S")

# 指定头文件搜索路径
include_directories(${CMAKE_CURRENT_LIST_DIR}/drivers/include 
                    ${CMAKE_CURRENT_LIST_DIR}/bsp/include)

# 将汇编文件的源文件属性设置为C语言属性
set_property(SOURCE ${ASSEMBLY_FILES} PROPERTY LANGUAGE C)
# 设置链接标志
set_source_files_properties(${ASSEMBLY_FILES} PROPERTIES COMPILE_FLAGS "-x assembler-with-cpp -D __riscv64")

# 创建静态链接库
add_library(kendryte ${LIB_SRC})
set_target_properties(kendryte PROPERTIES LINKER_LANGUAGE C)
