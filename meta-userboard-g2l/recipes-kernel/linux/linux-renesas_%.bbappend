FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
	file://nfsd.cfg \
"

COMPATIBLE_MACHINE_rzg2l = "(smarc-rzg2l|smarc-rzg2lc|smarc-rzg2ul|rzg2l-reg|smarc-rzv2l|rzv2l-dev)"

PARALLEL_MAKE = "-j 8"

CFLAGS += " \
        -Wno-maybe-uninitialized \
        -Wno-implicit-fallthr \
        -Wno-implicit-function-declaration \
"

EXTRA_OEMAKE_append = " V=1"
