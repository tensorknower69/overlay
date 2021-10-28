# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="High-performance implementation of lolcat"
HOMEPAGE="https://github.com/jaseg/lolcat"
SRC_URI="https://github.com/jaseg/lolcat/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/lolcat-${PV}"

LICENSE="WTFPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="+lolcat censor"
REQUIRED_USE="|| ( lolcat censor )"
DEPEND="!games-misc/lolcat"
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	use "lolcat" && emake lolcat
	use "censor" && emake censor
}

src_install() {
	use lolcat && dobin lolcat
	use censor && dobin censor
}
