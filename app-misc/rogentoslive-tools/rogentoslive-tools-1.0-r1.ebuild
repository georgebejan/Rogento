# Copyright 2004-2012 Sabayon
# Copyright 2012 Rogentos
# Distributed under the terms of the GNU General Public License v2
# Original Authors Sabayon Team
# Maintainer BlackNoxis <stefan.cristian at rogentos.ro>

inherit eutils

DESCRIPTION="Rogentos Live tools for autoconfiguration of the system"
HOMEPAGE="http://www.rogentos.ro/"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="!app-misc/livecd-tools
	!app-misc/sabayonlive-tools
	app-admin/eselect-opengl
	dev-util/dialog
	sys-apps/gawk
	sys-apps/pciutils
	>=sys-apps/keyboard-configuration-helpers-2.6"

src_unpack() {
	cd "${WORKDIR}"
	cp "${FILESDIR}"/${PV}/*-functions.sh . -p
	cp "${FILESDIR}"/${PV}/net-setup . -p
	cp "${FILESDIR}"/${PV}/x-setup-init.d . -p
	cp "${FILESDIR}"/${PV}/installer-gui . -p
	cp "${FILESDIR}"/${PV}/installer-text . -p
	cp "${FILESDIR}"/${PV}/x-setup-configuration . -p
	cp "${FILESDIR}"/${PV}/bashlogin . -p
	cp "${FILESDIR}"/${PV}/opengl-activator . -p
	cp "${FILESDIR}"/${PV}/rogentoslive . -p
	cp "${FILESDIR}"/${PV}/vga-cmd-parser . -p
	cp "${FILESDIR}"/${PV}/logscript.sh . -p
	cp "${FILESDIR}"/${PV}/sabutil . -p
	cp "${FILESDIR}"/${PV}/livespawn . -p
	cp "${FILESDIR}"/${PV}/cdeject . -p
	cp "${FILESDIR}"/${PV}/xorg.conf.rogentos . -p
}

src_install() {

	cd "${WORKDIR}"

	dosbin x-setup-configuration
	newinitd x-setup-init.d x-setup

	dosbin net-setup
	into /
	dosbin *-functions.sh
	dosbin logscript.sh
	dobin bashlogin
	dobin vga-cmd-parser
	exeinto /usr/bin
	doexe opengl-activator
	doexe livespawn
	doexe sabutil

	dodir /etc/rogentos
	insinto /etc/rogentos

	insinto /etc/X11
	doins xorg.conf.rogentos

	dodir /usr/share/X11/xorg.conf.d
	insinto /usr/share/X11/xorg.conf.d
	doins "${FILESDIR}/${PV}/xorg.conf.d/90-synaptics.conf"

	dodir /usr/share/rogentoslive-tools/xorg.conf.d
	insinto /usr/share/rogentoslive-tools/xorg.conf.d
	# fglrx <12.2 Xv workaround, enabled at runtime
	doins "${FILESDIR}/${PV}/xorg.conf.d/90-fglrx-12.1-and-older-workaround.conf"

	newinitd rogentoslive rogentoslive
	newinitd installer-gui installer-gui
	newinitd installer-text installer-text
	newinitd cdeject cdeject

}
