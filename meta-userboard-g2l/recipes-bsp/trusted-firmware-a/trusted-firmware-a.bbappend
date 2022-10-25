FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

COMPATIBLE_MACHINE_rzg2l = "(smarc-rzg2l|smarc-rzg2lc|smarc-rzg2ul|greenpak-rzg2l|smarc-rzv2l|rzv2l-dev)"

# For RZ/G2L Series
PLATFORM_greenpak-rzg2l = "g2l"
EXTRA_FLAGS_greenpak-rzg2l = "BOARD=smarc_pmic_2"
PMIC_EXTRA_FLAGS_greenpak-rzg2l = "BOARD=greenpak-rzg2l"
FLASH_ADDRESS_BL2_BP_greenpak-rzg2l = "00000"
FLASH_ADDRESS_FIP_greenpak-rzg2l = "1D200"

SRC_URI_append = " \
	file://rz_board.mk \
	file://0001-GREENPAK_RZG2L-add-DDR4-1GB-IS43QR16512A.patch \
	file://0002-GREENPAK_RZG2L-add-SPI-Flash-IS25WP512M.patch \
	file://0003-GREENPAK_RZG2L-enable-SPI-Flash-IS25WP512M.patch \
"

do_addboards () {
	mkdir -p ${S}/plat/renesas/rz/board/greenpak-rzg2l
	cp -fv ${WORKDIR}/rz_board.mk ${S}/plat/renesas/rz/board/greenpak-rzg2l
}

addtask do_addboards before do_configure after do_patch
