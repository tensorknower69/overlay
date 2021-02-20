# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Random color flashing starring OpenGL/GLFW"
HOMEPAGE="https://github.com/tensorknower69/flashing"
SRC_URI="https://github.com/tensorknower69/flashing/archive/${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
!games-misc/flashing
media-libs/libglvnd
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	emake PREFIX="${D}"/usr install
}
