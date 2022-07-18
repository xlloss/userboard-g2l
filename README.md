## Introduction

[![IMAGE ALT TEXT HERE](https://img.youtube.com/vi/UprbrIVChYQ/0.jpg)](https://www.youtube.com/watch?v=UprbrIVChYQ)

This repository is a Linux reference software for building core-image-qt on
RZG2L core board + its carrier board. You have to get the proprietary
software and hardware before building this REPO. Please contact for the following name card:

## Contact

```
銳力科技股份有限公司 Regulus Technologies Co., Ltd
2F, No.242, Yang-Guang St., Nei-Hu, Taipei 114, Taiwan, R.O.C.
114 台北市內湖區陽光街242號2樓
TEL : (02) 8753-3588
FAX : (02) 8753-3589
E-mail : sales@regulus.com.tw
http://www.regulus.com.tw/
```
### Board Information

<img src="https://renesas.info/w/images/3/3d/smarc_series_carrier_board.png" width="900" />

![image](https://user-images.githubusercontent.com/33512027/179498461-ecac9805-ca04-49cb-9f19-c9998c0fd96d.png)

#### ARM Cores

##### Arm Cortex-A55 Dual / Single MPCore 1.2 GHz
- L1 I-cache 32 Kbytes (Parity) / D-cache 32 Kbytes (ECC)
- L2 cache 0 Kbyte
- L3 cache 256 Kbytes (ECC)
- NEON™ / FPU supported
- Cryptographic Extension supported
- Arm® v8.2-A architecture

##### System CPU Cortex-M33
- Arm Cortex-M33 Processor 200 MHz
- Security Extension supported
- Arm® v8-M architecture

#### Memory

##### On-chip RAM
- RAM of 128 Kbytes (ECC)

##### External Bus Controller for DDR3L / DDR4 SDRAM
- Support DDR3L-1333 / DDR4-1600
- Bus Width: 16-bit
- In line ECC supported (Support error detection interrupt)
- Memory Size: Up to 4 Gbyes
- Auto Refresh supported

##### SPI Multi I/O Bus Controller
- 1 channel (8-bit Double data rate)
- Up to 2 serial flash memories with multiple I/O bus sizes (single / quad) can be connected
- Connectable with 1 Octal-SPI flash memory
- Connectable with 1 HyperFlash memory
- External address space read mode (built-in read cache)
- SPI operation mode
- Maximum Clock Frequency:
  - 50 MHz (Quad-SPI DDR)
  - 66 MHz (Quad-SPI SDR)
  - 100 MHz (Octal-SPI, HyperFlash)

##### SD Card Host Interface / Multimedia Card Interface (SD/MMC)
- 2 channels
- Channel 0 supports SDHI / e-MMC (boot supported)
- Channel 1 supports SDHI
- SD memory I/O card interface (1-bit / 4-bit SD bus)
- SD, SDHC and SDXC SD memory card access supported
- Compliant with SD 3.0
- Default, high-speed, UHS-I/SDR50, SDR104 transfer modes supported
- Error check function: CRC7 (Command/response), CRC16 (Data)
- Card detection function, write protect supported
- MMC interface (1-bit / 4-bit / 8-bit MMC bus)
- e-MMC device access supported
- Compliant with eMMC 4.51
- High-speed, HS200 transfer modes supported

#### Graphics Unit

##### 3D Graphics Engine (3DGE)
- Arm Mali-G31
- One single-pixel shader core
- 8 Kbytes L2 Cache
- OpenGL ES1.1 / 2.0 / 3.0 / 3.1 and 3.2 Supported
- OpenCL 2.0 Full Profile Supported

##### Image Scaling Unit (ISU)
- Scaling down function with bilinear interpolation
- Input image Size (max): 5M (2800 × 2047)
- Output image Size (max): Full HD (1920 × 1080)
- Support Color format Conversion
- RGB / ARGB / YcbCr422 / YcbCr420 / RAW (Grayscale)

#### Camera Interfaces

##### MIPI CSI-2 Interface
- 1 channel
- The number of Lane: 1-/2-/4-lane
- Support 5MP, 30 fps (RAW12)
- Maximum Bandwidth: 1.5 Gbps per lane
- Select 1 VC from 4 VC (virtual channel) supported
- Support Input Image Data Formats:
  - YUV420 8-bit / 10-bit
  - Legacy YUV420 8-bit
  - YUV420 8-bit / 10-bit (Chroma Shifted Pixel Sampling)
  - YUV422 8-bit / 10-bit
  - RGB444 / RGB555 / RGB565/ RGB666 / RGB888
  - RAW6 / RAW7 / RAW8 / RAW10 / RAW12 / RAW14 / RAW16 / RAW20
- Generic short packet code 1 / 2 / 3 / 4 / 5 / 6 / 7 / 8
- Generic long packet data type 1 / 2 / 3 / 4
- User Defined 8-bit data type 1 / 2 / 3 / 4 / 5 / 6 / 7 / 8

##### Parallel Input Interface
- 1 channel
- Support ITU-R BT.656 Interface (Interlace supported, YcbCr422 8-bit / 10-bit)
- Support HD
  - 30 fps (YCbCr422 Interleave), 60 fps (YCbCr422 Y/CbCr separate data, binary data)
  - Maximum input pixel frequency: 108 MHz
- Support Input Data Format:
  - YcbCr422 8-bit / 10-bit
  - Binary data 16-bit
- VSYNC / HSYNC / FIELD timing signal supported

##### MIPI CSI-2 / Parallel to AXI Bridge Module
- 1 channel (MIPI CSI-2 Input or Parallel Input)
- Support Image Processing:
  - Clipping
  - Frame Sampling
  - LUT
  - Color format conversion
  - Color space conversion
- Support Color Formats for Image Processing:
  - YUV422 8-/10-bit
  - RGB565 / RGB666 / RGB888
  - RAW8 / 10 / 12 / 14 / 16 (Clipping and Frame Sampling only)
- Support Output Data Formats:
  - YCbCr422 8-bit (Interleave/Semi planar, Interlace/Progressive)
  - YCbCr420 8-bit (Interleave, Interlace)
  - Y-Only
  - RGB888 / ARGB8888
  - RAW8 / 10 / 12 / 14 / 16 (without Image Processing)
  - MIPI CSI-2 V2.1 Recommended Memory storage data (without Image Processing)

#### Display Interface

##### LCD Controller
- 1 channel (MIPI DSI output or Parallel output)
- 2 planes blending (can blend 2 different size images)
- Support Image Processing:
  - Dither processing (RGB666)
  - Clipping
  - RGB Gamma Correction LUT
- Support Input Data Format:
  - RGB565 / RGB666 / RGB888
  - ARGB1555 / ARGB4444 / ARGB8888
  - YcbCr444 8-bit / YcbCr422 8-bit / YcbCr420 8-bit

##### MIPI DSI Interface
- 1 channel
- The number of Lane: 4-lane
- Support up to Full HD (1920 × 1080), 60 fps (RGB888)
- Maximum Bandwidth: 1.5 Gbps per lane
- Support Output Data Format:
  - RGB666 / RGB888

##### Parallel Output Interface
- 1 channel
- Support WXGA (1280 × 800), 60 fps
- Support Output Data Format:
  - RGB666 / RGB888
- CLK / HD / VD timing signal supported

#### Sound

##### Serial Sound Interface (SSI)
- 4 channels bidirectional serial transfer
- 2 external clock sources available
- Full Duplex communication (channel 0, 1, and 3)
- Support of I2S / Monaural / TDM audio formats
- Support of master and slave functions
- Generation of programmable word clock and bit clock
- Multi-channel formats
- Support of 8, 16, 18, 20, 22, 24, and 32-bit data formats
- Support of 32-stage FIFO for transmission and reception
- Support of LR-clock continue function in which the LR-clock signal is not stopped

##### Sampling Rate Converter (SRC)
- 1 channel
- Data format: 16-bit (stereo / monaural)
- Sampling Rate
  - Input: Selectable from 8 kHz, 11.025 kHz, 12 kHz, 16 kHz, 22.05 kHz, 24 kHz, 32 kHz,44.1 kHz, 48 kHz
  - Output: Selectable from 8 kHz*, 16 kHz, 32 kHz, 44.1 kHz, 48 kHz
- SNR: More than or equal to 80 db

#### Storage and Network

##### USB2.0 Host / Function (USB)

- 2 channels (ch0: Host-Function ch1: Host only)
- Compliance with USB2.0
- Supports On-The-Go (OTG) Function
- Supports Battery Charging Function
- Internal dedicated DMA

##### Gigabit Ethernet Interface (GbE)
- 2 channels
- Supports transfer at 1000 Mbps and 100 Mbps, 10 Mbps
- Supports filtering of Ethernet frames
- Supports interface conforming to IEEE802.3 PHY RGMII (Reduced Gigabit Media Independent Interface)
- Supports interface conforming to IEEE802.3 PHYMII (Media Independent Interface)

##### CANFD Interface (RS-CANFD)
- 2 channels
- ISO 11898-1 (2003) compliant
- CAN-FD ISO 11898-1 (CD2014) compliant
- Message buffer
  - Up to 64 × 2-channel receive message buffer: Shared among all channels
  - 16 transmit message buffers per channel

#### Peripheral Module

##### I2C Bus Interface
- 4 channel
- Master mode and slave mode supported
- Support for 7-bit and 10-bit slave address formats
- Support for multi-master operation
- Timeout detection

##### Serial Communication Interface with FIFO (SCIFA)
- 4 channels
- Clock synchronous mode or asynchronous mode selectable
- Simultaneous transmission and reception (full-duplex communication) supported
- Dedicated baud rate generator
- Separate 16-byte FIFO registers for transmission and reception
- Modem control function (channel 0, 1, and 2 in asynchronous mode)

##### Serial Communication Interface (SCIg)
- 2 channels
- Clock synchronous mode, asynchronous mode, or smart card interface mode is selectable
- Simultaneous transmission and reception (full-duplex communication) supported
- Dedicated baud rate generator
- LSB first / MSB first selectable
- Modem control function
- Encoding and decoding of IrDA communications waveforms in accord with version 1.0 of the IrDA standard (on channel 0)

##### Renesas Serial Peripheral Interface (RSPI)
- 3 channels
- SPI operation
- Master mode and slave mode supported
- Programmable bit length, clock polarity, clock phase can be selected
- Consecutive transfers
- LSB first / MSB first selectable
- Maximum transfer rate: 50 Mbps

#### Trusted Secure IP
- Security algorism
  - Common key encryption: AES
  - Non-common key encryption: RSA, ECC
- Other features
  - TRNG (true-random number generator)
  - Hash value generation: SHA-1, SHA-224, SHA-256, GHASH
  - Support of Unique ID

#### One Time Programmable memory
- A nonvolatile memory that can be written only once
- Security setting, authentication setting are possible
- Support one time read function (512 bytes)

#### A/D Converter (ADC)

- 8 channels
- Resolution: 12-bit
- Input Range: 0 V ~ 1.8 V
- Conversion Time: 1 μs
- Operation Mode: Select mode / scan mode
- Conversion Mode: Single mode / repeat mode
- Condition for A/D conversion start
  - Software trigger
  - Asynchronous trigger: External trigger supported
  - Synchronous trigger: MTU and PWM timer

## Maintainers

```
Jason Chang <jason.chang@regulus.com.tw>
