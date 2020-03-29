FILESEXTRAPATHS_prepend := "${THISDIR}/files/common:${THISDIR}/files/${MACHINE}:${THISDIR}/files:"

DEPENDS_append_dh-stm32mp1-dhcom-pdk2 = "u-boot-mkimage-native"
SRC_URI_append_dh-stm32mp1-dhcom-pdk2 = " file://boot.cmd "
do_compile_append_dh-stm32mp1-dhcom-pdk2 () {
	uboot-mkimage -A arm -T script -C none \
		-d ${WORKDIR}/boot.cmd ${WORKDIR}/boot.scr
}

PATCHES_COMMON = " \
	file://0001-arm-stm32mp1-activate-data-cache-in-SPL-and-before-r.patch \
	file://0002-ARM-stm32-Increase-USB-power-good-delay.patch \
	file://0003-gpio-stm32-support-gpio-ops-in-SPL.patch \
	file://0004-net-dwc_eth_qos-Fully-rewrite-RX-descriptor-field-3.patch \
	file://0005-net-dwc_eth_qos-Correctly-wrap-around-TX-descriptor-.patch \
	file://0006-net-dwc_eth_qos-Flush-the-RX-descriptors-on-init.patch \
	file://0007-net-dwc_eth_qos-Invalidate-RX-descriptor-before-read.patch \
	file://0008-net-dwc_eth_qos-Invalidate-RX-packet-DMA-buffer.patch \
	file://0009-net-dwc_eth_qos-Prevent-DMA-from-writing-updated-RX-.patch \
	file://0010-net-ks8851-Replace-malloc-memset-with-calloc.patch \
	file://0011-net-ks8851-Remove-RXQCR-cache.patch \
	file://0012-net-ks8851-Use-16bit-RXQCR-access.patch \
	file://0013-net-ks8851-Trim-down-struct-ks_net.patch \
	file://0014-net-ks8851-Remove-type_frame_head.patch \
	file://0015-net-ks8851-Clean-up-chip-ID-readout.patch \
	file://0016-net-ks8851-Checkpatch-cleanup.patch \
	file://0017-net-ks8851-Pass-around-driver-private-data.patch \
	file://0018-net-ks8851-Split-non-DM-specific-bits-from-common-co.patch \
	file://0019-net-ks8851-Receive-one-packet-per-recv-call.patch \
	file://0020-net-ks8851-Add-DM-support.patch \
	file://0021-net-ks8851-Add-Kconfig-entries.patch \
	file://0022-ARM-dts-stm32-Define-FMC2-base-address.patch \
	file://0023-ARM-dts-stm32-Add-KS8851-16MLL-ethernet-on-FMC2.patch \
	file://0024-ARM-stm32-Enable-bootd-iminfo-imxtract-on-DHCOM.patch \
	"

SRC_URI_append_dh-stm32mp1-dhcom-pdk2 = " \
	${PATCHES_COMMON} \
	"