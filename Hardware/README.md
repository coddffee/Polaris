# 硬件设计

## K210硬件设计

&emsp;&emsp;[官方数据手册](https://github.com/kendryte/kendryte-doc-datasheet)

### 电源

&emsp;&emsp;K210的电源引脚：

|   电源PIN组    |   电压    |                    功能                    | 最大电流 |
| :------------: | :-------: | :----------------------------------------: | :------: |
| VDDIOxA(x=0~2) | 1.8V/3.3V | 为可切换电压的GPIO-GroupA/Bankx(x=0~2)供电 |  200mA   |
| VDDIOxB(x=3~5) | 1.8V/3.3V | 为可切换电压的GPIO-GroupB/Bankx(x=3~5)供电 |  200mA   |
| VDDIOxB(x=6~7) | 1.8V/3.3V | 为可切换电压的GPIO-GroupC/Bankx(x=6~7)供电 |  200mA   |
|    VDDIO18     |   1.8V    | 为不可切换电压(固定为1.8V)的专用功能IO供电 |  200mA   |
|     VDDOTP     |   1.8V    |           为一次可编程存储器供电           |   50mA   |
|      VDD       |   0.9V    |               为K210核心供电               |  2000mA  |
|      VSS       |    0V     |                  数字接地                  |   ---    |
|     VDDPLL     |   0.9V    |               锁相环电路供电               |   15mA   |
|     VSSPLL     |    0V     |          锁相环电路接地，噪声敏感          |   ---    |

&emsp;&emsp;K210的48个GPIO按照电源可为3组，分别是VDDIOxA,VDDIOxB,VDDIOxC, A,B,C三组又可分为8个Bank，分别为Bank0~Bank7,分别对应的GPIO为：

| Bank | Bank |    GPIO     |
| :--: | :--: | :---------: |
|  0   |  A   |  IO-0~IO_5  |
|  1   |  A   | IO-6~IO_11  |
|  2   |  A   | IO-12~IO_17 |
|  3   |  B   | IO-18~IO_23 |
|  4   |  B   | IO-24~IO_29 |
|  5   |  B   | IO-30~IO_35 |
|  6   |  C   | IO-36~IO_41 |
|  7   |  C   | IO-42~IO_47 |

&emsp;&emsp;VDDIO18供电的IO均为专用IO,功能固定，分别是：

|                 IO                 |            功能             |
| :--------------------------------: | :-------------------------: |
|          SPIO_D0~SPIO_D7           |         SPIO0专用IO         |
|           DVP_D0~DVP_D7            |          DVP专用IO          |
|   F_CLK,F_CS,F_D0,F_D1,F_D2,F_D3   |       SPI-FLASH专用IO       |
| RESET,CLK,OSC_CLK,XTAL_IN,XTAL_OUT | 复位，有源&无源时钟输入输出 |

&emsp;&emsp;使得K210正常工作必须提供3.3V,1.8V,0.9V这三个电源，除PLL外其余电源均可直接接入VSS数字电源地，至于PLL电源可分别将VDDPLL与VSSPLL串联合适的磁珠或0ohm电阻接入数字电源0.9V和VSS.可选用三通道的电源管理芯片。

### 时钟

&emsp;&emsp;K210的时钟引脚：

|     引脚     |      功能      |         说明         |
| :----------: | :------------: | :------------------: |
| XTAL_IN(M4)  |  无源晶振输入  |   禁止灌入有源信号   |
| XTAL_OUT(M3) |  无源晶振输出  |   禁止灌入有源信号   |
| OSC_CLK(L3)  | 有源振荡器输出 | 时钟源自外部无源晶振 |
|   CLK(M2)    |  系统时钟输入  |     输入有源信号     |

&emsp;&emsp;可直接向CLK输入有源信号为系统提供时钟，也可接入无源晶振，再将OSC_CLK输出的信号输入CLK为系统提供时钟。

### BOOT

&emsp;&emsp;B12(IO_16)是K210的启动模式选择引脚(BOOT)，上电复位时IO_16为高则从FLASH启动，IO_16为低则进入ISP模式；ISP模式下使用H11(IO_4,UART0_RX)和H12(IO_5,UART0_TX)引脚通过UART下载程序到FLASH.复位引脚为M1(RESETN,IO-1.8V),低电平复位。<br>&emsp;&emsp;项目中将BOOT,RESET,UART_RX,UART_TX四个用于程序下载的引脚以触点形式引出，并与充电接口一同封装，ISP下载程序时由外部与触点连接的连接器拉低BOOT,RESET信号也由外部给出。另外正常模式下UART_RX与UART_TX可作为外部扩展模块的通信接口。

### FLASH

&emsp;&emsp;K210不具备片上FLASH,需要通过专用SPI3连接至外部FLASH,引脚如下：

|   引脚    | 功能  |              说明              |
| :-------: | :---: | :----------------------------: |
| F_D0(J1)  |  DI   |     Data Input, 1.8V only      |
| F_D1(G1)  |  DO   |     Data Output, 1.8V only     |
| F_D2(H1)  |  /WP  | Write Protect Input, 1.8V only |
| F_D3(L1)  | /Hold |     Hold Input, 1.8V only      |
| F_CLK(K1) |  CLK  |      SPI Clock, 1.8V only      |
| F_CS(G2)  |  /CS  |   SPI Chip Select, 1.8V only   |

&emsp;&emsp;SPI-FLASH芯片必须使用1.8V芯片，可选择容量为SPI-NOR-FLASH类型的8MiB(8.192MB)/16MiB(16.384MB)/32MiB(32.768MB).通信协议使用QSPI(6wire).
