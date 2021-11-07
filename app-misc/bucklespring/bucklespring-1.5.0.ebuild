# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Nostalgia bucklespring keyboard sound"
HOMEPAGE="https://github.com/zevv/bucklespring"
SRC_URI="https://github.com/zevv/bucklespring/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="X libinput"
REQUIRED_USE="^^ ( X libinput )"

DEPEND="
media-libs/openal
media-libs/alure
X? (
	x11-libs/libXtst
	x11-libs/libX11
)
libinput? (
	dev-libs/libinput
)
"
RDEPEND="${DEPEND}"
BDEPEND="dev-util/pkgconf"

src_compile() {
	if use X; then
		emake PATH_AUDIO="/usr/share/${PN}/wav"
	else
		emake libinput=1 PATH_AUDIO="/usr/share/${PN}/wav"
	fi
}

src_install() {
	dobin buckle
	dodir "/usr/share/${PN}"
	cp -r "${S}/wav" "${D}/usr/share/${PN}" || die "Unable to copy wav files into ${wav_dir}"
}
