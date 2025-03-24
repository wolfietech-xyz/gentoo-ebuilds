# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake-multilib flag-o-matic

MY_P="sdl2-compat-${PV}" # Corrected typo
DESCRIPTION="libsdl2 compatible api built against libsdl3"
HOMEPAGE="https://www.libsdl.org"
SRC_URI="https://www.libsdl.org/release/${MY_P}.tar.gz"
S="${WORKDIR}/${MY_P}"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~loong ~mips ~ppc ~ppc64 ~riscv ~sparc ~x86"
IUSE="alsa aqua cpu_flags_ppc_altivec cpu_flags_x86_sse cpu_flags_x86_sse2 cpu_flags_x86_sse3 dbus doc fcitx gles1 gles2 +haptic ibus jack +joystick pipewire wayland sdl3 test" # example IUSE flags.
RESTRICT="!test? ( test )"

DEPEND="virtual/opengl >=media-libs/sdl3-3.0"
BDEPEND="dev-util/cmake >=media-libs/sdl3-3.0"
RDEPEND="virtual/opengl >=media-libs/sdl3-3.0 virtual/libc"

REPLACES=">=media-libs/libsdl2-2.0" # Adjust version as needed
PROVIDE="media-libs/libsdl2-${PV}"
CONFLICTS="media-libs/libsdl2-*"

src_configure() {
        cmake_use_find_package sdl3 SDL3
        cmake_src_configure
}

src_compile() {
        cmake_src_compile
}

src_install() {
        cmake_src_install
}
