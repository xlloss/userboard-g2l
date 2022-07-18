## Introduction

### Prepare the exported rootfs

#### Edit the `/etc/exports` . 

```bash
/work/userboard-g2l/rootfs                   *(rw,sync,no_root_squash,no_subtree_check)
```

#### Restart the nfs-kernel-server service. 

```
sudo /etc/init.d/nfs-kernel-server restart
```

### NFS boot

Reset the Starter Kit and enter the u-boot for the following settings with debug-serial console (for example: Tera Term) .

```bash
=> setenv ethaddr 2E:09:0A:00:BE:11
=> setenv ipaddr 192.168.1.133; setenv serverip 192.168.1.169; setenv NFSROOT ${serverip}:/work/userboard-g2l/rootfs
=> setenv bootargs rw rootwait earlycon root=/dev/mmcblk0p2
=> setenv bootcmd 'fatload mmc 1:1 0x48080000 Image; fatload mmc 1:1 0x48000000 r8a7796-m3ulcb.dtb; booti 0x48080000 - 0x48000000'
=> setenv bootnfs 'tftp 0x48080000 Image; tftp 0x48000000 r8a7796-m3ulcb.dtb; setenv bootargs rw rootwait earlycon root=/dev/nfs nfsroot=${serverip}:/work/userboard-rcar/rootfs,nfsvers=3 ip=${ipaddr}; booti 0x48080000 - 0x48000000
=> saveenv
```
