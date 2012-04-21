# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v3
# $Header: $

EAPI="4"

inherit unpacker gnome2-utils python

DESCRIPTION="An extension for displaying weather notifications in GNOME Shell."
HOMEPAGE="https://github.com/simon04/gnome-shell-extension-weather"
SRC_URI="mirror://sabayon/${CATEGORY}/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
IUSE=" "
KEYWORDS="~amd64 ~x86"

EXTENSIONS="/usr/share/gnome-shell/extensions"
SCHEMAS="/usr/share/glib-2.0/schemas"
DESKTOPS="/usr/share/applications"   

S="${WORKDIR}/gnome-shell-extension-weather-0.0_p20111110"

COMMON_DEPEND="
        >=dev-libs/glib-2.26
        >=gnome-base/gnome-desktop-3.2.1"
RDEPEND="${COMMON_DEPEND}
        gnome-base/gnome-desktop
        media-libs/clutter:1.0  
        net-libs/telepathy-glib 
        x11-libs/gtk+:3
        x11-libs/pango"
DEPEND="${COMMON_DEPEND}
        sys-devel/gettext
        >=dev-util/pkgconfig-0.22
        >=dev-util/intltool-0.26 
        gnome-base/gnome-common" 

src_compile() {
	cd ${S}
	./autogen.sh --prefix=/usr
	emake

	mv weather-extension-configurator{.py,}
        dobin weather-extension-configurator

        doins weather-extension-configurator.desktop

	einstall
}

pkg_setup() {
    python_set_active_version 2
    python_pkg_setup
}
