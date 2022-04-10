# 硬件设计

## `K210`硬件设计

&emsp;&emsp;[官方数据手册](https://github.com/kendryte/kendryte-doc-datasheet)

### 电源

&emsp;&emsp;`K210`的电源引脚：

|  引脚   | 电压 |  电流  |             功能              |
| :-----: | :--: | :----: | :---------------------------: |
|   VDD   | 0.9V | 2000mA |      为芯片数字核心供电       |
| VDDIO33 | 3.3V | 200mA  |      为可变电平GPIO供电       |
| VDDIO18 | 1.8V | 200mA  |        为低压GPIO供电         |
| VDDOTP  | 1.8V |  50mA  | 为一次性可编程存储器(OTP)供电 |
|   VSS   |  0V  |  ---   |             接地              |
| VDDPLL  | 0.9V |  15mA  |   模拟电源，为锁相环PLL供电   |
| VSSPLL  |  0V  |  ---   |     PLL模拟接地，噪声敏感     |

&emsp;&emsp;使得`K210`正常工作必须提供`3.3V`,`1.8V`,`0.9V`这三个电源，除锁相环电路`PLL`外其余电源均可直接接入`VSS`电源地，至于`PLL`电源可分别将`VDDPLL`与`VSSPLL`串联合适的磁珠或`0ohm`电阻接入数字`0.9V`和`VSS`.可选用三通道的电源管理芯片。

### 时钟

&emsp;&emsp;`K210`的时钟引脚：

|     引脚     |      功能      |         说明         |
| :----------: | :------------: | :------------------: |
| XTAL_IN(M4)  |  无源晶振输入  |   禁止灌入有源信号   |
| XTAL_OUT(M3) |  无源晶振输出  |   禁止灌入有源信号   |
| OSC_CLK(L3)  | 有源振荡器输出 | 时钟源自外部无源晶振 |
|   CLK(M2)    |  系统时钟输入  |     输入有源信号     |

&emsp;&emsp;可直接向`CLK`输入有源信号为系统提供时钟，也可接入无源晶振，再将`OSC_CLK`输出的信号输入`CLK`为系统提供时钟。

### `BOOT`

&emsp;&emsp;`B12(IO_16)`是`K210`的启动模式选择引脚(`BOOT`)，上电复位时`IO_16`为高则从`FLASH`启动，`IO_16`为低则进入`ISP`模式；`ISP`模式下可使用`H11(IO_4,UARTHS_RX)`和`H12(IO_5,UARTHS_TX)`引脚通过`UART`协议下载程序到`FLASH`.复位引脚为`M1(RESETN)`,低电平复位。<br>&emsp;&emsp;项目中将`BOOT`,`RESET`,`UART_RX`,`UART_TX`四个用于程序下载的引脚以触点形式引出，并与充电接口一同封装，`ISP`下载程序时由外部与触点连接的连接器拉低`BOOT`,`RESET`信号也由外部给出。另外正常模式下`UART_RX`与`UART_TX`可作为外部扩展模块的通信接口。

### `FLASH`

&emsp;&emsp;`K210`不具备片上`FLASH`,需要通过专用`SPI-FLASH-GPIO`连接至外部`FLASH`,引脚如下：

|   引脚    | 功能  |              说明              |
| :-------: | :---: | :----------------------------: |
| F_D0(J1)  |  DI   |     Data Input, 1.8V only      |
| F_D1(G1)  |  DO   |     Data Output, 1.8V only     |
| F_D2(H1)  |  /WP  | Write Protect Input, 1.8V only |
| F_D3(L1)  | /Hold |     Hold Input, 1.8V only      |
| F_CLK(K1) |  CLK  |      SPI Clock, 1.8V only      |
| F_CS(G2)  |  /CS  |   SPI Chip Select, 1.8V only   |





