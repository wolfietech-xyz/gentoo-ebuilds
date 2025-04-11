# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit multilib-build

VIRTUAL_PACKAGE=virtual/libtrackersparql
DESCRIPTION="Virtual package for libtinysparql-3.0, new ebuilds should direct depend on app-misc/tinysparql"

HOMEPAGE="https://www.gnome.org/"
LICENSE="GPL-2+ LGPL-2.1+"
SLOT="3/0" # libtracker-sparql-3.0 soname version
KEYWORDS="~alpha amd64 ~arm arm64 ~loong ~ppc ~ppc64 ~riscv ~sparc x86"
RESTRICT="primaryuri"
IUSE="+localsearch miners introspection"

RDEPEND="
	localsearch? (
		!app-misc/tracker
		>=app-misc/tinysparql-3.8[localsearch]
		introspection? ( >=app-misc/tinysparql-3.8[introspection] )
	)
	miners? (
		<=app-misc/tracker-3.7.3[miners]
		!app-misc/tinysparql
		introspection? ( <app-misc/tracker-3.7.3[introspection] )
	)
"


