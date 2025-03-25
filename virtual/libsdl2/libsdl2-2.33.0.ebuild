# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit multilib-build

VIRTUAL_PACKAGE=virtual/libsdl2
DESCRIPTION="Virtual package for libsdl2, encompassing both native and SDL3 via SDL2-compat"


HOMEPAGE="https://www.libsdl.org/"
LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~alpha amd64 arm arm64 ~hppa ~loong ~mips ppc ppc64 ~riscv ~s390 sparc x86 ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x64-solaris"
RESTRICT="primaryuri"

#IUSE="-sdl2 +sdl3"

RDEPEND="|| ( media-libs/libsdl2[${MULTILIB_USEDEP}] media-libs/libsdl2-compat[${MULTILIB_USEDEP}] )"



