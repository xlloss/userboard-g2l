FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

COMPATIBLE_MACHINE_rzg2l = "(smarc-rzg2l|smarc-rzg2lc|smarc-rzg2ul|rzg2l-regulus|smarc-rzv2l|rzv2l-dev)"

# For RZ/G2L Series
PLATFORM_rzg2l-regulus = "g2l"
EXTRA_FLAGS_rzg2l-regulus = "BOARD=smarc_pmic_2"
PMIC_EXTRA_FLAGS_rzg2l-regulus = "BOARD=rzg2l-regulus"
FLASH_ADDRESS_BL2_BP_rzg2l-regulus = "00000"
FLASH_ADDRESS_FIP_rzg2l-regulus = "1D200"

SRC_URI_append = " \
	file://rz_board.mk \
"

do_addboards () {
	mkdir -p ${S}/plat/renesas/rz/board/rzg2l-regulus
	cp -fv ${WORKDIR}/rz_board.mk ${S}/plat/renesas/rz/board/rzg2l-regulus
}

addtask do_addboards before do_configure after do_patch
