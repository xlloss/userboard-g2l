
PACKAGE_ARCH = "${MACHINE_ARCH}"

DEPENDS += " \
	mali-library \
	omx-user-module \
"

EXTRA_OEMAKE_append = " V=1"
EXTRA_OECONF += " \
	--enable-ffplay \
"

PACKAGECONFIG[omx] = "--enable-omx,--disable-omx"
PACKAGECONFIG[opencl] = "--enable-opencl,--disable-opencl OpenCL"

PACKAGECONFIG = " \
	avdevice avfilter avcodec avformat swresample swscale postproc avresample \
	alsa bzlib gpl lzma theora x264 zlib \
	${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xv xcb', '', d)} \
	${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'sdl2', '', d)} \
	omx \
	opencl \
	mp3lame \
	speex \
	openssl \
"

#PACKAGECONFIG += " fdk-aac "
