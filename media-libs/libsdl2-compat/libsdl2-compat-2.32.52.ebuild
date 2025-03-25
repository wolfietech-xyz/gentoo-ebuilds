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
IUSE="alsa aqua +sdl3 cpu_flags_ppc_altivec cpu_flags_x86_3dnow cpu_flags_x86_mmx cpu_flags_x86_sse cpu_flags_x86_sse2 cpu_flags_x86_sse3 custom-cflags dbus doc fcitx gles1 gles2 haptic ibus jack joystick kms libsamplerate nas opengl oss -pipewire pulseaudio sndio +sound static-libs test udev +video vulkan wayland X xscreensaver"
RESTRICT="!test? ( test )"
REQUIRED_USE="
	alsa? ( sound )
	fcitx? ( dbus )
	gles1? ( video )
	gles2? ( video )
	haptic? ( joystick )
	ibus? ( dbus )
	jack? ( sound )
	kms? ( || ( gles1 gles2 opengl ) )
	nas? ( sound )
	opengl? ( video )
	pulseaudio? ( sound )
	sndio? ( sound )
	test? ( static-libs )
	vulkan? ( video )
	wayland? ( gles2 )
	xscreensaver? ( X )
"

DEPEND="virtual/opengl >=media-libs/libsdl3-3.0"
BDEPEND="dev-build/cmake >=media-libs/libsdl3-3.0"
RDEPEND="virtual/opengl >=media-libs/libsdl3-3.0 virtual/libc"


REPLACES="media-libs/libsdl2"
PROVIDE="media-libs/libsdl2-${PV}"
CONFLICTS="media-libs/libsdl2 #libsdl2-compat replaces libsdl2"

MULTILIB_WRAPPED_HEADERS=(
	/usr/include/SDL2/SDL_config.h
	/usr/include/SDL2/SDL_platform.h
	/usr/include/SDL2/begin_code.h
	/usr/include/SDL2/close_code.h
)


multilib_src_configure() {
        cmake_use_find_package sdl3 SDL3
        cmake_src_configure
}

multilib_src_compile() {
        cmake_src_minimal_compile
}

multilib_src_install() {
        cmake_src_install
}
