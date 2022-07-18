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



## Maintainers

```
Jason Chang <jason.chang@regulus.com.tw>
