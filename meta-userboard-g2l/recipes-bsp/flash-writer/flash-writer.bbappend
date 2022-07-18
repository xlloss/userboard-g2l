FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI_append = " \
	file://qspiFlash-writer-helper \
"

do_deploy_append () {
	install -d ${DEPLOYDIR}
	install -m 755 ${WORKDIR}/qspiFlash-writer-helper ${DEPLOYDIR}
}

