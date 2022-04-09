# Install script for directory: E:/Project/Polaris/Code/K210/Polaris/sdk/k210/cmake

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "C:/Program Files (x86)/Polaris")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "TRUE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "C:/DevEnv/Kendryte-Toolchain/bin/riscv64-unknown-elf-objdump.exe")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "E:/Project/Polaris/Code/K210/Polaris/build/archive/libkendryte.a")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "E:/Project/Polaris/Code/K210/Polaris/build/archive" TYPE STATIC_LIBRARY FILES "E:/Project/Polaris/Code/K210/Polaris/build/lib/libkendryte.a")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "E:/Project/Polaris/Code/K210/Polaris/build/archive/include/atomic.h;E:/Project/Polaris/Code/K210/Polaris/build/archive/include/bsp.h;E:/Project/Polaris/Code/K210/Polaris/build/archive/include/dump.h;E:/Project/Polaris/Code/K210/Polaris/build/archive/include/encoding.h;E:/Project/Polaris/Code/K210/Polaris/build/archive/include/entry.h;E:/Project/Polaris/Code/K210/Polaris/build/archive/include/interrupt.h;E:/Project/Polaris/Code/K210/Polaris/build/archive/include/platform.h;E:/Project/Polaris/Code/K210/Polaris/build/archive/include/printf.h;E:/Project/Polaris/Code/K210/Polaris/build/archive/include/sleep.h;E:/Project/Polaris/Code/K210/Polaris/build/archive/include/syscalls.h;E:/Project/Polaris/Code/K210/Polaris/build/archive/include/util.h;E:/Project/Polaris/Code/K210/Polaris/build/archive/include/aes.h;E:/Project/Polaris/Code/K210/Polaris/build/archive/include/apu.h;E:/Project/Polaris/Code/K210/Polaris/build/archive/include/clint.h;E:/Project/Polaris/Code/K210/Polaris/build/archive/include/dmac.h;E:/Project/Polaris/Code/K210/Polaris/build/archive/include/dvp.h;E:/Project/Polaris/Code/K210/Polaris/build/archive/include/fft.h;E:/Project/Polaris/Code/K210/Polaris/build/archive/include/fpioa.h;E:/Project/Polaris/Code/K210/Polaris/build/archive/include/gpio.h;E:/Project/Polaris/Code/K210/Polaris/build/archive/include/gpio_common.h;E:/Project/Polaris/Code/K210/Polaris/build/archive/include/gpiohs.h;E:/Project/Polaris/Code/K210/Polaris/build/archive/include/i2c.h;E:/Project/Polaris/Code/K210/Polaris/build/archive/include/i2s.h;E:/Project/Polaris/Code/K210/Polaris/build/archive/include/io.h;E:/Project/Polaris/Code/K210/Polaris/build/archive/include/kpu.h;E:/Project/Polaris/Code/K210/Polaris/build/archive/include/plic.h;E:/Project/Polaris/Code/K210/Polaris/build/archive/include/pwm.h;E:/Project/Polaris/Code/K210/Polaris/build/archive/include/rtc.h;E:/Project/Polaris/Code/K210/Polaris/build/archive/include/sha256.h;E:/Project/Polaris/Code/K210/Polaris/build/archive/include/spi.h;E:/Project/Polaris/Code/K210/Polaris/build/archive/include/sysctl.h;E:/Project/Polaris/Code/K210/Polaris/build/archive/include/timer.h;E:/Project/Polaris/Code/K210/Polaris/build/archive/include/uart.h;E:/Project/Polaris/Code/K210/Polaris/build/archive/include/uarths.h;E:/Project/Polaris/Code/K210/Polaris/build/archive/include/utils.h;E:/Project/Polaris/Code/K210/Polaris/build/archive/include/wdt.h;E:/Project/Polaris/Code/K210/Polaris/build/archive/include/syslog.h")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "E:/Project/Polaris/Code/K210/Polaris/build/archive/include" TYPE FILE FILES
    "E:/Project/Polaris/Code/K210/Polaris/sdk/k210/cmake/../lib/bsp/include/atomic.h"
    "E:/Project/Polaris/Code/K210/Polaris/sdk/k210/cmake/../lib/bsp/include/bsp.h"
    "E:/Project/Polaris/Code/K210/Polaris/sdk/k210/cmake/../lib/bsp/include/dump.h"
    "E:/Project/Polaris/Code/K210/Polaris/sdk/k210/cmake/../lib/bsp/include/encoding.h"
    "E:/Project/Polaris/Code/K210/Polaris/sdk/k210/cmake/../lib/bsp/include/entry.h"
    "E:/Project/Polaris/Code/K210/Polaris/sdk/k210/cmake/../lib/bsp/include/interrupt.h"
    "E:/Project/Polaris/Code/K210/Polaris/sdk/k210/cmake/../lib/bsp/include/platform.h"
    "E:/Project/Polaris/Code/K210/Polaris/sdk/k210/cmake/../lib/bsp/include/printf.h"
    "E:/Project/Polaris/Code/K210/Polaris/sdk/k210/cmake/../lib/bsp/include/sleep.h"
    "E:/Project/Polaris/Code/K210/Polaris/sdk/k210/cmake/../lib/bsp/include/syscalls.h"
    "E:/Project/Polaris/Code/K210/Polaris/sdk/k210/cmake/../lib/bsp/include/util.h"
    "E:/Project/Polaris/Code/K210/Polaris/sdk/k210/cmake/../lib/drivers/include/aes.h"
    "E:/Project/Polaris/Code/K210/Polaris/sdk/k210/cmake/../lib/drivers/include/apu.h"
    "E:/Project/Polaris/Code/K210/Polaris/sdk/k210/cmake/../lib/drivers/include/clint.h"
    "E:/Project/Polaris/Code/K210/Polaris/sdk/k210/cmake/../lib/drivers/include/dmac.h"
    "E:/Project/Polaris/Code/K210/Polaris/sdk/k210/cmake/../lib/drivers/include/dvp.h"
    "E:/Project/Polaris/Code/K210/Polaris/sdk/k210/cmake/../lib/drivers/include/fft.h"
    "E:/Project/Polaris/Code/K210/Polaris/sdk/k210/cmake/../lib/drivers/include/fpioa.h"
    "E:/Project/Polaris/Code/K210/Polaris/sdk/k210/cmake/../lib/drivers/include/gpio.h"
    "E:/Project/Polaris/Code/K210/Polaris/sdk/k210/cmake/../lib/drivers/include/gpio_common.h"
    "E:/Project/Polaris/Code/K210/Polaris/sdk/k210/cmake/../lib/drivers/include/gpiohs.h"
    "E:/Project/Polaris/Code/K210/Polaris/sdk/k210/cmake/../lib/drivers/include/i2c.h"
    "E:/Project/Polaris/Code/K210/Polaris/sdk/k210/cmake/../lib/drivers/include/i2s.h"
    "E:/Project/Polaris/Code/K210/Polaris/sdk/k210/cmake/../lib/drivers/include/io.h"
    "E:/Project/Polaris/Code/K210/Polaris/sdk/k210/cmake/../lib/drivers/include/kpu.h"
    "E:/Project/Polaris/Code/K210/Polaris/sdk/k210/cmake/../lib/drivers/include/plic.h"
    "E:/Project/Polaris/Code/K210/Polaris/sdk/k210/cmake/../lib/drivers/include/pwm.h"
    "E:/Project/Polaris/Code/K210/Polaris/sdk/k210/cmake/../lib/drivers/include/rtc.h"
    "E:/Project/Polaris/Code/K210/Polaris/sdk/k210/cmake/../lib/drivers/include/sha256.h"
    "E:/Project/Polaris/Code/K210/Polaris/sdk/k210/cmake/../lib/drivers/include/spi.h"
    "E:/Project/Polaris/Code/K210/Polaris/sdk/k210/cmake/../lib/drivers/include/sysctl.h"
    "E:/Project/Polaris/Code/K210/Polaris/sdk/k210/cmake/../lib/drivers/include/timer.h"
    "E:/Project/Polaris/Code/K210/Polaris/sdk/k210/cmake/../lib/drivers/include/uart.h"
    "E:/Project/Polaris/Code/K210/Polaris/sdk/k210/cmake/../lib/drivers/include/uarths.h"
    "E:/Project/Polaris/Code/K210/Polaris/sdk/k210/cmake/../lib/drivers/include/utils.h"
    "E:/Project/Polaris/Code/K210/Polaris/sdk/k210/cmake/../lib/drivers/include/wdt.h"
    "E:/Project/Polaris/Code/K210/Polaris/sdk/k210/cmake/../lib/utils/include/syslog.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "E:/Project/Polaris/Code/K210/Polaris/build/archive/lds;E:/Project/Polaris/Code/K210/Polaris/build/archive/utils;E:/Project/Polaris/Code/K210/Polaris/build/archive/cmake")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "E:/Project/Polaris/Code/K210/Polaris/build/archive" TYPE DIRECTORY FILES
    "E:/Project/Polaris/Code/K210/Polaris/sdk/k210/cmake/../lds"
    "E:/Project/Polaris/Code/K210/Polaris/sdk/k210/cmake/../utils"
    "E:/Project/Polaris/Code/K210/Polaris/sdk/k210/cmake/../cmake"
    REGEX "/[^/]*internal[^/]*$" EXCLUDE REGEX "/cmakelists\\.txt$" EXCLUDE)
endif()

