#!/bin/bash -e

##########################################################
RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color
IP_ADDR=$(ip address | grep 192.168 | head -1 | awk '{print $2}' | awk -F '/' '{print $1}')

CORE_IMAGE=core-image-qt
SOC_FAMILY=r9a07g044l
SOC_FAMILY_PLUS=${SOC_FAMILY}2
SCRIP_DIR=$(pwd)

BOARD_LIST=("smarc-rzg2l" "rzg2l-regulus" "smarc-rzv2l" "rzv2l-dev")
TARGET_BOARD=$1
BUILD_DIR=build_${TARGET_BOARD}

##########################################################
function Usage () {
        echo "Usage: $0 \${TARGET_BOARD_NAME}"
        echo "BOARD_NAME list: "
        for i in ${BOARD_LIST[@]}; do echo "  - $i"; done
        exit 0
}
if ! `IFS=$'\n'; echo "${BOARD_LIST[*]}" | grep -qx "${TARGET_BOARD}"`; then
        Usage
fi

##########################################################
function print_boot_example() {
	echo ""
	echo ">> FOR QSPI FLASH BOOT"
	echo -e "${YELLOW} => setenv bootmmc 'setenv bootargs rw rootwait earlycon root=/dev/mmcblk0p2 video=HDMI-A1:1280x720@60; fatload mmc 0:1 0x48080000 Image; fatload mmc 0:1 0x48000000 ${SOC_FAMILY_PLUS}-${TARGET_BOARD}.dtb; booti 0x48080000 - 0x48000000' ${NC}"
	echo -e "${YELLOW} => run bootmmc ${NC}"
	echo ""
	echo ">> FOR SD BOOT"
	echo -e "${YELLOW} => setenv bootsd 'setenv bootargs rw rootwait earlycon root=/dev/mmcblk1p2 video=HDMI-A1:1280x720@60; fatload mmc 1:1 0x48080000 Image; fatload mmc 1:1 0x48000000 ${SOC_FAMILY_PLUS}-${TARGET_BOARD}.dtb; booti 0x48080000 - 0x48000000' ${NC}"
	echo -e "${YELLOW} => run bootsd ${NC}"
	echo ""
	echo ">> FOR USB BOOT"
	echo -e "${YELLOW} => setenv bootusb 'setenv bootargs rw rootwait earlycon root=/dev/sda2 video=HDMI-A1:1280x720@60; usb reset; fatload usb 0:1 0x48080000 Image; fatload usb 0:1 0x48000000 ${SOC_FAMILY_PLUS}-${TARGET_BOARD}.dtb; booti 0x48080000 - 0x48000000' ${NC}"
	echo -e "${YELLOW} => run bootusb ${NC}"
	echo ""
	echo ">> FOR NFS BOOT"
	echo -e "${YELLOW} => setenv ethaddr 2E:09:0A:00:BE:11 ${NC}"
	echo -e "${YELLOW} => setenv ipaddr $(echo ${IP_ADDR} | grep 192.168 | head -1 | awk -F '.' '{print $1 "." $2 "." $3}').133; setenv serverip ${IP_ADDR}; setenv NFSROOT \${serverip}:$(pwd)/rootfs ${NC}"
	echo -e "${YELLOW} => setenv bootnfs 'nfs 0x48080000 \${NFSROOT}/boot/Image; nfs 0x48000000 \${NFSROOT}/boot/${SOC_FAMILY_PLUS}-${TARGET_BOARD}.dtb; setenv bootargs rw rootwait earlycon root=/dev/nfs nfsroot=\${NFSROOT} ip=dhcp; booti 0x48080000 - 0x48000000' ${NC}"
	echo -e "${YELLOW} => run bootnfs ${NC}"
	echo ""
}

