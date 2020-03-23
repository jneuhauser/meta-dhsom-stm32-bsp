FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
	file://0001-Fix-compilation-of-linuxdmabuf-compositor-plugin.patch \
	"
PACKAGECONFIG_mainlinestm32mp1 = " \
    wayland-client \
    wayland-server \
    wayland-egl \
    wayland-drm-egl-server-buffer \
    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xcomposite-egl xcomposite-glx', '', d)} \
"