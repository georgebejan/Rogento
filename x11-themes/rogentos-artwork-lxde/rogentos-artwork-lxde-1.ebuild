# Copyright 2004-2011 Sabayon Promotion
# Copyright 2012 Rogentos
# Distributed under the terms of the GNU General Public License v2
# Original Authors Sabayon Team
#

EAPI=3

inherit base

DESCRIPTION="Rogentos LXDE Artwork"
HOMEPAGE="http://www.rogentos.ro"
SRC_URI="http://pkg.rogentos.ro/~rogentos/distro/${CATEGORY}/${PN}/${PN}-${PVR}.tar.gz
	http://pkg2.rogentos.ro/~noxis/distro/${CATEGORY}/${PN}/${PN}-${PVR}.tar.gz"

LICENSE="CCPL-Attribution-ShareAlike-3.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""
RDEPEND="x11-themes/rogentos-artwork-core"

S="${WORKDIR}/lxdm"

src_install () {
	cd "${S}" || die "Cannot cd into folder"
	dodir /usr/share/lxdm/themes/Rogentos || die "Cannot dodir"
	insinto /usr/share/lxdm/themes/Rogentos || die "Cannot insinto"
	doins Rogentos/* || die "Cannot doins"

	insinto /etc/lxdm/ || die "Cannot insinto folder"
	doins "${S}"/lxdm.conf /etc/lxdm/ || die "Could not copy lxdm.conf"
}
