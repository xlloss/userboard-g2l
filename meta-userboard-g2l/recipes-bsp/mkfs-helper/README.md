## Introduction

[![IMAGE ALT TEXT HERE](https://img.youtube.com/vi/MMLUCpsnm1s/0.jpg)](https://www.youtube.com/watch?v=MMLUCpsnm1s)

As the video displayed above, the `mkfs-helper` will help fdisk, format the QSPI flash and un-tar the core-image into the QSPI flash rootfs. 

### 1. Prepare the exported rootfs

#### 1.1 Edit the `/etc/exports` . 

```bash
/work/userboard-g2l/rootfs                   *(rw,sync,no_root_squash,no_subtree_check)
```

#### 1.2 Restart the nfs-kernel-server service. 

```
sudo /etc/init.d/nfs-kernel-server restart
```

### 2. NFS boot

##### 2.1 Reset the RZ/G2L and enter the u-boot for the following settings with debug-serial console (for example: Tera Term) .

```bash
 => setenv bootargs rw rootwait earlycon root=/dev/mmcblk0p2
 => setenv bootcmd 'fatload mmc 0:1 0x48000000 r9a07g044l2-smarc.dtb; booti 0x48080000 - 0x48000000'
 => 
 => setenv ethaddr 2E:09:0A:00:BE:11
 => setenv ipaddr 192.168.1.133; setenv serverip 192.168.1.169; setenv NFSROOT ${serverip}:/work/userboard-vlp/rootfs
 => setenv bootnfs 'nfs 0x48080000 ${NFSROOT}/boot/Image; \
      nfs 0x48000000 ${NFSROOT}/boot/r9a07g044l2-smarc.dtb; \
      setenv bootargs rw rootwait earlycon root=/dev/nfs nfsroot=${NFSROOT} ip=dhcp; \
      booti 0x48080000 - 0x48000000'
 => saveenv
```

##### 2.2 run bootnfs

![image](https://user-images.githubusercontent.com/33512027/179456557-19bd2d5d-478c-439b-8dcb-1fc6fada55cb.png)

![image](https://user-images.githubusercontent.com/33512027/179456817-eaf23cc4-e119-42c4-993a-c51075c2660e.png)

### 3. Run the mkfs-helper

```bash
./mkfs-helper
```

![image](https://user-images.githubusercontent.com/33512027/179457455-3537bbfc-b36a-453e-b22c-77fcc5747fe5.png)






