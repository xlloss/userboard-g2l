## Introduction to the `mkfs-helper`

[![IMAGE ALT TEXT HERE](https://img.youtube.com/vi/MMLUCpsnm1s/0.jpg)](https://www.youtube.com/watch?v=MMLUCpsnm1s)

### 1. Prepare an exported rootfs

As the video displayed above, the `mkfs-helper` will help fdisk, format the QSPI flash and un-tar the core-image into the QSPI flash rootfs's partition. First we have to prepare a NFS server. 

#### 1.1 Edit the `/etc/exports` . 

For example:

```bash
/work/userboard-g2l/rootfs                   *(rw,sync,no_root_squash,no_subtree_check)
```

#### 1.2 Restart the nfs-kernel-server service. 

```
sudo /etc/init.d/nfs-kernel-server restart
```

### 2. Boot the target board to mount the given rootfs over NFS. 

<img src="https://renesas.info/w/images/3/3d/smarc_series_carrier_board.png" width="900" />

#### 2.1 The RJ45 (Ethernet1) is connected to NFS server (Linux Host-PC) with an ethernet cable. 

![image](https://user-images.githubusercontent.com/33512027/179653013-939cb544-fbb9-4eb5-84f8-f5494ac7d153.png)

#### 2.2 Press the reset-button and enter the u-boot for the following settings: 

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

#### 2.3 Enter the u-boot and `run bootnfs`. 

![image](https://user-images.githubusercontent.com/33512027/179456557-19bd2d5d-478c-439b-8dcb-1fc6fada55cb.png)

![image](https://user-images.githubusercontent.com/33512027/179456817-eaf23cc4-e119-42c4-993a-c51075c2660e.png)

Here we can see the target board rootfs is mounted over NFS. 

### 3. Run the `mkfs-helper.sh`

```bash
./mkfs-helper.sh
```

```bash
#!/bin/sh -e

MACHINE=smarc-rzg2l
MMCBLK=/dev/mmcblk0

[ `mount | grep ' on / type nfs' | wc -l` -eq 0 ] && exit 0
[ ! -f /boot/core-image-qt-${MACHINE}.tar.gz ] && exit 0

umount ${MMCBLK}p1 || true
umount ${MMCBLK}p2 || true
umount ${MMCBLK}p3 || true
umount ${MMCBLK}p4 || true
umount ${MMCBLK}p5 || true
umount ${MMCBLK}p6 || true
umount ${MMCBLK}p7 || true
umount ${MMCBLK}p8 || true
sed -e 's/\s*\([\+0-9a-zA-Z]*\).*/\1/' << EOF | fdisk ${MMCBLK}
 d

 d

 d

 d

 d

 d

 d

 d

 n
 p
 1

 +128M
 n
 p
 2


 t
 1
 c
 t
 2
 83
 w
EOF
sync
echo yes | mkfs.vfat -n BOOT ${MMCBLK}p1
echo yes | mkfs.ext4 -E lazy_itable_init=1,lazy_journal_init=1 ${MMCBLK}p2 -L rootfs -U 614e0000-0000-4b53-8000-1d28000054a9 -jDv

mount ${MMCBLK}p2 /mnt
rm -rfv /mnt/*
tar zxvf /boot/core-image-qt-${MACHINE}.tar.gz -C /mnt
tar zxvf /boot/modules-${MACHINE}.tgz -C /mnt

umount /mnt
mount ${MMCBLK}p1 /mnt
rm -rfv /mnt/*
/bin/cp -fv /boot/Image /mnt
/bin/cp -fv /boot/*.dtb /mnt
umount /mnt

reboot
```







