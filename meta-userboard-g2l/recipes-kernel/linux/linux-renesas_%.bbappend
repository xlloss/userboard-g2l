FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
	file://panel.cfg \
	file://nfsd.cfg \
	file://dts/r9a07g044l2-regulus.dts \
	file://dts/rzg2l-regulus.dtsi \
"

COMPATIBLE_MACHINE_rzg2l = "(smarc-rzg2l|smarc-rzg2lc|smarc-rzg2ul|rzg2l-regulus|smarc-rzv2l|rzv2l-dev)"

PARALLEL_MAKE = "-j 8"

CFLAGS += " \
        -Wno-maybe-uninitialized \
        -Wno-implicit-fallthr \
        -Wno-implicit-function-declaration \
"

EXTRA_OEMAKE_append = " V=1"

do_patch_append () {
	mkdir -p ${STAGING_KERNEL_DIR}/arch/arm64/boot/dts/renesas
        cp -Rpfv ${WORKDIR}/dts/* ${STAGING_KERNEL_DIR}/arch/arm64/boot/dts/renesas
}
