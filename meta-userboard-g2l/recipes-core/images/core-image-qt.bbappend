inherit populate_sdk_qt5
TOOLCHAIN_HOST_TASK_append = " nativesdk-qtwayland-tools "
FEATURE_PACKAGES_tools-sdk += " packagegroup-qt5-toolchain-target kernel-devsrc "

IMAGE_INSTALL_append = " \
	tslib nfs-utils e2fsprogs e2fsprogs-resize2fs udev curl bc usbutils wget \
	mmc-utils squashfs-tools iputils sqlite3 libevent \
	devmem2 i2c-tools libgpiod sysbench \
	\
	libdrm-tests libdrm-kms libdrm \
	libpng libjpeg-turbo pv fbida yavta \
	\
	mpg123 libexif giflib \
"

IMAGE_INSTALL_append = " \
	bayer2raw drm2png \
	mkfs-helper \
"

IMAGE_INSTALL_append = " \
	${@oe.utils.conditional("BROWSER_LAYER", "True", "chromium-ozone-wayland", "", d)} \
"
