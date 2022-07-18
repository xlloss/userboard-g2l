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

#### Trusted Secure IP
- Security algorism
  - Common key encryption: AES
  - Non-common key encryption: RSA, ECC
- Other features
  - TRNG (true-random number generator)
  - Hash value generation: SHA-1, SHA-224, SHA-256, GHASH
  - Support of Unique ID

#### One Time Programmable memory
● A nonvolatile memory that can be written only once
● Security setting, authentication setting are possible
● Support one time read function (512 bytes)




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