##########################################################
sudo umount mnt || true
mkdir -p mnt && sudo rm -rfv mnt/*
if [ ! -e Renesas_software/RTK0EF0045Z0024AZJ-v3.0.0-update2.zip ]; then
	echo -e ${YELLOW}'Please download the RTK0EF0045Z0024AZJ-v3.0.0-update2.zip from renesas.com . '${NC}
	exit 1
fi
if [ ! -e Renesas_software/RTK0EF0045Z13001ZJ-v1.21_EN.zip ]; then
	echo -e ${YELLOW}'Please download the RTK0EF0045Z13001ZJ-v1.21_EN.zip from renesas.com . '${NC}
	exit 1
fi
if [ ! -e Renesas_software/RTK0EF0045Z15001ZJ-v0.58_EN.zip ]; then
	echo -e ${YELLOW}'Please download the RTK0EF0045Z15001ZJ-v0.58_EN.zip from renesas.com . '${NC}
	exit 1
fi

##########################################################
sudo chown -R ${USER}.${USER} Renesas_software meta-userboard* build.sh

##########################################################
sudo apt-get install -y gawk wget git-core diffstat unzip texinfo gcc-multilib \
	build-essential chrpath socat libsdl1.2-dev xterm python-crypto cpio python python3 \
	python3-pip python3-pexpect xz-utils debianutils iputils-ping libssl-dev p7zip-full libyaml-dev \
	nfs-kernel-server parted
echo ""

##########################################################
cd ${SCRIP_DIR}
echo -e ${GREEN}'>> RZ/G Verified Linux Package V3.0.0-update1'${NC}
[ ! -d Renesas_software/RTK0EF0045Z0024AZJ-v3.0.0-update2 ] && \
	unzip -o Renesas_software/RTK0EF0045Z0024AZJ-v3.0.0-update2.zip -d Renesas_software
if [ ! -d meta-renesas -o ! -d poky -o ! -d meta-openembedded -o ! -d meta-qt5 ]; then
	tar zxvf Renesas_software/RTK0EF0045Z0024AZJ-v3.0.0-update2/rzv_bsp_v3.0.0.tar.gz
	patch -p1 -l -f --fuzz 3 -i Renesas_software/RTK0EF0045Z0024AZJ-v3.0.0-update2/rzv_v300-to-v300update2.patch
fi

echo -e ${GREEN}'>> RZ MPU Graphics Library Evaluation Version V1.2 for RZ/G2L, RZ/G2LC, and RZ/V2L'${NC}
[ ! -d Renesas_software/RTK0EF0045Z13001ZJ-v1.21_EN ] && \
	unzip -o Renesas_software/RTK0EF0045Z13001ZJ-v1.21_EN.zip -d Renesas_software
[ ! -e meta-rz-features/recipes-graphics/mali/mali-library.bb ] && \
	tar zxvf Renesas_software/RTK0EF0045Z13001ZJ-v1.21_EN/meta-rz-features.tar.gz

echo -e ${GREEN}'>> RZ MPU Video Codec Library Evaluation Version V0.58 for RZ/G2L and RZ/V2L'${NC}
[ ! -d Renesas_software/RTK0EF0045Z15001ZJ-v0.58_EN ] && \
	unzip -o Renesas_software/RTK0EF0045Z15001ZJ-v0.58_EN.zip -d Renesas_software
[ ! -e meta-rz-features/recipes-codec/omx-module/omx-user-module.bb ] && \
	tar zxvf Renesas_software/RTK0EF0045Z15001ZJ-v0.58_EN/meta-rz-features.tar.gz

##########################################################
cd ${SCRIP_DIR}
echo -e ${GREEN}'>> meta-python2 '${NC}
git clone git://git.openembedded.org/meta-python2 || true
git -C meta-python2 checkout -b develop 07dca1e54f82a06939df9b890c6d1ce1e3197f75 || true
echo -e ${GREEN}'>> meta-clang '${NC}
git clone https://github.com/kraj/meta-clang || true
git -C meta-clang checkout -b develop e63d6f9abba5348e2183089d6ef5ea384d7ae8d8 || true
echo -e ${GREEN}'>> meta-browser '${NC}
git clone https://github.com/OSSystems/meta-browser || true
git -C meta-browser checkout -b develop dcfb4cedc238eee8ed9bd6595bdcacf91c562f67 || true

##########################################################
cd ${SCRIP_DIR}
echo -e ${GREEN}'>> oe-init-build-env '${NC}
source poky/oe-init-build-env ${BUILD_DIR}
echo ""

##########################################################
cd ${SCRIP_DIR}/${BUILD_DIR}
echo -e ${GREEN}'>> local.conf bblayers.conf '${NC}
/bin/cp -fv ../meta-userboard-g2l/docs/template/conf/${TARGET_BOARD}/local.conf ./conf/local.conf
/bin/cp -fv ../meta-userboard-g2l/docs/template/conf/${TARGET_BOARD}/bblayers.conf ./conf/bblayers.conf
/bin/cp -Rpfv ../meta-userboard-g2l/conf/machine/${TARGET_BOARD}.conf ../meta-renesas/conf/machine
echo ""

##########################################################
echo -e ${GREEN}'>> show-layers '${NC}
bitbake-layers show-layers
echo ""
echo -e ${GREEN}'>> core-image '${NC}
cd ${SCRIP_DIR}/${BUILD_DIR}
bitbake ${CORE_IMAGE} -v
echo ""

##########################################################
echo -e "${GREEN}>> exported rootfs ${NC}"
cd ${SCRIP_DIR}
mkdir -p rootfs
sudo /bin/rm -rf rootfs/*
sudo tar zxf ${BUILD_DIR}/tmp/deploy/images/${TARGET_BOARD}/${CORE_IMAGE}-${TARGET_BOARD}.tar.gz -C rootfs
sudo tar zxf ${BUILD_DIR}/tmp/deploy/images/${TARGET_BOARD}/modules-${TARGET_BOARD}.tgz -C rootfs
sudo /bin/cp -Rpfv ${BUILD_DIR}/tmp/deploy/images/${TARGET_BOARD}/$(ls -l ${BUILD_DIR}/tmp/deploy/images/${TARGET_BOARD}/modules-${TARGET_BOARD}.tgz | awk '{print $11}') rootfs/boot/modules-${TARGET_BOARD}.tgz
sudo /bin/cp -Rpfv ${BUILD_DIR}/tmp/deploy/images/${TARGET_BOARD}/$(ls -l ${BUILD_DIR}/tmp/deploy/images/${TARGET_BOARD}/${CORE_IMAGE}-${TARGET_BOARD}.tar.gz | awk '{print $11}') rootfs/boot/${CORE_IMAGE}-${TARGET_BOARD}.tar.gz
cd ${BUILD_DIR}/tmp/deploy/images/${TARGET_BOARD}
for D in $(ls -l ${SOC_FAMILY}*.dtb | grep '\->' | awk '{print $9}' | xargs file | awk '{print $1}' | sed 's!:!!g'); do
	L=${D}; S=$(file ${L} | awk '{print $5}')
	sudo /bin/cp -Rpf ${S} ${SCRIP_DIR}/rootfs/boot/${L}
done
cd -
sudo chmod 777 rootfs/boot
sudo chown -R ${USER}.${USER} rootfs/boot/*
echo -e "${GREEN}>> Please update /etc/exports and run 'sudo /etc/init.d/nfs-kernel-server restart' ${NC}"
echo -e ${GREEN}"${SCRIP_DIR}/rootfs   *(rw,sync,no_root_squash,no_subtree_check)"${NC}
echo ""

##########################################################
cd ${SCRIP_DIR}
if [ $(ls /dev/disk/by-id | grep SD_MMC | wc -l) -eq 0 \
	-a $(ls /dev/disk/by-id | grep Generic_USB_Flash_Disk | wc -l) -eq 0 \
	-a $(ls /dev/disk/by-id | grep General_USB_Flash_Disk | wc -l) -eq 0 \
	-a $(ls /dev/disk/by-id | grep usb-JetFlash | wc -l) -eq 0 \
	-a $(ls /dev/disk/by-id | grep usb-USB_Mass_Storage_Device | wc -l) -eq 0 ]; then
	echo -e "${GREEN}>> ${CORE_IMAGE}-${TARGET_BOARD}.tar.gz ${NC}"
	cd ${SCRIP_DIR}
	ls -ld --color ${BUILD_DIR}/tmp/deploy/images/${TARGET_BOARD}
	ls -l --color ${BUILD_DIR}/tmp/deploy/images/${TARGET_BOARD}
	echo ""
	echo -e "${GREEN}>> all succeeded ${NC}"
	print_boot_example
	exit 0
fi

##########################################################
echo -e "${GREEN}>> SD_MMC / Generic_USB_Flash_Disk / General_USB_Flash_Disk / usb-JetFlash / usb-USB_Mass_Storage_Device ${NC}"
cd ${SCRIP_DIR}
if [ $(ls /dev/disk/by-id | grep usb-Generic-_SD_MMC | wc -l) -ne 0 ]; then
	SDDEV=$(ls -l /dev/disk/by-id/usb-Generic-_SD_MMC* | grep -v part | awk -F '->' '{print $2}' | sed 's/ //g' | sed 's/\.//g' | sed 's/\///g')
elif [ $(ls /dev/disk/by-id | grep usb-Generic_USB_Flash_Disk | wc -l) -ne 0 ]; then
	SDDEV=$(ls -l /dev/disk/by-id/usb-Generic_USB_Flash_Disk* | grep -v part | awk -F '->' '{print $2}' | sed 's/ //g' | sed 's/\.//g' | sed 's/\///g')
elif [ $(ls /dev/disk/by-id | grep usb-General_USB_Flash_Disk | wc -l) -ne 0 ]; then
	SDDEV=$(ls -l /dev/disk/by-id/usb-General_USB_Flash_Disk* | grep -v part | awk -F '->' '{print $2}' | sed 's/ //g' | sed 's/\.//g' | sed 's/\///g')
elif [ $(ls /dev/disk/by-id | grep usb-USB_Mass_Storage_Device | wc -l) -ne 0 ]; then
	SDDEV=$(ls -l /dev/disk/by-id/usb-USB_Mass_Storage_Device_* | grep -v part | awk -F '->' '{print $2}' | sed 's/ //g' | sed 's/\.//g' | sed 's/\///g')
else
	SDDEV=$(ls -l /dev/disk/by-id/usb-JetFlash* | grep -v part | awk -F '->' '{print $2}' | sed 's/ //g' | sed 's/\.//g' | sed 's/\///g')
fi
SDDEV=/dev/${SDDEV}

##########################################################
echo -e "${GREEN}>> SD_MMC fdisk ${NC}"
sudo umount ${SDDEV}1 || true
sudo umount ${SDDEV}2 || true
sudo umount ${SDDEV}3 || true
sudo umount ${SDDEV}4 || true
sudo umount ${SDDEV}5 || true
sudo umount ${SDDEV}6 || true
sudo umount ${SDDEV}7 || true
sudo umount ${SDDEV}8 || true
sed -e 's/\s*\([\+0-9a-zA-Z]*\).*/\1/' << EOF | sudo fdisk $SDDEV
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

 +1024M
 n
 p
 2


 t
 1
 c
 t
 2
 83
 p
 w
 q
