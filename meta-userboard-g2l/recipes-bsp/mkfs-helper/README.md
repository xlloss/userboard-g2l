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
