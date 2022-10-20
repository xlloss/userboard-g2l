FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
	file://i2c.cfg \
	file://panel.cfg \
	file://nfsd.cfg \
	file://dts/r9a07g044l2-greenpak.dts \
	file://dts/greenpak-rzg2l.dtsi \
"

COMPATIBLE_MACHINE_rzg2l = "(smarc-rzg2l|smarc-rzg2lc|smarc-rzg2ul|greenpak-rzg2l|smarc-rzv2l|rzv2l-dev)"

PARALLEL_MAKE = "-j 8"

CFLAGS += " \
        -Wno-maybe-uninitialized \
        -Wno-implicit-fallthr \
        -Wno-implicit-function-declaration \
"

EXTRA_OEMAKE_append = " V=1"

do_patch_append () {
	mkdir -p ${STAGING_KERNEL_DIR}/arch/arm64/boot/dts/renesas
	cp -Rpfv ${WORKDIR}/dts/r9a07g044l2-greenpak.dts ${STAGING_KERNEL_DIR}/arch/arm64/boot/dts/renesas
	cp -Rpfv ${WORKDIR}/dts/greenpak-rzg2l.dtsi ${STAGING_KERNEL_DIR}/arch/arm64/boot/dts/renesas
}