EOF

##########################################################
echo -e "${GREEN}>> SD_MMC boot ${NC}"
echo yes | sudo mkfs.vfat -n BOOT ${SDDEV}1
sudo mount -t vfat ${SDDEV}1 mnt
sudo rm -rfv ./mnt/*
sudo /bin/cp ${BUILD_DIR}/tmp/deploy/images/${TARGET_BOARD}/$(ls -l ${BUILD_DIR}/tmp/deploy/images/${TARGET_BOARD}/Image | awk '{print $11}') mnt/Image
sudo /bin/cp ${BUILD_DIR}/tmp/deploy/images/${TARGET_BOARD}/r*.dtb mnt/
sudo /bin/cp ${BUILD_DIR}/tmp/deploy/images/${TARGET_BOARD}/$(ls -l ${BUILD_DIR}/tmp/deploy/images/${TARGET_BOARD}/modules-${TARGET_BOARD}.tgz | awk '{print $11}') mnt/modules-${TARGET_BOARD}.tgz
sudo umount mnt

##########################################################
echo -e "${GREEN}>> SD_MMC boot ${NC}"
echo yes | sudo mkfs.vfat -n BOOT ${SDDEV}1
sudo mount -t vfat ${SDDEV}1 mnt
sudo rm -rfv ./mnt/*
sudo /bin/cp ${BUILD_DIR}/tmp/deploy/images/${TARGET_BOARD}/$(ls -l ${BUILD_DIR}/tmp/deploy/images/${TARGET_BOARD}/Image | awk '{print $11}') mnt/Image
sudo /bin/cp ${BUILD_DIR}/tmp/deploy/images/${TARGET_BOARD}/r*.dtb mnt/
sudo /bin/cp ${BUILD_DIR}/tmp/deploy/images/${TARGET_BOARD}/$(ls -l ${BUILD_DIR}/tmp/deploy/images/${TARGET_BOARD}/modules-${TARGET_BOARD}.tgz | awk '{print $11}') mnt/modules-${TARGET_BOARD}.tgz
sudo umount mnt

##########################################################
echo -e "${GREEN}>> SD_MMC rootfs ${NC}"
echo yes | sudo mkfs.ext4 -E lazy_itable_init=1,lazy_journal_init=1 ${SDDEV}2 -L rootfs -U 614e0000-0000-4b53-8000-1d28000054a9 -jDv
sudo tune2fs -O ^has_journal ${SDDEV}2
sudo mount -t ext4 -O noatime,nodirame,data=writeback ${SDDEV}2 mnt
sudo rm -rfv ./mnt/*
sudo tar zxvf ${BUILD_DIR}/tmp/deploy/images/${TARGET_BOARD}/${CORE_IMAGE}-${TARGET_BOARD}.tar.gz -C mnt/
sudo tar zxvf ${BUILD_DIR}/tmp/deploy/images/${TARGET_BOARD}/modules-${TARGET_BOARD}.tgz -C mnt/
sudo sync &
(for n in $(seq 1 1440); do sleep 1 ; if [ $(grep -e Dirty: /proc/meminfo | awk '{print $2}') -lt 4096 ]; then break ; fi; done ; killall watch ;) &
watch -d -e grep -e Dirty: -e Writeback: /proc/meminfo
echo -e "${GREEN} >> SD_MMC umount ${NC}"
sudo umount mnt
sudo fsck.ext4 -y ${SDDEV}2

##########################################################
print_boot_example
exit 0

