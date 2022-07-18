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

Arm Cortex-A55 Dual / Single MPCore 1.2 GHz
- L1 I-cache 32 Kbytes (Parity) / D-cache 32 Kbytes (ECC)
- L2 cache 0 Kbyte
- L3 cache 256 Kbytes (ECC)
- NEON™ / FPU supported
- Cryptographic Extension supported
- Arm® v8.2-A architecture

System CPU Cortex-M33
- Arm Cortex-M33 Processor 200 MHz
- Security Extension supported
- Arm® v8-M architecture

#### Graphics Unit

3D Graphics Engine (3DGE)
- Arm Mali-G31
- One single-pixel shader core
- 8 Kbytes L2 Cache
- OpenGL ES1.1 / 2.0 / 3.0 / 3.1 and 3.2 Supported
- OpenCL 2.0 Full Profile Supported

Image Scaling Unit (ISU)
- Scaling down function with bilinear interpolation
- Input image Size (max): 5M (2800 × 2047)
- Output image Size (max): Full HD (1920 × 1080)
- Support Color format Conversion
- RGB / ARGB / YcbCr422 / YcbCr420 / RAW (Grayscale)

#### Camera Interfaces

MIPI CSI-2 Interface
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

Parallel Input Interface
- 1 channel
- Support ITU-R BT.656 Interface (Interlace supported, YcbCr422 8-bit / 10-bit)
- Support HD
  - 30 fps (YCbCr422 Interleave), 60 fps (YCbCr422 Y/CbCr separate data, binary data)
  - Maximum input pixel frequency: 108 MHz
- Support Input Data Format:
  - YcbCr422 8-bit / 10-bit
  - Binary data 16-bit
- VSYNC / HSYNC / FIELD timing signal supported

## Maintainers

```
Jason Chang <jason.chang@regulus.com.tw>
